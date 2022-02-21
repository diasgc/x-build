#!/bin/bash

lib='vapoursynth'
dsc='A video processing framework with simplicity in mind'
lic='LGPL-2.1'
src='https://github.com/vapoursynth/vapoursynth.git'
cfg='ag'
tls='python'
dep='zimg'
eta='60'

lst_inc='vapoursynth/*.h'
lst_bin=''
lst_lic='COPYING.LESSER'
lst_pc='libdeflate.pc'

dev_bra='main'
dev_vrs='58'
stb_bra=''
stb_vrs=''

. xbuild

ac_config="--enable-python-module=no --enable-vspipe=no --enable-vsscript=no"
$host_arm && ac_config+=" --enable-x86-asm=no"
$host_arm64 && $host_clang && CXX+=' -mno-outline-atomics'
start

# cpu av8 av7 x86 x64
# NDK ++  +F   .  +F  clang
# GNU ++´ ++   .   .  gcc
# WIN FF   .   .   .  clang/gcc

# Filelist
# --------
# include/vapoursynth/VSScript4.h
# include/vapoursynth/VapourSynth4.h
# include/vapoursynth/VSConstants4.h
# include/vapoursynth/VSHelper.h
# include/vapoursynth/VSScript.h
# include/vapoursynth/VSHelper4.h
# include/vapoursynth/VapourSynth.h
# lib/pkgconfig/vapoursynth.pc
# lib/libvapoursynth.la
# lib/libvapoursynth.a
# lib/libvapoursynth.so
# share/doc/vapoursynth/COPYING.LESSER
