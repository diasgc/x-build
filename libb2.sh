#!/bin/bash

#vrs='0.98.1'
lib='libb2'
apt='libb2-dev'
dsc='BLAKE2 family of hash functions'
lic='CC0-1.0'
src='https://github.com/BLAKE2/libb2.git'
cfg='autom'
eta='100'

dev_bra='main'
dev_vrs='0.98.1'
stb_bra=''
stb_vrs=''

lst_inc='blake2.h'
lst_lib='libb2'
lst_bin=''
lst_lic='COPYING'
lst_pc='libb2.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU ++   .   .   .  gcc
# WIN ++   .   .   .  clang/gcc

# Filelist
# --------
# include/blake2.h
# lib/pkgconfig/libb2.pc
# lib/libb2.so
# lib/libb2.a
# lib/libb2.la
# share/doc/libb2/COPYING
