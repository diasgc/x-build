#!/bin/bash

lib='xavs2'
dsc='An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
cfg='cmake'

if [ "$cfg" = "ac" ]; then
    src='https://github.com/pkuvcl/xavs2.git' 
else
    src='https://github.com/diasgc/xavs2.git' cfg='cmake'
    cmake_config='-DDISABLE_WARNINGS=ON -DXAVS2_OPENCL=ON'
fi

eta='40'
bin='BUILD_EXECUTABLE'

dev_vrs='1.3.232'

lst_inc='xavs2*.h'
lst_lib='libxavs2'
lst_bin='xavs2'
lst_lic='LICENSE AUTHORS'
lst_pc='xavs2.pc'

. xbuild

if [ "$cfg" = "ac" ]; then
    $host_arm && ac_config+=" --disable-asm"
    dir_config="${dir_src}/build/linux"
    dir_build="${dir_src}/build/linux"
fi
cmake_config+=" -DENABLE_ASM=ON -DX264_SOURCE_DIR=${dir_sources}/x264"

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
