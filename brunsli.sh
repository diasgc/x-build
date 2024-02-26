#!/bin/bash

lib='brunsli'
pkg='brunslienc-c'
dsc='Practical JPEG Repacker'
lic='MIT'
src='https://github.com/google/brunsli.git'
cfg='cmake'
eta='30'

lst_inc='brunsli/*.h'
lst_lib='libbrunslidec-c libbrunslienc-c'
lst_bin='dbrunsli cbrunsli'
lst_lic='LICENSE'
lst_pc='brunslienc-c.pc brunslidec-c.pc'

dev_vrs='0.1'

pc_llibs='libbrunslidec-c libbrunslienc-c'

cmake_config="-DBUILD_TESTING=OFF -DINSTALL_GTEST=OFF"

. xbuild

source_patch(){
    git submodule update --init
}

start


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
