#!/bin/bash

lib='lz4'
pkg='liblz4'
apt='liblz4-dev'
dsc='Fast LZ compression algorithm library'
lic='BSD-2c GPL2.0'
src="https://github.com/lz4/lz4.git"
cfg='cmake'
config_dir='build/cmake'
#config_dir='contrib/meson'
eta='30'

dev_bra='master'
dev_vrs='1.9.5'
stb_bra=''
stb_vrs=''

lst_inc='lz4.h lz4frame.h lz4frame_static.h lz4hc.h'
lst_lib='liblz4'
lst_bin='lz4'
lst_lic='LICENSE'
lst_pc='liblz4.pc'

meson_cfg='-Ddebug_level=0 -Dbin_examples=false -Dbin_contrib=false -Dbin_tests=false'
meson_bin='bin_programs'

on_build_bin(){
    cmake_config+=' -DLZ4_BUILD_CLI=ON -DLZ4_BUILD_LEGACY_LZ4C=ON'
}

on_build_static(){
    cmake_config+=' -DBUILD_STATIC_LIBS=ON'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/lz4.h
# include/lz4frame.h
# include/lz4hc.h
# lib/pkgconfig/liblz4.pc
# lib/liblz4.so
# lib/cmake/lz4/lz4Config.cmake
# lib/cmake/lz4/lz4ConfigVersion.cmake
# lib/cmake/lz4/lz4Targets.cmake
# lib/cmake/lz4/lz4Targets-release.cmake
# lib/liblz4.a
# share/man/man1/lz4.1
# share/man/man1/unlz4.1
# share/man/man1/lz4cat.1
# share/doc/lz4/LICENSE
# bin/lz4
# bin/lz4c
