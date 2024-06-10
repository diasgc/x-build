#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ++. ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='liba52'
vrs='0.7.4'
pkg_deb="liba52-${vrs}-dev"
dsc='liba52 is a free library for decoding ATSC A/52 streams'
lic='GPL'
src="https://liba52.sourceforge.io/files/a52dec-${vrs}.tar.gz"
cfg='cmake'
patch='liba52-01'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='a52.h'
lst_lib='liba52'
lst_bin='a52dec extract_a52'
lst_lic='COPYING AUTHORS'
lst_pc='liba52.pc'
eta='10'

dev_vrs='0.7.4'

on_create_pc(){
    build_pkgconfig --libs=-la52
}

. xbuild && start

# Filelist
# --------
# include/a52.h
# lib/pkgconfig/liba52.pc
# lib/liba52.a
# lib/liba52.so
# share/man/a52dec.1
# share/man/extract_a52.1
# share/docs/liba52/AUTHORS
# share/docs/liba52/liba52.txt
# share/docs/liba52/COPYING
# bin/extract_a52
# bin/a52dec
