cmake_minimum_required(VERSION 3.0)

include(GNUInstallDirs)

file(READ libmp3lame/version.h VERSION_F)
string(REGEX MATCH "LAME_MAJOR_VERSION[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "LAME_MINOR_VERSION[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "LAME_PATCH_VERSION[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_1})
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(mp3lame 
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "LAME is a high quality MPEG Audio Layer III (MP3) encoder"
    HOMEPAGE_URL "https://lame.sourceforge.io"
    LIBS_PUBLIC "-lmp3lame"
)

set(GREP_ARGS -oP "^PACKAGE_VERSION='\\K\\d+\\.\\d+" ${CMAKE_CURRENT_SOURCE_DIR}/configure)
execute_process(
    COMMAND
    grep ${GREP_ARGS}
    OUTPUT_VARIABLE CMAKE_PROJECT_VERSION
    ERROR_VARIABLE ERR)
message(STATUS "getting version..." ${CMAKE_PROJECT_VERSION} ${ERR})

option(INSTALL_MANPAGES "Install Man pages" OFF)
option(INSTALL_HTML "Install HTML docs" OFF)
option(INSTALL_PROGRAMS "Install Program executables" ON)
option(BUILD_STATIC_LIBS "Also build static libraries" ON)

find_package(GTK NAMES gtk libgtk)

if(WIN32)
    add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Dll)
endif()

add_definitions(-DHAVE_STDINT_H)
add_definitions(-DHAVE_MPGLIB)
add_definitions(-DDECODE_ON_THE_FLY)
add_definitions(-DUSE_FAST_LOG)
add_definitions(-DTAKEHIRO_IEEE754_HACK)

if(${CMAKE_C_COMPILER_ID} STREQUAL Clang)
    add_definitions(-Wno-shift-negative-value 
        -Wno-tautological-pointer-compare 
        -Wno-absolute-value 
        -Wno-implicit-const-int-float-conversion
        -Wno-bitfield-constant-conversion
        -Wno-unused-value)
endif()

if(${CMAKE_CXX_COMPILER_ID} STREQUAL MSVC)
    add_definitions(-DUSE_LAYER_2)
    add_definitions(-DHAVE_CONFIG_H)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
    add_definitions(-D_CRT_SECURE_NO_DEPRECATED)
    configure_file(configMS.h config.h @ONLY)
else()
    add_definitions(-DSTDC_HEADERS)
    if(NOT ieee754_float32_t)
        add_definitions(-Dieee754_float32_t=float)
    endif()
endif()

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/libmp3lame SOURCE_LIB)
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/libmp3lame/vector/ SOURCE_LIB)
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/mpglib SOURCE_LIB)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/libmp3lame)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/mpglib)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# LIBRARIES
function(add_lib sfx lnk)
    add_library(${PROJECT_NAME}${sfx} ${lnk} ${SOURCE_LIB})
    target_include_directories(${PROJECT_NAME}${sfx} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
    set_target_properties(${PROJECT_NAME}${sfx} PROPERTIES 
        POSITION_INDEPENDENT_CODE ON
        OUTPUT_NAME ${PROJECT_NAME})
    export(TARGETS ${PROJECT_NAME}${sfx}
        FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Targets${sfx}.cmake")
    install(TARGETS ${PROJECT_NAME}${sfx}
        EXPORT ${PROJECT_NAME}Targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Targets${sfx}.cmake"
        DESTINATION lib/cmake COMPONENT dev)      
endfunction()

add_lib("" "")
if(BUILD_STATIC_LIBS AND BUILD_SHARED_LIBS)
    add_lib("-static" STATIC)
endif()

# EXECUTABLES
if(INSTALL_PROGRAMS)
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/frontend)
    set(SOURCE_EXEC frontend/main.c 
        frontend/brhist.c 
        frontend/console.c 
        frontend/get_audio.c 
        frontend/lametime.c 
        frontend/parse.c 
        frontend/timestatus.c)
    add_executable(lame frontend/lame_main.c ${SOURCE_EXEC})
    target_link_libraries(lame ${PROJECT_NAME})
    add_executable(mp3rtp frontend/mp3rtp.c frontend/rtp.c ${SOURCE_EXEC})
    target_link_libraries(mp3rtp ${PROJECT_NAME})
    install(TARGETS lame mp3rtp RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

    if(GTK_FOUND)
        include_directories(${GTK_INCLUDE_DIRS})
        add_executable(mp3x frontend/mp3x.c frontend/gtkanal.c frontend/gpkplotting.c ${SOURCE_EXEC})
        target_link_libraries(mp3x ${PROJECT_NAME} ${GTK_LIBRARIES}) 
        install(TARGETS mp3x RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
    endif()
endif()

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/include/lame.h DESTINATION include/lame)

configure_file(lame.pc.in lame.pc @ONLY)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/lame.pc DESTINATION lib/pkgconfig)

if(INSTALL_MANPAGES)
    install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/doc/man/lame.1
        DESTINATION share/man/lame)
endif()

if(INSTALL_HTML)
    install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/doc/html/  
        DESTINATION share/doc/lame/html
        FILES_MATCHING PATTERN *
        PATTERN "Makefile.*" EXCLUDE)
endif()