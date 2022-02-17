#!/bin/bash
# todo patch to support dual static-shared build and pc config

lib='libbthread'
dsc='bionic library that provide some missing posix threading function'
lic='LGPL-2.1'
src='https://github.com/tux-mind/libbthread.git'
cfg='ar'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

pc_llib='-lbthread'

dev_bra='master'
dev_vrs='v0.2'
stb_bra=''
stb_vrs=''

. xbuilder.sh

CFLAGS="-fPIE -fPIC"
LDFLAGS="-pie"

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/bthread.h
# lib/libbthread.la
# lib/libbthread.a
# lib/libbthread.so
# share/doc/libbthread/LICENSE
