#!/bin/bash

lib='xavs'
dsc='High quality encoder and decoder of the Audio Video Standard of China (AVS)'
lic='GPL-2.0'
src='https://svn.code.sf.net/p/xavs/code/trunk'
eta='30'

dev_bra='master'
dev_vrs='0.1.55'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
#lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh

ac_opts='--update-config_sub --update-config_guess --no-sysroot --no-pic'
ac_config="--disable-asm --enable-pic"

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/xavs.h
# lib/pkgconfig/xavs.pc
# lib/libxavs.a
# lib/libxavs.so.1
# bin/xavs
