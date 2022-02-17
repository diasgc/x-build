#!/bin/bash

lib='brotli'
pkg='libbrotlicommon'
dsc='Lossless compression algorithm and format'
lic='MIT'
src='https://github.com/google/brotli.git'
cfg='cmake'
eta='60'

lst_inc='brotli/*.h'
lst_lib='libbrotlidec libbrotlienc libbrotlicommon
    libbrotlicommon-static libbrotlicommon-static
    libbrotlicommon-static'
lst_bin='brotli'
lst_lic='LICENSE README'
lst_pc='libbrotlidec.pc libbrotlicommon.pc libbrotlienc.pc'

dev_bra='master'
dev_vrs='1.0.9'
stb_bra=''
stb_vrs=''

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/brotli/shared_dictionary.h
# include/brotli/port.h
# include/brotli/types.h
# include/brotli/decode.h
# include/brotli/encode.h
# lib/pkgconfig/libbrotlidec.pc
# lib/pkgconfig/libbrotlicommon.pc
# lib/pkgconfig/libbrotlienc.pc
# lib/libbrotlidec.so
# lib/libbrotlienc-static.a
# lib/libbrotlienc.so
# lib/libbrotlicommon.so
# lib/libbrotlicommon-static.a
# lib/libbrotlidec-static.a
# share/brotli/LICENSE
# share/brotli/README
# bin/brotli
