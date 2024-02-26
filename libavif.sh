#!/bin/bash

lib='libavif'
dsc='Library for encoding and decoding .avif files'
lic='BSD?'
src='https://github.com/AOMediaCodec/libavif.git'
cfg='cmake'
dep='libpng libjpeg libyuv aom'
eta='30'
cmake_bin='AVIF_BUILD_APPS'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='avif/avif.h'
lst_lib='libavif'
lst_bin='avifenc avifdec'
lst_lic='LICENSE README.md'
lst_pc='libavif.pc'
dev_vrs='0.9.3'

. xbuild

CFG="-DAVIF_ENABLE_WERROR=OFF -DAVIF_BUILD_EXAMPLES=OFF -DAVIF_BUILD_TESTS=OFF -DAVIF_CODEC_AOM=ON"
$host_mingw && CPPFLAGS+=" -D__USE_MINGW_ANSI_STDIO=1"
LDFLAGS+=" -lpthread"

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .   clang
# GNU  .   .   .  ++++ gcc
# WIN  .   .   .  +++F clang/gcc


# Filelist
# --------
#
# bin/avifdec
# bin/avifenc
# include/avif/avif.h
# lib/cmake/libavif/libavif-config-release.cmake
# lib/cmake/libavif/libavif-config-version.cmake
# lib/cmake/libavif/libavif-config.cmake
# lib/libavif.a
# lib/libavif.so
# lib/pkgconfig/libavif.pc
# share/doc/libavif/LICENSE
# share/doc/libavif/README.md
