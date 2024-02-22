#!/bin/bash

lib='xavs2'
dsc='An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
src='https://github.com/diasgc/xavs2.git'
cfg='cmake'
eta='40'
bin='EXECUTABLE'

dev_vrs='1.3.232'

lst_inc='xavs2*.h'
lst_lib='libxavs2'
lst_bin='xavs2'
lst_lic='LICENSE AUTHORS'
lst_pc='xavs2.pc'

cmake_config='-DDISABLE_WARNINGS=ON'

. xbuild

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
