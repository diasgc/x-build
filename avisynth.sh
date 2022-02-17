#!/bin/bash

lib='avisynth'
dsc='A powerful nonlinear scripting language for video'
lic='GPL'
src='https://github.com/AviSynth/AviSynthPlus.git'
cfg='cmake'

cmake_bin="ENABLE_PLUGINS"
cmake_config="-DHEADERS_ONLY=OFF"

lst_inc='avisynth/*.h'
lst_lib='libavisynth avisynth/libconvertstacked avisynth/libshibatch avisynth/libtimestretch'
lst_bin=''
lst_lic=''
lst_pc='avisynth.pc'

eta=240

. xbuilder.sh

# dont pass LT_SYS_LIBRARY_PATH to avoid redefinition error
$host_mingw && unset PKG_CONFIG_LIBDIR

start

# cpu av8 av7 x86 x64
# NDK  P   P   F   P  clang
# GNU  P   P   .   .  gcc
# WIN  .   .   .   F  clang/gcc

# Filelist
# --------
# include/avisynth/avisynth_c.h
# include/avisynth/avs/capi.h
# include/avisynth/avs/config.h
# include/avisynth/avs/minmax.h
# include/avisynth/avs/alignment.h
# include/avisynth/avs/types.h
# include/avisynth/avs/cpuid.h
# include/avisynth/avs/win.h
# include/avisynth/avs/filesystem.h
# include/avisynth/avs/posix.h
# include/avisynth/avisynth.h
# lib/pkgconfig/avisynth.pc
# lib/avisynth/libconvertstacked.so
# lib/avisynth/libshibatch.so
# lib/avisynth/libtimestretch.so
# lib/libavisynth.so.3.7.0