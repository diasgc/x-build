#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ++  ... ... ...
# linux-gnu   ++  ... ... ...
# mingw-llvm  ... ... ... ...

lib='freeimage'
dsc='Open Source library to support popular graphics image formats like PNG, BMP, JPEG, TIFF'
lic='Other'
src='https://svn.code.sf.net/p/freeimage/svn/FreeImage/trunk'
cfg='cmake'

cmake_file='freeimage'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='FreeImage.h FreeImagePlus.h'
lst_lib='libFreeImage'
lst_bin=''
lst_lic='license-fi.txt license-gplv2.txt license-gplv3.txt'
lst_pc='freeimage.pc'

dev_bra='master'
dev_vrs='3.18.0'
pkg_deb='libfreeimage-dev'
eta='1600'

on_create_pc(){
    build_pkgconfig --libs=-lfreeimage
}

. xbuild && start

# Filelist
# --------
# include/FreeImage.h
# include/FreeImagePlus.h
# lib/pkgconfig/freeimage.pc
# lib/libfreeimage.so
# lib/libfreeimage.a
# share/docs/FreeImage/license-fi.txt
# share/docs/FreeImage/license-gplv3.txt
# share/docs/FreeImage/license-gplv2.txt
