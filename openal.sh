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
cmake_config="-DALSOFT_INSTALL_EXAMPLES=OFF -DALSOFT_EXAMPLES=OFF"
WFLAGS+=" -Wno-deprecated-declarations -Wno-unused-function"

dev_bra='master'
dev_vrs='1.23.1'
pkg_deb=' libopenal-dev'
eta='0'

on_build_static(){
    cmake_config+=' -DLIBTYPE=STATIC'
}

lst_inc='AL/al.h
 AL/efx-creative.h
 AL/alext.h
 AL/alc.h
 AL/efx.h
 AL/efx-presets.h'
lst_lib='libopenal'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='openal.pc'

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
