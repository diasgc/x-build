#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='openal'
dsc='OpenAL Soft with Android support'
lic='GLP-2.0'
src='https://github.com/AerialX/openal-soft-android.git'
cfg='cmake'
eta='0'

cmake_bin='UTILS'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

cmake_config="-DEXAMPLES=OFF"

. xbuilder.sh

$host_ndk && cmake_config+=' -DANDROID_LOW_LATENCY=ON'
$host_mingw && cmake_config+=' -DALSA=OFF'

start

# Filelist
# --------
# include/AL/al.h
# include/AL/efx-creative.h
# include/AL/alext.h
# include/AL/alc.h
# include/AL/efx.h
# include/AL/efx-presets.h
# lib/pkgconfig/openal.pc
# lib/libopenal.so
