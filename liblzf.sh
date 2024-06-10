#!/bin/bash

# cpu av8 av7 x86 x64
# NDK +++ +++  .  +++ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='liblzf'
dsc='General purpose data compression library'
url='http://oldhome.schmorp.de/marc/liblzf.html'
lic='BSD-2c'
src="http://dist.schmorp.de/liblzf/"
cfg='cmake'
cmake_bin='BUILD_UTILITIES'
patch='liblzf-01'

dev_vrs='3.6'
pkg_deb='liblzf-dev'
eta='10'

lst_inc='lzf.h'
lst_lib='liblzf'
lst_bin='lzf'
lst_lic='LICENSE'

on_create_pc(){
    build_pkgconfig --libs=-llzf
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
