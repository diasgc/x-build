#!/bin/bash

lib='chromaprint'
pkg='libchromaprint'
apt='libchromaprint1'
dsc='C library for generating audio fingerprints used by AcoustID'
src='https://github.com/acoustid/chromaprint.git'
lic='LGPL-2.1'
cfg='cmake'
eta='12'

mkc='clean'
mki='install/strip'
make_install='install/strip'
cmake_static="BUILD_STATIC_LIBS"

lst_inc='chromaprint.h'
lst_lib='libchromaprint'
lst_bin=''
lst_lic='LICENSE.md'
lst_pc='libchromaprint.pc'

dev_bra='master'
dev_vrs='1.5.1'
stb_bra=''
stb_vrs=''

# cb0="-DBUILD_TOOLS=OFF"
# cb1="-DBUILD_TOOLS=OFF" # disable bin: cannot build bin (requires FFMPEG_LIBXXXXX_INCLUDE_DIRS)

. xbuild

cmake_config="-DKISSFFT_SOURCE_DIR=${dir_src}/src/3rdparty/kissfft -DBUILD_TOOLS=OFF -DBUILD_TESTS=OFF"

start

# Patch 01: to build dual static and shared libs
# Patch 02-03: prefix relative paths in pc file
<<'LZS_PATCH'
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=
LZS_PATCH

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/chromaprint.h
# lib/pkgconfig/libchromaprint.pc
# lib/libchromaprint.a
# lib/libchromaprint.so
# share/doc/chromaprint/LICENSE.md

