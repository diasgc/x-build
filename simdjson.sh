#!/bin/bash

lib='simdjson'
dsc='Parsing gigabytes of JSON per second'
lic='Apache-2.0'
src='https://github.com/simdjson/simdjson.git'
cfg='cmake'
patch="simdjson-01"

cmake_static='BUILD_STATIC_LIBS'

dev_vrs='1.0.2'
pkg_deb=''
eta=0

lst_inc='simdjson.h'
lst_lib='libsimdjson'
lst_bin=''
lst_pc='simdjson.pc'
lst_lic='LICENSE AUTHORS README.md'

on_create_pc(){
    build_pkgconfig --libs=-lsimdjson
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/simdjson.h
# lib/cmake/simdjson/simdjson-config-version.cmake
# lib/cmake/simdjson/simdjson-config.cmake
# lib/cmake/simdjson/simdjsonTargets-release.cmake
# lib/cmake/simdjson/simdjsonTargets.cmake
# lib/libsimdjson.a
# lib/libsimdjson.so
# lib/pkgconfig/libsimdjson.pc
# share/doc/simdjson/AUTHORS
# share/doc/simdjson/LICENSE
# share/doc/simdjson/README.md
