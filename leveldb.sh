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
dev_vrs='1.23'
stb_bra=''
stb_vrs=''

. xbuild && start

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

<<'DIFF::CMakeLists.txt'
233c233
< target_include_directories(leveldb
---
> target_include_directories(leveldb_o
239c239
< set_target_properties(leveldb
---
> set_target_properties(leveldb_o
242c242
< target_compile_definitions(leveldb
---
> target_compile_definitions(leveldb_o
250c250
<   target_compile_definitions(leveldb
---
>   target_compile_definitions(leveldb_o
256,263d255
< if(BUILD_SHARED_LIBS)
<   target_compile_definitions(leveldb
<     PUBLIC
<       # Used by include/export.h.
<       LEVELDB_SHARED_LIBRARY
<   )
< endif(BUILD_SHARED_LIBS)
< 
265c257
<   target_compile_options(leveldb
---
>   target_compile_options(leveldb_o
271c263
<   target_link_libraries(leveldb crc32c)
---
>   target_link_libraries(leveldb_o crc32c)
274c266
<   target_link_libraries(leveldb snappy)
---
>   target_link_libraries(leveldb_o snappy)
277c269
<   target_link_libraries(leveldb tcmalloc)
---
>   target_link_libraries(leveldb_o tcmalloc)
282c274,292
< target_link_libraries(leveldb Threads::Threads)
---
> target_link_libraries(leveldb_o Threads::Threads)
> 
> set(leveldb_targets)
> if(BUILD_STATIC_LIBS OR NOT BUILD_SHARED_LIBS)
>   add_library(leveldb_static STATIC $<TARGET_OBJECT:${leveldb_o}>)
>   set_target_properties(leveldb_shared PROPERTIES OUTPUT_NAME leveldb)
>   list(APPEND leveldb_targets leveldb_shared)
> endif()
> if(BUILD_SHARED_LIBS)
>   add_library(leveldb_shared SHARED $<TARGET_OBJECT:${leveldb_o}>)
>   target_compile_definitions(leveldb_shared
>     PUBLIC
>       # Used by include/export.h.
>       LEVELDB_SHARED_LIBRARY
>   )
>   set_target_properties(leveldb_shared PROPERTIES OUTPUT_NAME leveldb)
>   list(APPEND leveldb_targets leveldb_shared)
> endif()
> 
467c477
<   install(TARGETS leveldb
---
>   install(TARGETS ${leveldb_targets}
DIFF::CMakeLists.txt