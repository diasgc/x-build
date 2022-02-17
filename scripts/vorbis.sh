#!/bin/bash

lib='vorbis'
apt='libvorbis0a'
dsc='Ogg Vorbis audio format'
lic='BSD'
src='https://github.com/xiph/vorbis.git'
cfg='ag'
dep='ogg'
eta='77'

dev_bra='master'
dev_vrs='1.3.7'
stb_bra=''
stb_vrs=''

lst_inc='vorbis/*.h'
lst_lib='libvorbisfile libvorbisenc libvorbis'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='vorbisfile.pc vorbisenc.pc vorbis.pc'

. xbuilder.sh

cmake_config='-DBUILD_TESTING=OFF'
ac_config='--disable-docs --disable-examples --disable-oggtest'

before_make(){
  # patch lib/Makefile on x86-android
  $host_ndk && $host_x86 && sed -i 's| -mno-ieee-fp||g' ${dir_src}/lib/Makefile
  # Build No Docs
  sed -i 's|SUBDIRS = m4 include vq lib test doc|SUBDIRS = m4 include vq lib test|' Makefile
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# note: vorbis --shared build requires ogg --shared
# otherwise relocation errors may occur


# Filelist
# --------
# include/vorbis/vorbisfile.h
# include/vorbis/vorbisenc.h
# include/vorbis/codec.h
# lib/pkgconfig/vorbisfile.pc
# lib/pkgconfig/vorbisenc.pc
# lib/pkgconfig/vorbis.pc
# lib/libvorbisenc.a
# lib/libvorbisfile.so
# lib/libvorbisenc.la
# lib/libvorbisfile.a
# lib/libvorbisenc.so
# lib/libvorbis.a
# lib/libvorbis.so
# lib/libvorbisfile.la
# lib/libvorbis.la
# share/doc/vorbis/AUTHORS
# share/doc/vorbis/COPYING
# share/aclocal/vorbis.m4
