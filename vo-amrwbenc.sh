#!/bin/bash

lib='vo-amrwbenc'
apt='libvo-amrwbenc-dev'
dsc='VisualOn Adaptive Multi-Rate Wideband speech codec library'
lic='Apache-2.0'
src='https://github.com/mstorsjo/vo-amrwbenc.git'
cfg='cmake'
cmake_cmakelists='vo-amrwbenc.cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='EXAMPLE'

#ac_bin='--disable-example|--enable-example'
#ac_config='--disable-maintainer-mode'

lst_inc='vo-amrwbenc/enc_if.h'
lst_lib='libvo-amrwbenc'
lst_bin='amrwb-enc'
lst_lic='COPYING NOTICE'
lst_pc='vo-amrwbenc.pc'

dev_vrs='0.1.3'

eta='17'

. xbuild

cmake_config='-DENABLE_ASM=ON'

#[ "$arch" == "arm-linux-androideabi" ] && ac_config+=" --enable-armv7neon=yes"
#HOST_NPROC=1
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