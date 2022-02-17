#!/bin/bash

lib='c-blosc'
pkg='blosc'
apt='libblosc-dev'
dsc='A blocking, shuffling and loss-less compression library that can be faster than memcpy().'
lic='Other'
src='https://github.com/Blosc/c-blosc.git'
cfg='cmake'
eta='100'

cmake_static='BUILD_STATIC'
cmake_shared='BUILD_SHARED'
cmake_config='-DBUILD_TESTS=OFF'

lst_inc='blosc-export.h blosc.h'
lst_lib='libblosc'
lst_bin=''
lst_lic='LICENSES/*'
lst_pc='blosc.pc'

. xbuilder.sh


WFLAGS='-Wno-unused-variable -Wno-unused-but-set-variable'
$host_arm && cmake_config+=" -DDEACTIVATE_SSE2=ON -DDEACTIVATE_AVX2=ON"

start

# cpu av8 av7 x86 x64
# NDK ++. ++. ++. ++. clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/blosc-export.h
# include/blosc.h
# lib/libblosc.so
# lib/pkgconfig/blosc.pc
# lib/libblosc.a
# share/doc/c-blosc/BITSHUFFLE.txt
# share/doc/c-blosc/BLOSC.txt
# share/doc/c-blosc/SNAPPY.txt
# share/doc/c-blosc/LZ4.txt
# share/doc/c-blosc/FASTLZ.txt
# share/doc/c-blosc/ZLIB.txt
# share/doc/c-blosc/STDINT.txt
