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
dev_vrs='1.1.9'
stb_bra=''
stb_vrs='1.1.9'

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

<<'LZS_PATCH'
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
y2/cMeXLz5oBEVoAA=
LZS_PATCH
