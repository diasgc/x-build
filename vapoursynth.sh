#!/bin/bash

lib='vapoursynth'
dsc='A video processing framework with simplicity in mind'
lic='LGPL-2.1'
src='https://github.com/vapoursynth/vapoursynth.git'
#cfg='ag'
cfg='ag'
tls='python'
dep='zimg'
eta='60'

lst_inc='vapoursynth/*.h'
lst_bin=''
lst_lib='libvapoursynth'
lst_lic='COPYING.LESSER'
lst_pc='vapoursynth.pc'

dev_bra='main'
dev_vrs='58'
stb_bra=''
stb_vrs='R66-RC1-4'

cmake_static='BUILD_STATIC_LIBS'

get_version(){
    c_printf 'include' 'VapourSynth.h' '"%d.%d",VAPOURSYNTH_API_MAJOR,VAPOURSYNTH_API_MINOR'
}

. xbuild

build_strip=false

# ffmpeg requires vsscript
ac_config="--enable-python-module=no --enable-vspipe=no --enable-vsscript=no"
$host_arm && ac_config+=" --enable-x86-asm=no"
$host_arm && $host_clang && CPPFLAGS+=' -mno-outline-atomics'

get_version

start

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

# patch 01 create CMakeLists.txt with dual static/shared build support
# todo: AVX2 ON X86 PLATFORMS: [100%] Built target vapoursynth_avx2-static ()
# ld: error: undefined symbol: vs_generic_3x3_sobel_word_avx2
# >>> referenced by ld-temp.o
# >>>               lto.tmp:(VSFrame const* genericGetframe<(GenericOperations)1>(int, int, void*, void**, VSFrameContext*, VSCore*, VSAPI const*))
<<'LZS_PATCH_OLD'
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
lOUMKqVvNPaTo06FCJwqAK0AEkPPAAIEAA==
LZS_PATCH_OLD
