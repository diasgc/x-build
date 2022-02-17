#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libbpg'
dsc='Better Portable Graphics'
lic='BSD'
src='https://github.com/mirrorer/libbpg.git'
cfg='make'
dep='libjpeg libpng sdl2'
tls='yasm'
eta='60'
pc_llib='-lbpg'
lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

CFG="-i AS=$YASM CC=$CC CXX=$CXX AR=$AR CFLAGS=$CPPFLAGS CXXFLAGS=$CPPFLAGS prefix=${INSTALL_DIR} USE_BPGVIEW=n USE_EMCC=n"
$host_mingw && CFG+=" CONFIG_WIN32=y"

start