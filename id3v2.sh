#!/bin/bash

lib='id3v2'
apt='id3v2-dev'
dsc='Command line id3v2 tag editor'
lic='LGPL-3.0'
src='https://salsa.debian.org/debian/id3v2.git'
cfg='make'
eta='10'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

. xbuild

start

#             a8  a7  x86 x64
# ndk-clang   ++. ++. ++. ++.
# linux-gnu   ++. ++. ++. ++.
# mingw-llvm  ++. ++. ... ++.
