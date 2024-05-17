#!/bin/bash

lib='snappy'
apt='libsnappy-dev'
dsc='Snappy is a compression/decompression library'
lic='BSD-3c'
src='https://github.com/google/snappy.git'
cfg='cmake'
eta='12'
dep='lz4 lzo'

pc_llib='-lsnappy'

cmake_static='BUILD_STATIC_LIBS'
cmake_config="-DSNAPPY_BUILD_TESTS=OFF -DSNAPPY_BUILD_BENCHMARKS=OFF"

lst_inc='snappy.h snappy-c.h snappy-stubs-public.h snappy-sinksource.h'
lst_pc='snappy.pc'
lst_lib='libsnappy'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='snappy.pc'

dev_bra='master'
dev_vrs='1.2.0'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/snappy-stubs-public.h
# include/snappy-c.h
# include/snappy-sinksource.h
# include/snappy.h
# lib/pkgconfig/snappy.pc
# lib/libsnappy.so
# lib/cmake/Snappy/SnappyTargets.cmake
# lib/cmake/Snappy/SnappyConfigVersion.cmake
# lib/cmake/Snappy/SnappyConfig.cmake
# lib/cmake/Snappy/SnappyTargets-release.cmake
# lib/libsnappy.a
# share/doc/snappy/AUTHORS
# share/doc/snappy/COPYING