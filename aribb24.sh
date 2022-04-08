#!/bin/bash

lib='aribb24'
apt='libaribb24-dev'
dsc='A library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS stream'
lic='LGPL-3.0'
src='https://github.com/nkoriyama/aribb24.git'
cfg='cmake'
dep='libpng'
eta='10'
build_strip=false

dev_bra='master'
dev_vrs='1.0.3'
stb_bra=''
stb_vrs=''

lst_inc='aribb24/*.h'
lst_lib='libaribb24'
lst_bin=''
lst_lic='COPYING README.md'
lst_pc='aribb24.pc'

. xbuild

_before_make(){
    # to build shared libs on mingw
    $host_mingw && sed -i 's/\$(AM_LDFLAGS) \$(LDFLAGS)/& -no-undefined/g' Makefile
    return 0
}

start

#             a8  a7  x86 x64
# ndk-clang   ++. ++. ++. ++.
# linux-gnu   ++. ++. ++. ++.
# mingw-llvm  ++. ++. ... ++.

# Filelist
# --------
# include/aribb24/parser.h
# include/aribb24/decoder.h
# include/aribb24/bits.h
# include/aribb24/aribb24.h
# lib/pkgconfig/aribb24.pc
# lib/libaribb24.a
# lib/libaribb24.so
# share/doc/aribb24/README.md
# share/doc/aribb24/COPYING

# patch 01 Create CMakeLists.txt with dual static/shared build and pkgconfig support
<<'LZS_PATCH'
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
LZS_PATCH
