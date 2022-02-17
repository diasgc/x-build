#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .   clang
# GNU  .   .   .  ++++ gcc
# WIN  .   .   .  +++F clang/gcc

lib='libavif'
dsc='Library for encoding and decoding .avif files'
lic='BSD?'
src='https://github.com/AOMediaCodec/libavif.git'
cfg='cmake'
dep='libpng libjpeg libyuv aom'
eta='30'
cbk='AVIF_BUILD_APPS'

lst_inc='avif/avif.h'
lst_lib='libavif'
lst_bin='avifenc avifdec'

. xbuilder.sh

CFG="-DAVIF_BUILD_EXAMPLES=OFF -DAVIF_BUILD_TESTS=OFF -DAVIF_CODEC_AOM=ON"
$host_mingw && CPPFLAGS+=" -D__USE_MINGW_ANSI_STDIO=1"
LDFLAGS+=" -lpthread"

start

# Filelist
# --------
# include/avif/avif.h
# lib/pkgconfig/libavif.pc
# lib/cmake/libavif/libavif-config-release.cmake
# lib/cmake/libavif/libavif-config-version.cmake
# lib/cmake/libavif/libavif-config.cmake
# lib/libavif.so
# bin/avifdec
# bin/avifenc
