#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='lizard'
pkg='liblizard'
dsc='Lizard (formerly LZ5) is an efficient compressor with very fast decompression. '
lic='MLP-2.0'
src='https://github.com/inikep/lizard.git'
cfg='cmake'
dep=''
eta='60'
ils='lizard_frame.h lizard_common.h lizard_compress.h'
lls='liblizard'
bls='lizard'
cmake_file='lizard-01.cmake'

. xbuild

start

# Filelist
# --------
# include/lizard_frame.h
# include/lizard_common.h
# include/lizard_compress.h
# lib/pkgconfig/liblizard.pc
# lib/liblizard.so
# lib/liblizard.a
# bin/lizard
