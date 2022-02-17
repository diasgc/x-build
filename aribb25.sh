#!/bin/bash

lib='aribb25'
apt='libaribb24-dev'
dsc='Basic implementation of the ARIB STD-B25 public standard.'
lic='ISC'
src='https://code.videolan.org/videolan/aribb25.git'
cfg='ar'
eta='10'
dep='pscs'

lst_inc=''
lst_lib=''

. xbuilder.sh

start

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...