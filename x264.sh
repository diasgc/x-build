#!/bin/bash

lib='x264'
dsc='x264, the best and fastest H.264 encoder'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/x264.git'

cfg='ac'
build_strip=false
ac_nopic=true
ac_nosysroot=true
ac_bin="cli"
ac_config="--enable-lto --enable-pic --enable-strip"

dev_vrs='0.164.3191'
eta='400'
pkg_deb='libx264-dev'

lst_inc='x264.h x264_config.h'
lst_lib='libx264'
lst_bin='x264'
lst_lic='COPYING AUTHORS'
lst_pc='x264.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU  .   .   .   .  gcc
# WIN +++ +++  .  +++ clang/gcc

# Filelist
# --------
# include/x264.h
# include/x264_config.h
# lib/pkgconfig/x264.pc
# lib/libx264.a
# lib/libx264.so.164
# bin/x264
