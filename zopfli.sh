#!/bin/bash

lib='zopfli'
dsc='Zopfli Compression Algorithm is a compression library programmed in C to perform very good, but slow, deflate or zlib compression.'
lic='Apache-2.0'
src='https://github.com/google/zopfli.git'
url="https://github.com/google/zopfli"
patch="zopfli-01"

cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'

on_create_pc(){
    build_pkgconfig --name=zopflipng --libs=-lzopflipng
    build_pkgconfig --name=zopfli--libs=-lzopfli
}

dev_bra='main'
dev_vrs='1.0.3'
pkg_deb='libzopfli-dev'
eta='45'

lst_inc='zopflipng_lib.h zopfli.h'
lst_lib='libzopflipng libzopfli'
lst_bin='zopflipng zopfli'
lst_lic='COPYING'
lst_pc='zopfli.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/zopflipng_lib.h
# include/zopfli.h
# lib/pkgconfig/zopflipng.pc
# lib/pkgconfig/zopfli.pc
# lib/libzopfli.a
# lib/cmake/Zopfli/ZopfliConfigVersion.cmake
# lib/cmake/Zopfli/ZopfliConfig.cmake
# lib/cmake/Zopfli/ZopfliConfig-release.cmake
# lib/libzopflipng.so
# lib/libzopfli.so
# lib/libzopflipng.a
# share/doc/zopfli/COPYING
# bin/zopflipng
# bin/zopfli
