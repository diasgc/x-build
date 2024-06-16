#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='thor'
dsc='Thor Video Codec'
lic='BSD-2c'
src='https://github.com/cisco/thor.git'
src_rel=false

# todo: cmake thorenc, thordec
cfg='make'
ARCH=neon
CFLAGS+=" -march=armv8-a+simd -mtune=cortex-a75"

dev_bra='main'
dev_vrs=''
pkg_deb=''
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start