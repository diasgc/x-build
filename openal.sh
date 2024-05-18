#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU +/.  .   .   .  clang/gcc
# WIN ./.  .   .   .  clang/gcc

lib='openal'
dsc='OpenAL Soft is a software implementation of the OpenAL 3D audio API.'
lic='GLP-2.0'
src='https://github.com/kcat/openal-soft.git'
cfg='cmake'
eta='0'

dev_bra='master'
dev_vrs='1.23.1'

lst_inc='AL/*.h'
lst_lib='libopenal'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='openal.pc'

cmake_config="-DALSOFT_INSTALL_EXAMPLES=OFF -DALSOFT_EXAMPLES=OFF"
WFLAGS+=" -Wno-deprecated-declarations -Wno-unused-function"

on_config(){
    $build_static && cmake_config+=' -DLIBTYPE=STATIC'
    unset CSH
}

. xbuild && start

# Filelist
# --------
# include/AL/al.h
# include/AL/efx-creative.h
# include/AL/alext.h
# include/AL/alc.h
# include/AL/efx.h
# include/AL/efx-presets.h
# lib/pkgconfig/openal.pc
# lib/cmake/OpenAL/OpenALTargets.cmake
# lib/cmake/OpenAL/OpenALConfig.cmake
# lib/cmake/OpenAL/OpenALTargets-release.cmake
# lib/libopenal.so
# share/openal/alsoftrc.sample
# share/openal/presets/itu5.1.ambdec
# share/openal/presets/presets.txt
# share/openal/presets/rectangle.ambdec
# share/openal/presets/itu5.1-nocenter.ambdec
# share/openal/presets/hexagon.ambdec
# share/openal/presets/3D7.1.ambdec
# share/openal/presets/square.ambdec
# share/openal/hrtf/Default HRTF.mhr
