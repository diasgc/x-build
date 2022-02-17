#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   F.. ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='djview'
apt='djview4'
dsc='Multi-format archive and compression library'
lic='GPL'
vrs='4.12'
src="http://downloads.sourceforge.net/djvu/djview-${vrs}.tar.gz"
cfg='ac'
eta='100'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''


. xbuilder.sh

start
