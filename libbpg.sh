#!/bin/bash
# cpu av8 av7 x86 x64
# NDK ++*  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libbpg'
dsc='Better Portable Graphics'
lic='BSD'
src='https://github.com/mirrorer/libbpg.git'
patch='libbpg-01'
src_rel=false

cfg='cmake'

dev_vrs='0.9.8'
pkg_deb=''
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild && start

# Filelist
# --------
# lib/libbpg.a
# lib/libbpg.so
# lib/pkgconfig/libbpg.pc