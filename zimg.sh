#!/bin/bash

lib='zimg'
dsc='Scaling, colorspace conversion, and dithering library'
lic='WTFPL'
src='https://github.com/sekrit-twc/zimg.git'
cfg='ag'
eta='120'
mki='install'

lst_inc='zimg.h zimg++.hpp'
lst_lib='libzimg'
lst_bin=''
lst_lic='COPYING'
lst_pc='zimg.pc'

dev_bra='main'
dev_vrs='3.0.4'
stb_bra=''
stb_vrs=''

. xbuild

source_patch(){
    git submodule update --init --recursive
    #sed 's/Windows.h/windows.h/g' src/zimg/common/arm/cpuinfo_arm.cpp
}

on_editpack(){
    #rm -rf share/doc/zimg/example
    return 0
}

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +F   .   .   .  clang/gcc


# Filelist
# --------
# include/zimg.h
# include/zimg++.hpp
# lib/pkgconfig/zimg.pc
# lib/libzimg.so
# lib/libzimg.a
# lib/libzimg.la
# share/doc/zimg/README.md
# share/doc/zimg/ChangeLog
# share/doc/zimg/COPYING
