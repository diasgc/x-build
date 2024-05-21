#!/bin/bash

# cpu av8 av7 x86 x64
# NDK +++ +++  .  +++ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='liblzf'
apt='liblzf1'
dsc='General purpose data compression library'
lic='BSD-2c'
vrs='3.6'
src="http://dist.schmorp.de/liblzf/liblzf-${vrs}.tar.gz"
cfg='cmake'
cbk='BUILD_UTILITIES'
eta='10'

pc_llib="-llzf"
pc_url="http://oldhome.schmorp.de/marc/liblzf.html"

lst_inc='lzf.h'
lst_lib='liblzf'
lst_bin='lzf'
lst_lic='LICENSE'

. xbuild && start

# Filelist
# --------
# include/lzf.h
# lib/pkgconfig/liblzf.pc
# lib/liblzf.so
# lib/liblzf.a
# share/doc/liblzf/LICENSE
# bin/lzf
