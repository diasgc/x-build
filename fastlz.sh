#!/bin/bash

lib='fastlz'
dsc='Small & portable byte-aligned LZ77 compression'
lic='MIT'
src='https://github.com/ariya/FastLZ.git'
cfg='cmake'
eta='30'
cmake_cmakelists='fastlz.cmake'

lst_inc='fastlz.h'
lst_lib='libfastlz'
lst_bin='6pack 6unpack'
lst_lic='LICENSE.MIT README.md'
lst_pc='fastlz.pc'

dev_vrs=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++ +++ +++ +++ gcc
# WIN +++ +++ +++ +++ clang/gcc

# Filelist
# --------
# include/fastlz.h
# lib/pkgconfig/fastlz.pc
# lib/libfastlz.so
# lib/libfastlz.a
# share/docs/fastlz/README.md
# share/docs/fastlz/LICENSE.MIT
# bin/6pack
# bin/6unpack
