#!/bin/bash

lib='ogg'
apt='libogg0'
dsc='Ogg media container'
lic='BSD'
src='https://github.com/xiph/ogg.git'
cfg='cmake'
eta='3'

#ac_bin="--disable-extra-programs|--enable-extra-programs"

lst_inc='ogg/*.h'
lst_lib='libogg'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='ogg.pc'

cmake_static='BUILD_STATIC_LIBS'
cmake_config='-DBUILD_TESTING=OFF -DINSTALL_DOCS=OFF'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++  ++  ++  ++  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# include/ogg/config_types.h
# include/ogg/config_types.h
# include/ogg/ogg.h
# include/ogg/ogg.h
# include/ogg/os_types.h
# include/ogg/os_types.h
# lib/cmake/Ogg/OggConfig.cmake
# lib/cmake/Ogg/OggConfigVersion.cmake
# lib/cmake/Ogg/OggTargets.cmake
# lib/cmake/Ogg/OggTargets-release.cmake
# lib/libogg.a
# lib/libogg.so
# lib/pkgconfig/ogg.pc
