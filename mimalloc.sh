#!/bin/bash

lib='mimalloc'
dsc='mimalloc is a compact general purpose allocator with excellent performance.'
lic='MIT'
src='https://github.com/microsoft/mimalloc.git'
cfg='cmake'
eta='64'

cmake_shared='MI_BUILD_SHARED'
cmake_static='MI_BUILD_STATIC'

pc_llib='-lmimalloc'

dev_bra=''
dev_vrs='1.7.5'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# include/mimalloc-1.7/mimalloc-new-delete.h
# include/mimalloc-1.7/mimalloc-override.h
# include/mimalloc-1.7/mimalloc.h
# share/doc/mimalloc/LICENSE
# lib/libmimalloc.so
# lib/pkgconfig/libmimalloc.pc
# lib/mimalloc-1.7/mimalloc.o
# lib/mimalloc-1.7/libmimalloc.a
# lib/cmake/mimalloc-1.7/mimalloc-release.cmake
# lib/cmake/mimalloc-1.7/mimalloc.cmake
# lib/cmake/mimalloc-1.7/mimalloc-config-version.cmake
# lib/cmake/mimalloc-1.7/mimalloc-config.cmake
# lib/cmake/mimalloc-1.7/mimalloc-release.cmake
# lib/cmake/mimalloc-1.7/mimalloc.cmake
