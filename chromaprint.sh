#!/bin/bash

lib='chromaprint'
pkg='libchromaprint'
apt='libchromaprint1'
dsc='C library for generating audio fingerprints used by AcoustID'
src='https://github.com/acoustid/chromaprint.git'
lic='LGPL-2.1'
cfg='cmake'
eta='12'
dep='fftw'

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

. xbuild

cmake_config="-DBUILD_TOOLS=OFF -DBUILD_TESTS=OFF -DFFMPEG_LIBRARIES=OFF -DFFT_LIB=fftw3" #-DKISSFFT_SOURCE_DIR=${dir_src}/src/3rdparty/kissfft

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

