#!/bin/bash

lib='flac'
dsc='Free Lossless Audio Codec'
lic='BSD'
src='https://github.com/xiph/flac.git'
cfg='ag'
dep='ogg libiconv'
eta='60'

lst_inc='FLAC++/*.h FLAC/*.h'
lst_lib='libFLAC libFLAC++'
lst_bin='flac metaflac'
lst_lic='COPYING.FDL COPYING.GPL COPYING.LGPL COPYING.Xiph AUTHORS'
lst_pc='flac.pc flac++.pc'

cmake_config='-DBUILD_CXXLIBS=ON -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DINSTALL_MANPAGES=OFF -DWITH_ASM=ON -DWITH_OGG=ON'
cmake_bin='BUILD_PROGRAMS'

dev_bra='main'
dev_vrs='1.3.3'
stb_bra=''
stb_vrs=''

. xbuilder.sh

$host_arm && ac_config=" --disable-asm-optimizations --disable-vsx --disable-avx --disable-sse --disable-altivec"
if [ "$build_tool" == "cmake" ] && $host_mingw; then
  LD=$CC; AS=nasm
fi

before_make(){
  # Patch to remove docs (automake)
  [ "$build_tool" == "automake" ] && sed -i "s|SUBDIRS = doc include|SUBDIRS = include|g" Makefile
}

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++ +++  .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/FLAC++/decoder.h
# include/FLAC++/metadata.h
# include/FLAC++/export.h
# include/FLAC++/encoder.h
# include/FLAC++/all.h
# include/FLAC/metadata.h
# include/FLAC/format.h
# include/FLAC/stream_decoder.h
# include/FLAC/stream_encoder.h
# include/FLAC/export.h
# include/FLAC/callback.h
# include/FLAC/ordinals.h
# include/FLAC/all.h
# include/FLAC/assert.h
# lib/pkgconfig/flac.pc
# lib/pkgconfig/flac++.pc
# lib/libFLAC.so
# lib/libFLAC.a
# lib/libFLAC++.so
# lib/libFLAC.la
# lib/libFLAC++.a
# lib/libFLAC++.la
# share/man/man1/flac.1
# share/man/man1/metaflac.1
# share/doc/flac/AUTHORS
# share/doc/flac/COPYING.GPL
# share/doc/flac/COPYING.LGPL
# share/doc/flac/COPYING.FDL
# share/doc/flac/COPYING.Xiph
# share/aclocal/libFLAC++.m4
# share/aclocal/libFLAC.m4
# bin/flac
# bin/metaflac
