#!/bin/bash

lib='libdeflate'
apt='libdeflate-dev'
dsc='Fast, whole-buffer DEFLATE-based compression and decompression'
lic='MIT'
src="https://github.com/ebiggers/libdeflate.git"
dep='zlib'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
eta='10'

pc_llib='-ldeflate'

dev_vrs='1.10'

lst_inc='libdeflate.h'
lst_lib='libdeflate'
lst_bin='gzip'
lst_lic='COPYING'
lst_pc='libdeflate.pc'

. xbuild 

$host_arm32 && cmake_config='-DENABLE_CRC=OFF'

start

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
