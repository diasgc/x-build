#!/bin/bash

lib='aribb24'
dsc='A library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS stream'
lic='LGPL-3.0'
src='https://github.com/nkoriyama/aribb24.git'
dep='libpng bzip2'

cfg='cmake'
cmake_bin='BUILD_EXECUTABLES'
cmake_file='aribb24.cmake'
cmake_config='-DINSTALL_DOCS=OFF'
build_strip=false
WFLAGS="-Wno-pointer-to-int-cast -Wno-unused-command-line-argument"

on_create_pc(){
    build_pkgconfig --libs=-laribb24
}

dev_bra='master'
dev_vrs='v1.0.3'
pkg_deb='libaribb24-dev'
eta='32'

lst_inc='aribb24/*.h'
lst_lib='libaribb24'
lst_bin=''
lst_lic='COPYING README.md'
lst_pc='aribb24.pc'

. xbuild && start

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
