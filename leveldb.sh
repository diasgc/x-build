#!/bin/bash

lib='leveldb'
dsc='LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.'
lic='BSD-3c'
src='https://github.com/google/leveldb.git'
cfg='cmake'
dep='zlib snappy'

cmake_config='-DLEVELDB_BUILD_TESTS=OFF -DLEVELDB_BUILD_BENCHMARKS=OFF'

lst_inc='leveldb/c.h leveldb/cache.h
 leveldb/table_builder.h leveldb/filter_policy.h
 leveldb/status.h leveldb/dumpfile.h
 leveldb/env.h leveldb/slice.h leveldb/export.h
 leveldb/options.h leveldb/write_batch.h
 leveldb/table.h leveldb/iterator.h leveldb/db.h
 leveldb/comparator.h'
lst_lib='libleveldb'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='leveldb.pc'

dev_bra='master'
dev_vrs='1.23.0'
pkg_deb='libleveldb-dev'
eta='112'

on_create_pc(){
    vrs=$(grep -oP 'leveldb VERSION \K([0-9\.]+)' "${dir_src}/CMakeLists.txt")
    build_pkgconfig --libs=-lleveldb --libs-private=-lz,-lsnappy
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

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
