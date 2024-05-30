#!/bin/bash

# cpu av8 av7 x86 x64
# NDK +++ +++  .  +++ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='liblzf'
apt='liblzf1'
dsc='General purpose data compression library'
lic='BSD-2c'
src="http://dist.schmorp.de/liblzf/"
cfg='cmake'
cmake_bin='BUILD_UTILITIES'
patch='liblzf-01'

dev_vrs='3.6'
eta='10'

lst_inc='lzf.h'
lst_lib='liblzf'
lst_bin='lzf'
lst_lic='LICENSE'

on_create_pc(){
    build_pkgconfig --libs=-llzf --url=http://oldhome.schmorp.de/marc/liblzf.html
}

on_config(){
    vrs="$(curl -sL ${src} | grep -oP 'liblzf-[0-9\.]+.tar.gz' | tail -n1)"
    src+="${vrs}"
    vrs=$(grep -o '[0-9]\.[0-9]' <<<"${vrs}")
}

. xbuild && start

# Filelist
# --------
# include/lzf.h
# lib/pkgconfig/liblzf.pc
# lib/liblzf.so
# lib/liblzf.a
# share/doc/liblzf/LICENSE
# bin/lzf
