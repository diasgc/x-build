#!/bin/bash

lib='aribb24'
apt='libaribb24-dev'
dsc='A library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS stream'
lic='LGPL-3.0'
src='https://github.com/nkoriyama/aribb24.git'
cfg='cmake'
dep='libpng bzip2'
eta='10'
build_strip=false
cmake_bin='BUILD_EXECUTABLES'

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

cmake_config='-DINSTALL_DOCS=OFF'
WFLAGS="-Wno-pointer-to-int-cast -Wno-unused-command-line-argument"

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
