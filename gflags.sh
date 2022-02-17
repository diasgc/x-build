#!/bin/bash

lib='gflags'
dsc='A C++ library that implements commandline flags processing'
lic='BSD-3c'
src='https://github.com/gflags/gflags.git'
cfg='cmake'
eta='0'

cmake_static='GFLAGS_BUILD_STATIC_LIBS'
cmake_shared='GFLAGS_BUILD_SHARED_LIBS'

dev_bra='master'
dev_vrs='2.2.2'
stb_bra=''
stb_vrs=''

lst_inc='gflags/*.h'
lst_lib='libgflags libgflags_nothreads'
lst_bin='gflags_completions.sh'
lst_lic='COPYING AUTHORS'
lst_pc='gflags.pc'

eta='20'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/gflags/gflags_completions.h
# include/gflags/gflags_declare.h
# include/gflags/gflags_gflags.h
# include/gflags/gflags.h
# lib/pkgconfig/gflags.pc
# lib/libgflags.so
# lib/cmake/gflags/gflags-nonamespace-targets-release.cmake
# lib/cmake/gflags/gflags-config.cmake
# lib/cmake/gflags/gflags-config-version.cmake
# lib/cmake/gflags/gflags-targets.cmake
# lib/cmake/gflags/gflags-targets-release.cmake
# lib/cmake/gflags/gflags-nonamespace-targets.cmake
# lib/libgflags_nothreads.a
# lib/libgflags_nothreads.so
# lib/libgflags.a
# bin/gflags_completions.sh
