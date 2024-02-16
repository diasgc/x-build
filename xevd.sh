#!/bin/bash
# cpu av8 av7 x86 x64
# NDK N/A N/A  .   .  clang
# GNU N/A N/A  .   .  gcc
# WIN N/A N/A  .   .  clang/gcc

lib='xevd'
dsc='eXtra-fast Essential Video Decoder, MPEG-5 EVC (Essential Video Coding)'
lic='BSD-3c'
src='https://github.com/mpeg5/xevd.git'
cfg='cmake'
cmake_static="XEVD_APP_STATIC_BUILD"

. xbuild

source_patch(){
    $host_arm && git checkout xeve_itx_neon_dev
}

#$host_arm && doErr "${lib} does not support cross-build for arm (${arch})."

start