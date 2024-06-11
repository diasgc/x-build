cmake_minimum_required(VERSION 3.5)

file(READ src/xvid.h VERSION_F)
string(REGEX MATCH "XVID_VERSION[ ]+XVID_MAKE_VERSION.([0-9]*),([0-9]*),([-0-9]*)" _ ${VERSION_F})

set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_2})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_3})
if(PROJECT_VERSION_PATCH LESS 0)
    set(PROJECT_VERSION_PATCH 0)
endif()
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(xvidcore 
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "Xvid decoder/encoder library"
    HOMEPAGE_URL "https://labs.xvid.com"
)

include(GNUInstallDirs)

#include(CheckIncludeFile)

#check_include_file(stdio.h HAVE_STDIO_H)
#check_include_file(stdlib.h HAVE_STDLIB_H)
#check_include_file(string.h HAVE_STRING_H)
#check_include_file(inttypes.h HAVE_INTTYPES_H)
#check_include_file(stdint.h HAVE_STDINT_H)
#check_include_file(strings.h HAVE_STRINGS_H)
#check_include_file(sys/stat.h HAVE_SYSSTAT_H)
#check_include_file(sys/types.h HAVE_SYSTYPES_H)
#check_include_file(unistd.h HAVE_UNISTD_H)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    add_compile_definitions(-DARCH_IS_64BIT)
else()
    add_compile_definitions(ARCH_IS_32BIT)
endif()

message("Xvidcore ${PROJECT_VERSION}")

#Uncomment for debug makefile
#set(CMAKE_VERBOSE_MAKEFILE ON)

include_directories(
    src
    src/bitstream
    src/dct
    src/image
    src/motion
    src/plugins
    src/prediction
    src/quant
    src/utils
)

set(xvidcore_LIC LICENSE)
file(GLOB xvidcore_DOC doc/*.md)
set(xvidcore_HEADER src/xvid.h)
file(GLOB xvidcore_H src/*.h src/bitstream/*.h src/dct/*.h src/image/*.h src/motion/*.h src/plugins/*.h src/prediction/*.h src/quant/*.h src/utils/*.h)
file(GLOB xvidcore_C src/*.c src/bitstream/*.c src/dct/*.c src/image/*.c src/motion/*.c src/plugins/*.c src/prediction/*.c src/quant/*.c src/utils/*.c)

file(GLOB_RECURSE xvidcore_ASM src/*.asm)
file(GLOB_RECURSE xvidcore_ASM_H src/*.inc)

if(CMAKE_SYSTEM_PROCESSOR MATCHES x86_64)
    option(ENABLE_ASM "Enable asm (x86)"  ON)
    if(ENABLE_ASM)
        # error finding colorspace_mmx.inc see
        add_compile_definitions(-DARCH_IS_X86_64)
        enable_language(ASM_NASM)
        set(CMAKE_ASM_NASM_COMPILER /usr/x86_64-linux-android/bin/yasm)
        add_library(libxvidcore_asm_obj OBJECT ${xvidcore_ASM} ${xvidcore_ASM_H})
        #target_compile_options(libxvidcore_asm_obj PRIVATE -x assembler-with-cpp)
    else()
        add_compile_definitions(-DARCH_IS_GENERIC)
    endif()
    list(APPEND WFLAGS "-Wno-shift-negative-value")
    #add_definitions("")
else()
    add_compile_definitions(-DARCH_IS_GENERIC)
endif()



option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" OFF)
option(BUILD_EXECUTABLES "Build executables" OFF)
option(INSTALL_DOCS      "Install Manpages"  ON)

message(STATUS "${PROJECT_NAME} version ${PROJECT_VERSION}
    Build static libs ${BUILD_STATIC_LIBS}
    Build shared libs ${BUILD_SHARED_LIBS}
    Build executables ${BUILD_EXECUTABLES}
    Install manuals   ${INSTALL_DOCS}"
)

list(APPEND WFLAGS "-Wno-shift-negative-value" "-Wno-format" "-Wno-pointer-sign")

# Libraries
add_library(libxvidcore_obj OBJECT ${xvidcore_C} ${xvidcore_H})
target_compile_options(libxvidcore_obj PUBLIC ${WFLAGS})

macro(add_lib sfx lnk)
    if(ENABLE_ASM)
        add_library(xvidcore${sfx} ${lnk} $<TARGET_OBJECTS:libxvidcore_obj> $<TARGET_OBJECTS:libxvidcore_asm_obj>)
    else()
        add_library(xvidcore${sfx} ${lnk} $<TARGET_OBJECTS:libxvidcore_obj>)
    endif()
    set_target_properties(xvidcore${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME xvidcore
    )
    install(TARGETS xvidcore${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

macro(build_executable app)
    add_executable(${app} examples/${app}.c ${xvidcore_HEADER} src/utils/emms.h)
    target_link_libraries(${app} xvidcore)
    target_compile_options(${app} PUBLIC ${WFLAGS})
    set_target_properties(${app} PROPERTIES OUTPUT_NAME ${app}) #LINK_FLAGS_RELEASE -s
endmacro(build_executable app)

# Executables
if(BUILD_EXECUTABLES)
    build_executable(xvid_bench)
    build_executable(xvid_decraw)
    build_executable(xvid_encraw)
    install(TARGETS xvid_bench xvid_decraw xvid_encraw RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
endif()

if(EXISTS ${XVID_PKGCONFIG_IN})
    # PkgConfig file
    set(PREFIX ${CMAKE_INSTALL_PREFIX})
    set(LIBDIR "\${prefix}/lib")
    set(INCLUDEDIR "\${prefix}/include")
    set(VERSION ${PROJECT_VERSION})

    configure_file(${XVID_PKGCONFIG_IN} libxvidcore.pc @ONLY)
    install(FILES ${CMAKE_BINARY_DIR}/libxvidcore.pc
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
    )
endif()


# Headers
install(FILES ${xvidcore_HEADER} DESTINATION include)

# Licence, Docs and Manuals
install(FILES ${xvidcore_LIC} DESTINATION ${CMAKE_INSTALL_DOCDIR})
if(INSTALL_DOCS)
    if(NOT xvidcore_DOC STREQUAL "")
        install(FILES ${xvidcore_DOC} DESTINATION ${CMAKE_INSTALL_DOCDIR})
    endif()
    if(NOT ${xvidcore_MAN} STREQUAL "")
        install(FILES ${xvidcore_MAN} DESTINATION ${CMAKE_INSTALL_MANDIR})
    endif()
endif()