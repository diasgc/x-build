#!/bin/bash

lib='pixman'
pkg_deb='libpixman-1-dev'
pkg='pixman-1'
dsc='Pixel-manipulation library for X and cairo'
lic='GPL-2.0'
src='https://gitlab.freedesktop.org/pixman/pixman.git'
cfg='meson'
patch="pixman-01"
#dep='libpng'
eta='275'

dev_vrs='0.43.5'

lst_inc='pixman-1/*.h'
lst_lib='libpixman-1'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='pixman-1.pc'

on_config(){
    meson_cfg='-Dgtk=disabled -Dlibpng=disabled -Dtests=disabled -Ddemos=disabled -Dopenmp=disabled'
patch="pixman-01"
    $host_arm && meson_cfg+=' -Dneon=enabled'
    $host_arm64 && ac_config='--disable-arm-a64-neon' && meson_cfg='-Da64-neon=enabled'
patch="pixman-01"
    #$host_arm32 && ac_config='--disable-arm-neon --disable-arm-simd'
    $use_clang && CFLAGS='-Wno-unknown-attributes'
}

. xbuild && start

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


