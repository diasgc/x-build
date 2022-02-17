#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='thor'
dsc='Thor Video Codec'
lic='BSD-2c'
src='https://github.com/cisco/thor.git'
cfg='make'
eta='0'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh
ARCH=neon
CFLAGS+=" -march=armv8-a+simd -mtune=cortex-a75"
start