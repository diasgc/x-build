#!/bin/bash
# cpu av8 av7 x86 x64
# NDK ++.  .   .   .  clang
# GNU ...  .   .   .  gcc
# WIN ...  .   .   .  clang/gcc

lib='tinyxml2'
apt="${lib}-dev"
dsc='TinyXML2 is a simple, small, efficient, C++ XML parser that can be easily integrated into other programs.'
lic='Zlib'
src='https://github.com/leethomason/tinyxml2.git'
cfg='meson'
eta='10'

lst_inc='tinyxml2.h'
lst_lib='libtinyxml2'
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# include/tinyxml2.h
# lib/pkgconfig/tinyxml2.pc
# lib/libtinyxml2.so
# lib/libtinyxml2.a
