#!/bin/bash

lib='xavs2'
dsc='An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
src='https://github.com/pkuvcl/xavs2.git'
cfg='ac'
eta='40'

build_static=''
build_shared='--enable-shared'

dev_vrs='1.3.232'

lst_inc='xavs2*.h'
lst_lib='libxavs2'
lst_bin='xavs2'
lst_lic='LICENSE AUTHORS'
lst_pc='xavs2.pc'

build_clean(){
    do_quietly make clean
}

on_config_ndk(){
    ac_config="--enable-lto --enable-pic --enable-strip --disable-asm"
    CFLAGS="-fPIE -pie"

    #$host_arm && CFLAGS="-D__ARM_ARCH_7__ -D__ARM_ARCH_7A__ $CFLAGS" && ac_config+=" --host=arm-linux"
    #$host_arm64 && CFLAGS="-march=armv8-a $CFLAGS"
    #$host_arm32 && CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon $CFLAGS"
    #LDFLAGS="-fPIE -pie -llog -lpthread"
}

. xbuild

dir_config="${dir_src}/build/linux"
dir_build="${dir_src}/build/linux"
mkf="STRIP="

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
