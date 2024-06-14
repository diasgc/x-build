#!/bin/bash

lib='lizard'
pkg='liblizard'
dsc='Lizard (formerly LZ5) is an efficient compressor with very fast decompression. '
lic='MLP-2.0'
src='https://github.com/inikep/lizard.git'

cfg='cmake'
cmake_file='lizard'

dev_vrs='1.0.0'
pkg_deb=''
eta='60'

lst_inc='lizard_frame.h lizard_common.h lizard_compress.h'
lst_lib='liblizard'
lst_bin='lizard'
lst_lic='LICENSE.MIT README.md'
lst_pc='liblizard.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/lizard_frame.h
# include/lizard_common.h
# include/lizard_compress.h
# lib/pkgconfig/liblizard.pc
# lib/liblizard.so
# lib/liblizard.a
# bin/lizard
