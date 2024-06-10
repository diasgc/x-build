#!/bin/bash

lib='expat'
dsc='Fast streaming XML parser written in C'
lic=''
src='https://github.com/libexpat/libexpat.git'
cfg='cmake'

cmake_static='BUILD_STATIC_LIBS'
cmake_bin='EXPAT_BUILD_TOOLS'
cmake_config='-DEXPAT_BUILD_EXAMPLES=OFF -DEXPAT_BUILD_TESTS=OFF'

lst_inc='expat_config.h expat.h expat_external.h'
lst_lib='libexpat'
lst_bin=''
lst_lic='expat/COPYING expat/AUTHORS'
lst_pc='expat.pc'

dev_bra='master'
dev_vrs='2.6.2'
pkg_deb="libexpat1-dev"
eta='10'

config_dir="expat"

on_config(){
    $build_static && ! $build_shared && cmake_config+=' -DBUILD_SHARED_LIBS=OFF'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# bin/xmlwf
# include/expat_config.h
# include/expat_external.h
# include/expat.h
# lib/cmake/expat-2.4.8/expat.cmake
# lib/cmake/expat-2.4.8/expat-config.cmake
# lib/cmake/expat-2.4.8/expat-config-version.cmake
# lib/cmake/expat-2.4.8/expat-release.cmake
# lib/libexpat.a
# lib/libexpat.so
# lib/pkgconfig/expat.pc
# share/doc/expat/AUTHORS
# share/doc/expat/changelog
# share/doc/expat/expat/AUTHORS
# share/doc/expat/expat/COPYING
