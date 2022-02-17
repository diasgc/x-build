#!/bin/bash

lib='kvazaar'
dsc='An open source C library for efficient image processing and image analysis operations'
lic='LGPL-2.1'
src='https://github.com/ultravideo/kvazaar.git'
cfg='ag'
eta='70'

lst_inc='kvazaar.h'
lst_lib='libkvazaar'
lst_bin='kvazaar'
lst_lic='COPYING CREDITS README.md'
lst_pc='kvazaar.pc'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/kvazaar.h
# lib/pkgconfig/kvazaar.pc
# lib/libkvazaar.so
# lib/libkvazaar.la
# lib/libkvazaar.a
# share/man/man1/kvazaar.1
# share/doc/kvazaar/LICENSE
# share/doc/kvazaar/README.md
# share/doc/kvazaar/CREDITS
# share/doc/kvazaar/LICENSE.EXT.greatest
# share/doc/kvazaar/LICENSE.EXT.x264asm
# bin/kvazaar
