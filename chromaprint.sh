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
mki='install'
make_install='install'
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

cmake_config="-DBUILD_TOOLS=OFF -DBUILD_TESTS=OFF" #-DKISSFFT_SOURCE_DIR=${dir_src}/src/3rdparty/kissfft 

start

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

