#!/bin/bash

lib='brunsli'
pkg='brunslienc-c'
dsc='Practical JPEG Repacker'
lic='MIT'
src='https://github.com/google/brunsli.git'
sub='submodule update --init'
cfg='cmake'

patch='brunsli-01'
lst_inc='brunsli/*.h'
lst_lib='libbrunslidec-c libbrunslienc-c'
lst_bin='dbrunsli cbrunsli'
lst_lic='LICENSE'
lst_pc='brunslienc-c.pc brunslidec-c.pc'

dev_vrs='v0.1'
pkg_deb=''
eta='30'

cmake_config="-DBUILD_TESTING=OFF -DINSTALL_GTEST=OFF"

on_create_pc(){
    build_pkgconfig --name=brunslienc-c --libs=-lbrunslienc-c
    build_pkgconfig --name=brunslidec-c --libs=-lbrunslidec-c
}

. xbuild && start 


# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU ...  .   .   .  gcc
# WIN +++  .   .  +++ clang/gcc

# Filelist
# --------
# include/brunsli/jpeg_data_writer.h
# include/brunsli/status.h
# include/brunsli/brunsli_encode.h
# include/brunsli/types.h
# include/brunsli/decode.h
# include/brunsli/brunsli_decode.h
# include/brunsli/jpeg_data.h
# include/brunsli/jpeg_data_reader.h
# include/brunsli/encode.h
# lib/libbrunslidec-c.so
# lib/pkgconfig/brunslienc-c.pc
# lib/pkgconfig/brunslidec-c.pc
# lib/libbrunslienc-c.so
# lib/libbrunslidec-c.a
# lib/libbrunslienc-c.a
# share/doc/brunsli/LICENSE
# bin/dbrunsli
# bin/cbrunsli
