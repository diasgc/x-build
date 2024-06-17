#!/bin/bash

lib='vapoursynth'
dsc='A video processing framework with simplicity in mind'
lic='LGPL-2.1'
src='https://github.com/vapoursynth/vapoursynth.git'
patch="vapoursynth-01"
tls='python'
dep='zimg'

# ffmpeg requires vsscript

cfg='ag'
am_config="--enable-python-module=no --enable-vspipe=no --enable-vsscript=no"
WFLAGS='-Wno-macro-redefined -Wno-sign-compare -Wno-typedef-redefinition'
build_strip=false

dev_bra='main'
dev_vrs='66'
pkg_deb=''
eta='60'

on_config(){
    $host_arm && am_config+=" --enable-x86-asm=no"
    $host_arm && $host_clang && CPPFLAGS+=' -mno-outline-atomics'
    c_printf 'include' 'VapourSynth.h' '"%d.%d",VAPOURSYNTH_API_MAJOR,VAPOURSYNTH_API_MINOR'
}

lst_inc='vapoursynth/*.h'
lst_bin=''
lst_lib='libvapoursynth'
lst_lic='COPYING.LESSER'
lst_pc='vapoursynth.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++  +F   .  +F  clang
# GNU ++  ++   .   .  gcc
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
