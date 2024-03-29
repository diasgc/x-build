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

xeve_profile='MAIN' # BASE|MAIN

case $xeve_profile in BASE) sfx='b';; esac

pkg="xeve${sfx}"

lst_inc="xeveb${sfx}/*.h"
lst_lib="libxeve${sfx}"
lst_bin="xeve${sfx}_app"
lst_lic='COPYING'
lst_pc="xeve${sfx}.pc"

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs='0.4.3'

. xbuild

cmake_config="-DSET_PROF=${xeve_profile}"

$host_native && cmake_config+=' -DXEVE_NATIVE_BUILD=ON'
$host_arm && cmake_config+=" -DARM=TRUE"

WFLAGS+=" -Wno-unknown-warning-option -Wno-empty-body -Wno-shift-negative-value -Wno-parentheses-equality -Wno-typedef-redefinition -Wno-for-loop-analysis"

start
