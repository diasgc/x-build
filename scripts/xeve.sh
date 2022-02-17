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

. xbuilder.sh

# see https://github.com/lighttransport/embree-aarch64/blob/master/common/math/SSE2NEON.h
# and https://github.com/lighttransport/embree-aarch64/blob/master/common/math/AVX2NEON.h
# port AVX/SSE port to aarch64

$host_arm && doErr "${lib} does not support cross-build for arm (${arch})."

start

# Filelist
# --------
# include/xeve/xeve.h
# include/xeve/xeve_exports.h
# lib/pkgconfig/xeve.pc
# lib/xeve/libxeve.a
# lib/libxeve.so
# bin/xeve_app
