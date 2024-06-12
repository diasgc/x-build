#!/bin/bash

lib='kvazaar'
dsc='An open source C library for efficient image processing and image analysis operations'
lic='LGPL-2.1'
src='https://github.com/ultravideo/kvazaar.git'

cfg='cmake'
cmake_config='-DBUILD_TESTS=OFF'

lst_inc='kvazaar.h'
lst_lib='libkvazaar'
lst_bin='kvazaar'
lst_lic='COPYING CREDITS README.md'
lst_pc='kvazaar.pc'

dev_vrs='2.3.0'
pkg_deb=''
eta='70'

on_config_ndk(){
    vrs='v2.3.0' # v2.3.1 fails to cmake find_package threads not found
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/kvazaar.h
# lib/pkgconfig/kvazaar.pc
# lib/libkvazaar.so
# lib/libkvazaar.la
# lib/libkvazaar.a
# share/man/man1/kvazaar.1
# share/doc/kvazaar/LICENSE
# share/doc/kvazaar/README.md
# share/doc/kvazaar/CREDITS
# share/doc/kvazaar/LICENSE.EXT.greatest
# share/doc/kvazaar/LICENSE.EXT.x264asm
# bin/kvazaar
