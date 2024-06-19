#!/bin/bash

lib='vorbis'
dsc='Ogg Vorbis audio format'
lic='BSD'
src='https://github.com/xiph/vorbis.git'
patch="vorbis-01"
dep='ogg'

cfg='cmake'
cmake_config='-DBUILD_TESTING=OFF'
cmake_static='BUILD_STATIC_LIBS'

dev_vrs='1.3.7'
pkg_deb='libvorbis-dev'
eta='48'

lst_inc='vorbis/*.h'
lst_lib='libvorbisfile libvorbisenc libvorbis'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='vorbisfile.pc vorbisenc.pc vorbis.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# share/doc/vorbis/AUTHORS
# share/doc/vorbis/COPYING
# lib/cmake/Vorbis/VorbisConfigVersion.cmake
# lib/cmake/Vorbis/VorbisConfig.cmake
# lib/cmake/Vorbis/VorbisTargets-release.cmake
# lib/cmake/Vorbis/VorbisTargets.cmake
# lib/libvorbisfile.a
# lib/libvorbisenc.a
# lib/libvorbis.a
# lib/libvorbisfile.so
# lib/libvorbisenc.so
# lib/libvorbis.so
# include/vorbis/vorbisfile.h
# include/vorbis/vorbisenc.h
# include/vorbis/codec.h
# lib/pkgconfig/vorbisfile.pc
# lib/pkgconfig/vorbisenc.pc
# lib/pkgconfig/vorbis.pc