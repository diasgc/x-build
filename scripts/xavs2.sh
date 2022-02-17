#!/bin/bash

lib='xavs2'
dsc='An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
src='https://github.com/pkuvcl/xavs2.git'
cfg='ac'
eta='40'

ac_bin='--disable-cli| '
config_dir='build/linux'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='xavs2*.h'
lst_lib='libxavs2'
lst_bin='xavs2'
lst_lic='LICENSE AUTHORS'
lst_pc='xavs2.pc'

. xbuilder.sh

ac_config="--sysroot=${SYSROOT} --enable-lto --enable-strip --enable-pic"
$host_x86 && AS=nasm || ac_config+=' --disable-asm'

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------------------------------------------
# include/xavs2_config.h
# include/xavs2.h
# lib/pkgconfig/xavs2.pc
# lib/libxavs2.so.13
# lib/libxavs2.a
# bin/xavs2
