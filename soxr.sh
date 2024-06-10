#!/bin/bash

lib='soxr'
pkg_deb='libsoxr-dev'
dsc='The SoX resampler library'
lic='LGPL-2.1'
src='https://git.code.sf.net/p/soxr/code.git'
cfg='cmake'
patch="soxr-01"
eta='45'
cmake_bin='BUILD_EXAMPLES'
cmake_config='-DBUILD_TESTS=OFF -DWITH_OPENMP=OFF'
cmake_cxx_flags_release=(-Ofast -flto -g -DNDEBUG)
cmake_definitions=(-Wno-c99-extensions)

lst_inc='soxr.h soxr-lsr.h'
lst_lib='libsoxr.a libsoxr-lsr.a'
lst_bin=''
lst_lic='share/doc/libsoxr/LICENCE'

dev_bra='master'
dev_vrs='0.1.3'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++  ++  ++  ++  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/soxr-lsr.h
# include/soxr.h
# lib/libsoxr-lsr.a
# lib/pkgconfig/soxr.pc
# lib/pkgconfig/soxr-lsr.pc
# lib/libsoxr.a
# lib/libsoxr-lsr.so
# lib/libsoxr.so
# share/doc/libsoxr/NEWS
# share/doc/libsoxr/LICENCE
# share/doc/libsoxr/README
