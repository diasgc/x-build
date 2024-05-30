#!/bin/bash

lib='librsync'
dsc='Remote delta-compression library'
lic='LGPL-2.1'
src='https://github.com/librsync/librsync.git'
url='librsync.sourcefrog.net'
cfg='cmake'
patch="librsync-01"
dep='zlib libb2 bzip2'
eta='0'

cmake_static='BUILD_STATIC_LIBS'
cmake_config='-DINSTALL_MANFILES=OFF'

dev_vrs='2.3.3'

lst_inc='librsync.h librsync_export.h'
lst_lib='librsync'
lst_bin=''
lst_lic='COPYING AUTHORS README.md'
lst_pc='librsync.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/librsync.h
# include/librsync_export.h
# lib/librsync.a
# lib/librsync.so
# lib/pkgconfig/librsync.pc
# share/doc/librsync/AUTHORS
# share/doc/librsync/COPYING
# share/doc/librsync/README.md