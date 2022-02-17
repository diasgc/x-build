#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +F   .   .   .  clang
# GNU ++´ ++   .   .  gcc
# WIN  F   .   .   .  clang/gcc

lib='vapoursynth'
dsc='A video processing framework with simplicity in mind'
lic='LGPL-2.1'
src='https://github.com/vapoursynth/vapoursynth.git'
cfg='ag'
tls='python'
dep='zimg'
eta='60'

lst_inc='vapoursynth/VSScript4.h
	vapoursynth/VapourSynth4.h
	vapoursynth/VSConstants4.h
	vapoursynth/VSHelper.h
	vapoursynth/VSScript.h
	vapoursynth/VSHelper4.h
	vapoursynth/VapourSynth.h'
lst_lib='libvapoursynth'
lst_bin=''

. xbuilder.sh

CFG="--enable-python-module=no --enable-vspipe=no --enable-vsscript=no"
$host_arm && CFG+=" --enable-x86-asm=no"

start

# ndk shared libs: ld.lld undefined symbol: __emutls_get_address
# mingw: src/zimg/common/arm/cpuinfo_arm.cpp:7:12: fatal error: 'Windows.h' file not found

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
