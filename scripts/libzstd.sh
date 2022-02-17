#!/bin/bash

lib='libzstd'
apt='libzstd-dev'
dsc='Zstandard - Fast real-time compression algorithm'
lic='BSD GPL-2.0'
src='https://github.com/facebook/zstd.git'
cfg='cmake'
eta='78'

cmake_static="ZSTD_BUILD_STATIC"
cmake_shared="ZSTD_BUILD_SHARED"
cmake_bin="ZSTD_BUILD_PROGRAMS"

nodev=false
config_dir='build/cmake'

lst_inc='zstd_errors.h zstd.h zdict.h'
lst_lib='libzstd'
lst_bin='zstdgrep zstd zstdless'
lst_lic='LICENSE COPYING'
lst_pc='libzstd.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU +..  .   .   .  gcc
# WIN +..  .   .   .  clang/gcc



# Filelist
# --------
# include/zstd_errors.h
# include/zstd.h
# include/zdict.h
# lib/pkgconfig/libzstd.pc
# lib/libzstd.so
# lib/libzstd.a
# lib/cmake/zstd/zstdConfig.cmake
# lib/cmake/zstd/zstdTargets-release.cmake
# lib/cmake/zstd/zstdConfigVersion.cmake
# lib/cmake/zstd/zstdTargets.cmake
# share/man/man1/zstd.1
# share/man/man1/zstdless.1
# share/man/man1/zstdgrep.1
# share/doc/libzstd/LICENSE
# share/doc/libzstd/COPYING
# bin/zstdgrep
# bin/zstd
# bin/zstdless
