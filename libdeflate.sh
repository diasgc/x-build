#!/bin/bash

lib='libdeflate'
pkg_deb='libdeflate-dev'
dsc='Fast, whole-buffer DEFLATE-based compression and decompression'
lic='MIT'
src="https://github.com/ebiggers/libdeflate.git"
dep='zlib'
cfg='cmake'
cmake_static='LIBDEFLATE_BUILD_STATIC_LIB'
cmake_shared='LIBDEFLATE_BUILD_SHARED_LIB'
cmake_config='-DLIBDEFLATE_USE_SHARED_LIB=OFF'c
eta='10'

pc_llib='-ldeflate'

dev_vrs='1.10'

lst_inc='libdeflate.h'
lst_lib='libdeflate'
lst_bin='gzip'
lst_lic='COPYING'
lst_pc='libdeflate.pc'

on_config_arm(){
    $host_arm32 && cmake_config='-DENABLE_CRC=OFF'
    return 0
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/libdeflate.h
# lib/pkgconfig/libdeflate.pc
# lib/libdeflate.so
# lib/libdeflate.a
# share/doc/libdeflate/COPYING
# bin/gzip
