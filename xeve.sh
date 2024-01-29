#!/bin/bash
# cpu av8 av7 x86 x64
# NDK N/A N/A  .   .  clang
# GNU N/A N/A  .   .  gcc
# WIN N/A N/A  .   .  clang/gcc

lib='xeve'
dsc='eXtra-fast Essential Video Encoder, MPEG-5 EVC (Essential Video Coding)'
lic='Other'
src='https://github.com/mpeg5/xeve.git'
cfg='cmake'
cmake_static="XEVE_APP_STATIC_BUILD"
lst_inc='xeve/*.h'
lst_lib='libxeve'
lst_bin='xeve_app'
lst_lic='COPYING'
lst_pc='xeve.pc'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs='1.11.0'

. xbuild

on_config_arm(){
  doErr 'Unsupported arm architecture'
  #$host_arm && cmake_config="-DARM=1" #doErr "${lib} does not support cross-build for arm (${arch})."
  # see https://github.com/lighttransport/embree-aarch64/blob/master/common/math/SSE2NEON.h
  # and https://github.com/lighttransport/embree-aarch64/blob/master/common/math/AVX2NEON.h
  # port AVX/SSE port to aarch64
}


$host_native && cmake_config='-DXEVE_NATIVE_BUILD=ON'

start