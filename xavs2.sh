#!/bin/bash

lib='xavs2'
dsc='An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
cfg='cmake'
src='https://github.com/pkuvcl/xavs2.git' 
eta='40'
bin='BUILD_EXECUTABLE'
cmake_file='xavs2.cmake'

dev_vrs='1.3.232'
lst_inc='xavs2*.h'
lst_lib='libxavs2'
lst_bin='xavs2'
lst_lic='LICENSE AUTHORS'
lst_pc='xavs2.pc'

cmake_config='-DDISABLE_WARNINGS=ON -DXAVS2_OPENCL=ON -DBUILD_EXECUTABLE=OFF'
#cmake_config+=" -DENABLE_ASM=ON -DX264_SOURCE_DIR=${dir_sources}/x264"

. xbuild && start

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
