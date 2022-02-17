#!/bin/bash

lib='expat'
dsc='Fast streaming XML parser written in C'
lic=''
src='https://github.com/libexpat/libexpat.git'
cfg='ac'
eta='77'
config_dir="expat"

ac_bin='--without-examples|--with-examples'
ac_config='--without-tests --without-docbook --without-xmlwf --disable-fast-install'

cmake_shared='EXPAT_SHARED_LIBS'
cmake_bin='EXPAT_BUILD_TOOLS'
cmake_config='-DEXPAT_BUILD_EXAMPLES=OFF -DEXPAT_BUILD_TESTS=OFF'

lst_inc='expat_config.h expat.h expat_external.h'
lst_lib='libexpat'
lst_bin=''
lst_lic='expat/COPYING expat/AUTHORS'
lst_pc='expat.pc'

dev_bra='master'
dev_vrs='2.4.4'
stb_bra=''
stb_vrs=''

. xbuilder.sh

source_config(){
    ./buildconf.sh
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/expat_config.h
# include/expat.h
# include/expat_external.h
# share/doc/expat/COPYING
# share/doc/expat/changelog
# share/doc/expat/AUTHORS
# lib/libexpat.a
# lib/cmake/expat-2.4.3/expat-noconfig.cmake
# lib/cmake/expat-2.4.3/expat.cmake
# lib/cmake/expat-2.4.3/expat-config-version.cmake
# lib/cmake/expat-2.4.3/expat-config.cmake
# lib/libexpat.so
# lib/pkgconfig/expat.pc
# lib/libexpat.la
