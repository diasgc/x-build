#!/bin/bash

lib='vo-amrwbenc'
apt='libvo-amrwbenc-dev'
dsc='VisualOn Adaptive Multi-Rate Wideband speech codec library'
lic='Apache-2.0'
src='https://github.com/mstorsjo/vo-amrwbenc.git'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='EXAMPLE'

ac_bin='--disable-example|--enable-example'
ac_config='--disable-maintainer-mode'

lst_inc='vo-amrwbenc/enc_if.h'
lst_lib='libvo-amrwbenc'
lst_bin='amrwb-enc'
lst_lic='COPYING NOTICE'
lst_pc='vo-amrwbenc.pc'

dev_vrs='0.1.3'

eta='17'

. xbuild

[ "$arch" == "arm-linux-androideabi" ] && ac_config+=" --enable-armv7neon=yes"
HOST_NPROC=1
start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

#   Filelist
# --------
# include/vo-amrwbenc/enc_if.h
# lib/pkgconfig/vo-amrwbenc.pc
# lib/libvo-amrwbenc.so
# lib/libvo-amrwbenc.a
# lib/libvo-amrwbenc.la
# share/doc/vo-amrwbenc/NOTICE
# share/doc/vo-amrwbenc/COPYING
# bin/amrwb-enc

# patch 01 create CMakeLists.txt
# todo: ENABLE_ASM fails to compile due to 'undefined symbol's
<<'LZS_PATCH'
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
SPOkJox5dXNLoXUIAA
LZS_PATCH
