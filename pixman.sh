#!/bin/bash

lib='pixman'
apt='libpixman-1-dev'
pkg='pixman-1'
dsc='Pixel-manipulation library for X and cairo'
lic='GPL-2.0'
src='https://github.com/freedesktop/pixman.git'
cfg='ag'
dep='libpng'
eta='275'

. xbuild

dev_vrs='0.40.1'

lst_inc='pixman-1/*.h'
lst_lib='libpixman-1'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='pixman-1.pc'

$host_arm64 && ac_config='--disable-arm-a64-neon'
$host_arm32 && ac_config='--disable-arm-neon --disable-arm-simd'
$use_clang && WFLAGS='-Wunknown-attributes'

before_make(){
    sed -i 's/-g -O2/-O3 -flto/g;s/-Wall -W/-W/g' Makefile pixman/Makefile
}

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/pixman-1/pixman-version.h
# include/pixman-1/pixman.h
# lib/pkgconfig/pixman-1.pc
# lib/libpixman-1.a
# lib/libpixman-1.la
# lib/libpixman-1.so
# share/doc/pixman/AUTHORS
# share/doc/pixman/COPYING


