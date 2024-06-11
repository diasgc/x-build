#!/bin/bash
# todo patch to support dual static-shared build and pc config

lib='libbthread'
dsc='bionic library that provide some missing posix threading function'
lic='LGPL-2.1'
src='https://github.com/tux-mind/libbthread.git'
cfg='ar'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

dev_bra='master'
dev_vrs='0.2'
pkg_deb=''
eta='0'

CFLAGS="-fPIE -fPIC"
LDFLAGS="-pie"

on_create_pc(){
  build_pkgconfig --libs=-lbthread
}


. xbuild && start

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
