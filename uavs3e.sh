#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .  PP  clang
# GNU  .   .   .  PP  gcc
# WIN  .   .   .  PP  clang/gcc

lib='uavs3e'
dsc='AVS3 encoder which supports AVS3-P2 baseline profile.'
lic='Other'
src='https://github.com/uavs3/uavs3e.git'
cfg='cmake'
eta='0'

cmake_config='-DCOMPILE_10BIT=1'
cmake_static='-DBUILD_SHARED_LIBS=0'

lst_inc=''
lst_lib=''
lst_bin=''
dev_vrs='1.3.1'

_on_config_arm(){
    doErr "Arm not supported."
}

. xbuild

start

# Filelist
# --------
# include/uavs3e/uavs3e.h
# include/uavs3e/com_api.h
# lib/pkgconfig/uavs3e.pc
# lib/libuavs3e.so

