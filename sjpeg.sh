#!/bin/bash

lib='sjpeg'
dsc='SimpleJPEG: simple jpeg encoder'
lic='Apache2.0'
src='https://github.com/webmproject/sjpeg.git'
src_opt="--recursive"
dep='libjpeg libpng'
patch="sjpeg-01"

cfg='cmake'

dev_bra=''
dev_vrs=''
pkg_deb=''
eta='20'

on_config_ndk(){
    cmake_config+=" -DSJPEG_ANDROID_NDK_PATH=${ANDROID_NDK_HOME}"
}

on_create_pc(){
    build_pkgconfig --libs=-lsjpeg
}

lst_inc='sjpeg.h'
lst_lib='libsjpeg'
lst_bin='vjpeg sjpeg'
lst_lic='COPYING AUTHORS'
lst_pc='sjpeg.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +F+ +F+ +F+ ... CLANG
# GNU +++ ... ... +F+ GCC
# WIN ... ... ... +.+ CLANG/GCC

# Filelist
# --------
# include/sjpeg.h
# lib/pkgconfig/sjpeg.pc
# lib/libsjpeg.a
# share/sjpeg/cmake/sjpegConfigVersion.cmake
# share/sjpeg/cmake/sjpegConfig.cmake
# bin/vjpeg
# bin/sjpeg
