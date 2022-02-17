#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

lib='vo-amrwbenc'
apt='libvo-amrwbenc-dev'
dsc='VisualOn Adaptive Multi-Rate Wideband speech codec library'
lic='Apache-2.0'
src='https://github.com/mstorsjo/vo-amrwbenc.git'
cfg='ar'
eta='17'
cb1='--enable-example'
CFG='--disable-maintainer-mode'

lst_inc='vo-amrwbenc/enc_if.h'
lst_lib='libvo-amrwbenc'
lst_bin='amrwb-enc'

. xbuilder.sh

[ "$arch" == "arm-linux-androideabi" ] && CFG+=" --enable-armv7neon=yes"

start

# Filelist
# --------
# include/vo-amrwbenc/enc_if.h
# lib/pkgconfig/vo-amrwbenc.pc
# lib/libvo-amrwbenc.so
# lib/libvo-amrwbenc.a
# lib/libvo-amrwbenc.la
# bin/amrwb-enc