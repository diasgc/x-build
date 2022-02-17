#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# need to include_directories(<${dir_install_include}>) in CMakeLists.txt to avoid snappy.h not found error
# add pc file
# support dual static shared build 

lib='leveldb'
dsc='LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.'
lic='BSD-3c'
src='https://github.com/google/leveldb.git'
cfg='cmake'
dep='zlib snappy'
eta='0'

cmake_config='-DLEVELDB_BUILD_TESTS=OFF -DLEVELDB_BUILD_BENCHMARKS=OFF'
lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuilder.sh

start

# Filelist
# --------
# include/leveldb/c.h
# include/leveldb/cache.h
# include/leveldb/table_builder.h
# include/leveldb/filter_policy.h
# include/leveldb/status.h
# include/leveldb/dumpfile.h
# include/leveldb/env.h
# include/leveldb/slice.h
# include/leveldb/export.h
# include/leveldb/options.h
# include/leveldb/write_batch.h
# include/leveldb/table.h
# include/leveldb/iterator.h
# include/leveldb/db.h
# include/leveldb/comparator.h
# lib/libleveldb.so
# lib/cmake/leveldb/leveldbTargets-release.cmake
# lib/cmake/leveldb/leveldbConfig.cmake
# lib/cmake/leveldb/leveldbConfigVersion.cmake
# lib/cmake/leveldb/leveldbTargets.cmake
# share/doc/leveldb/LICENSE
# share/doc/leveldb/AUTHORS
