#!/bin/bash

lib='shine'
dsc='Super fast fixed-point MP3 encoder.'
lic='GLP-2.0'
src='https://github.com/toots/shine.git'
cfg='ac'
automake_cmd='./bootstrap'
eta='35'

dev_bra='main'
dev_vrs='3.1.1'
stb_bra=''
stb_vrs=''

lst_inc='shine/layer3.h'
lst_lib='libshine'
lst_bin='shineenc'
lst_lic='COPYING'
lst_pc='shine.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# Filelist
# --------
# include/shine/layer3.h
# lib/pkgconfig/shine.pc
# lib/libshine.a
# lib/libshine.la
# lib/libshine.so
# bin/shineenc
# share/doc/shine/COPYING
