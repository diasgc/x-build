#!/bin/bash

lib='c-blosc2'
pkg='blosc2'
apt='libblosc-dev'
dsc='A fast, compressed, persistent binary data store library for C.'
lic='BSD-3c'
src='https://github.com/Blosc/c-blosc2.git'
url='https://www.blosc.org'
cfg='cmake'
eta='399'

cmake_static='BUILD_STATIC' # default ON
cmake_shared='BUILD_SHARED' # default ON
cmake_config='-DBUILD_TESTS=OFF'

dev_vrs='2.14.5.dev'

lst_inc='blosc2.h blosc2/*.h'
lst_lib='libblosc2'
lst_bin=''
lst_lic='LICENSE.txt LICENSES/*.txt'
lst_pc='blosc2.pc'

cmake_definitions+=( -Wno-pointer-sign -Wno-int-conversion -Wno-unused-function )

on_config(){
    if ! $build_bin; then
        cmake_config+=' -DBUILD_EXAMPLES=OFF -DBUILD_PLUGINS=OFF -DBUILD_BENCHMARKS=OFF'
    fi
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++. ++. ++. ++. clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/blosc2/filters-registry.h
# include/blosc2/blosc2-stdio.h
# include/blosc2/blosc2-export.h
# include/blosc2/blosc2-common.h
# include/blosc2/codecs-registry.h
# include/blosc2.h
# lib/pkgconfig/blosc2.pc
# lib/libblosc2.a
# lib/libblosc2.so
# share/doc/c-blosc2/BITSHUFFLE.txt
# share/doc/c-blosc2/BLOSC.txt
# share/doc/c-blosc2/SNAPPY.txt
# share/doc/c-blosc2/LZ4.txt
# share/doc/c-blosc2/FASTLZ.txt
# share/doc/c-blosc2/ZLIB.txt
# share/doc/c-blosc2/STDINT.txt
# share/doc/c-blosc2/LICENSE.txt
