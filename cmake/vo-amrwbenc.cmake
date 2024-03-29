cmake_minimum_required(VERSION 3.5)
project(vo-amrwbenc)
set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_PATCH 3)
set(VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
set(PACKAGE_VERSION "${VERSION}")

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" ON)
option(ENABLE_ASM "Enable asm optimizations" OFF)
option(EXAMPLE "Build example program" ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
    amrwbenc/inc
    common/include
    
)
add_definitions(-Wno-parentheses-equality)

file(GLOB src_enc wrapper.c common/cmnMemory.c amrwbenc/src/*.c)
file(GLOB hdr_enc common/include/*.h amrwbenc/inc/*.h amrwbenc/inc/*.tab)
set(hdr_public enc_if.h)

if(ENABLE_ASM)
    if(CMAKE_SYSTEM_PROCESSOR MATCHES "^arm" OR CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")    
        enable_language(ASM_NASM)
        file(GLOB asm_armv7 amrwbenc/src/asm/ARMV7/*.s)
        add_library(asmobj OBJECT ${asm_armv7})
        target_compile_definitions(asmobj PUBLIC ARM ARMV7 ASM_OPT)
        message(STATUS "Add ARMv7-Neon ASM code")
    endif()
    if(ARMV5E)
        enable_language(ASM_NASM)
        file(GLOB src_enc_armv5e amrwbenc/src/asm/ARMV5E/*.s)
        add_library(asmobj OBJECT ${src_enc_armv5e})
        target_compile_definitions(asmobj ARM ASM_OPT)
    endif()
endif()

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined" )

add_library(objlib OBJECT ${src_enc} ${hdr_enc})
set_target_properties(objlib PROPERTIES POSITION_INDEPENDENT_CODE 1)

function(add_lib sfx lnk)
    if(ENABLE_ASM)
        add_library(${PROJECT_NAME}${sfx} ${lnk} $<TARGET_OBJECTS:objlib> $<TARGET_OBJECTS:asmobj>)
    else()
        add_library(${PROJECT_NAME}${sfx} ${lnk} $<TARGET_OBJECTS:objlib>)
    endif()
    set_target_properties(${PROJECT_NAME}${sfx} PROPERTIES
        VERSION ${VERSION}
        SOVERSION ${VERSION_MAJOR}
        OUTPUT_NAME ${PROJECT_NAME}
    )
    install(TARGETS ${PROJECT_NAME}${sfx}
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
    )
endfunction()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

if(EXAMPLE)
    add_executable(amrwb-enc amrwb-enc.c wavreader.c)
    target_link_libraries(amrwb-enc ${PROJECT_NAME})
    install(TARGETS amrwb-enc RUNTIME DESTINATION bin)
endif()

set(prefix "${CMAKE_INSTALL_PREFIX}")
set(exec_prefix "\${prefix}")
set(libdir "\${prefix}/lib")
set(includedir "\${prefix}/include")
configure_file(vo-amrwbenc.pc.in ${CMAKE_CURRENT_BINARY_DIR}/vo-amrwbenc.pc)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/vo-amrwbenc.pc DESTINATION lib/pkgconfig)
install(FILES ${hdr_public} DESTINATION include/${PROJECT_NAME})
install(FILES COPYING README amrwbenc/MODULE_LICENSE_APACHE2 DESTINATION share/doc/${PROJECT_NAME})
