#!/bin/bash

lib='ucl'
dsc='UCL is a portable lossless data compression library written in ANSI C'
lic='GPL-2.0'
src='https://github.com/korczis/ucl.git'
url='http://www.oberhumer.com/opensource/ucl'
cfg='ac'
eta='0'

dev_vrs='1.03'

pc_llib='-lucl'
lst_inc='ucl/*.h'
lst_lib='libucl'
lst_bin=''
lst_lic='COPYING README'
lst_pc='ucl.pc'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/ucl/COPYING
# share/doc/ucl/README
# include/ucl/ucl.h
# include/ucl/uclconf.h
# include/ucl/uclutil.h
# lib/pkgconfig/ucl.pc
# lib/libucl.a
# lib/libucl.la
# lib/libucl.so

<<'CMakeLists.txt'
cmake_minimum_required(VERSION 3.5)
project(ucl LANGUAGES C)

option(BUILD_STATIC_LIBS "build static libs along with shared" ON)
option(BUILD_PKGCONFIG "build pkgconfig file" OFF)

files(GLOB src_libucl src/*.h src/*.c src/*.ch)
files(GLOB src_headers include/ucl/*.h)

function(add_libucl sfx lnk)
    add_library(${PROJECT_NAME}${sfx} ${lnk} ${src_libucl})
    set_target_properties(${PROJECT_NAME}${sfx} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
    install(TARGETS ${PROJECT_NAME}${sfx}
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    )
endfunction()

add_libucl("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_libucl(-static STATIC)
endif()

if(BUILD_PKGCONFIG)
    configure_file(../pkg-config.pc.in ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc @ONLY)
    install(FILES ${CMAKE_BINARY_DIR}/SvtHevcEnc.pc DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
endif()

install(FILES ${src_headers} DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")
CMakeLists.txt