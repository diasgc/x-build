#!/bin/bash

lib='c-blosc2'
pkg='blosc2'
apt='libblosc-dev'
dsc='A fast, compressed, persistent binary data store library for C.'
lic='BSD-3c'
src='https://github.com/Blosc/c-blosc2.git'
cfg='cmake'
eta='399'

lst_inc='blosc2.h blosc2/*.h'
lst_lib='libblosc2'
lst_bin=''
lst_lic='LICENSE.txt LICENSES/*.txt'
lst_pc='blosc2.pc'

. xbuilder.sh

WFLAGS='-Wno-pointer-sign -Wno-int-conversion'

start

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
