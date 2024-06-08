#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   F   .  PP  clang
# GNU  .   .   .  PP  gcc
# WIN  .   .   .  PP  clang/gcc

lib='uavs3e'
dsc='AVS3 encoder which supports AVS3-P2 baseline profile.'
lic='Other'
src='https://github.com/uavs3/uavs3e.git'
cfg='cmake'
eta='0'
patch='uavs3e-ge1ff0f3'; src_rel=false

lst_inc='uavs3e/uavs3e.h uavs3e/com_api.h'
lst_lib='libuavs3e'
lst_bin='uavs3enc'
dev_vrs='1.3.2'

cmake_config='-DCOMPILE_10BIT=1'

cmake_definitions+=(
    '-Wno-macro-redefined'
    '-Wno-logical-not-parentheses'
    '-Wno-shift-negative-value'
    '-Wno-constant-conversion'
)

. xbuild && start

# Filelist
# --------
# include/uavs3e/uavs3e.h
# include/uavs3e/com_api.h
# lib/pkgconfig/uavs3e.pc
# lib/libuavs3e.so

