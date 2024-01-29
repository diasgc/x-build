#!/bin/bash

lib='shine'
dsc='Super fast fixed-point MP3 encoder.'
lic='GLP-2.0'
src='https://github.com/toots/shine.git'
cfg="cmake"
eta='35'

dev_bra=''
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='shine/layer3.h'
lst_lib='libshine'
lst_bin='shineenc'
lst_lic='COPYING'
lst_pc='shine.pc'y

. xbuild

#CPPFLAGS+=" -I${SRCDIR}/src/lib -I${SRCDIR}/src/bin"

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# Filelist
# --------
# include/shine/layer3.h
# lib/pkgconfig/shine.pc
# lib/libshine.a
# lib/libshine.la
# lib/libshine.so
# bin/shineenc
# share/doc/shine/COPYING

<<'XB_CREATE_CMAKELISTS'
cmake_minimum_required(VERSION 3.5)

project(shine 
    LANGUAGES C CXX 
    VERSION 3.1.1
    DESCRIPTION "Super fast fixed-point MP3 encoder"
    HOMEPAGE_URL "https://github.com/toots/shine.git"
)

set(EXEC_NAME shineenc)

set(${PROJECT_NAME}_lic
    COPYING
)
set(${PROJECT_NAME}_hdrs
    src/lib/layer3.h
)
set(${PROJECT_NAME}_src
    src/lib/bitstream.c
    src/lib/bitstream.h
    src/lib/huffman.c
    src/lib/huffman.h
    src/lib/l3bitstream.c
    src/lib/l3bitstream.h
    src/lib/l3loop.c
    src/lib/l3loop.h
    src/lib/l3mdct.c
    src/lib/l3mdct.h
    src/lib/l3subband.c
    src/lib/l3subband.h
    src/lib/layer3.c
    src/lib/layer3.h
    src/lib/mult_mips_gcc.h
    src/lib/mult_noarch_gcc.h
    src/lib/mult_sarm_gcc.h
    src/lib/reservoir.c
    src/lib/reservoir.h
    src/lib/tables.c
    src/lib/tables.h
    src/lib/types.h
)
set(${PROJECT_NAME}_exec
    src/bin/main.c
    src/bin/main.h
    src/bin/wave.c
    src/bin/wave.h
)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" ON)
option(BUILD_EXECUTABLES "Build executables" ON)
option(INSTALL_DOCS      "Install Manpages"  ON)

message(STATUS "${PROJECT_NAME} version ${PROJECT_VERSION}
    Build static libs ${BUILD_STATIC_LIBS}
    Build shared libs ${BUILD_SHARED_LIBS}
    Build executables ${BUILD_EXECUTABLES}
    Install manuals   ${INSTALL_DOCS}"
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS_RELEASE "-Ofast -flto")

include_directories(src/lib)

# Libraries
add_library(${PROJECT_NAME}_obj OBJECT ${${PROJECT_NAME}_src})
if(NOT WFLAGS STREQUAL "")
    target_compile_options(${PROJECT_NAME}_obj PUBLIC ${WFLAGS})
endif()

macro(add_lib sfx lnk)
    add_library(${PROJECT_NAME}${sfx} ${lnk} $<TARGET_OBJECTS:${PROJECT_NAME}_obj>)
    set_target_properties(${PROJECT_NAME}${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME ${PROJECT_NAME}
    )
    install(TARGETS ${PROJECT_NAME}${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

include(GNUInstallDirs)

# Executables
if(BUILD_EXECUTABLES)
    add_executable(${EXEC_NAME} ${${PROJECT_NAME}_exec})
    target_link_libraries(${EXEC_NAME} ${PROJECT_NAME})
    install(TARGETS ${EXEC_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
endif()

# PkgConfig file
configure_file(${PROJECT_NAME}.pc.in ${PROJECT_NAME}.pc @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)

# Headers
install(FILES ${${PROJECT_NAME}_hdrs} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})

# Licence, Docs and Manuals
install(FILES ${${PROJECT_NAME}_lic} DESTINATION ${CMAKE_INSTALL_DOCDIR})
if(INSTALL_DOCS)
    if(NOT ${PROJECT_NAME}_doc STREQUAL "")
        install(FILES ${${PROJECT_NAME}_doc} DESTINATION ${CMAKE_INSTALL_DOCDIR})
    endif()
    if(NOT ${PROJECT_NAME}_man STREQUAL "")
        install(FILES ${${PROJECT_NAME}_man} DESTINATION ${CMAKE_INSTALL_MANDIR})
    endif()
endif()
XB_CREATE_CMAKELISTS