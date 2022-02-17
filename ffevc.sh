#!/bin/bash
# cpu av8 av7 x86 x64
# NDK N/A N/A  .   .  clang
# GNU N/A N/A  .   .  gcc
# WIN N/A N/A  .   .  clang/gcc

lib='ffevc'
dsc='ffmpeg supporting EVC codec and file formats'
lic='BSD-2c'
src='https://github.com/mpeg5/ffevc.git'
cfg='cmake'

cmake_static="XEVE_APP_STATIC_BUILD"

. xbuilder.sh

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
