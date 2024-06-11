#!/bin/bash

lib='twolame'
dsc='MPEG Audio Layer 2 (MP2) encoder'
lic='LGPL-2.1'
src='https://github.com/njh/twolame.git'
cfg='cmake'
eta='225'
#cmake_file='twolame.cmake'

#ac_config="--disable-maintainer-mode"

dev_bra='master'
dev_vrs='0.4.0'
lst_inc='twolame.h'
lst_lib='libtwolame'
lst_bin='twolame'
lst_lic='COPYING README AUTHORS'
lst_pc='twolame.pc'

on_config(){
    $build_bin && dep='sndfile'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU ...  .   .   .  gcc
# WIN ...  .   .   .  clang/gcc

# Filelist
# --------
# include/twolame.h
# lib/pkgconfig/twolame.pc
# lib/libtwolame.so
# lib/libtwolame.la
# lib/libtwolame.a
# share/doc/twolame/NEWS
# share/doc/twolame/AUTHORS
# share/doc/twolame/COPYING
# share/doc/twolame/README
# bin/twolame
