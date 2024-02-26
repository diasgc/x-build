#!/bin/bash

lib='lzfse'
dsc='LZFSE compression library and command line tool'
lic='BSD-3c'
src='https://github.com/lzfse/lzfse.git'
cfg='cmake'
eta='411'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='lzfse.h'
lst_lib='liblzfse'
lst_bin='lzfse'
lst_lic='LICENSE README.md'
lst_pc='lzfse.pc'

dev_vrs='0.1.1'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# bin/lzfse
# include/lzfse.h
# lib/liblzfse.a
# lib/liblzfse.so
# lib/pkgconfig/lzfse.pc
# share/doc/lzfse/LICENSE
# share/doc/lzfse/README.md
