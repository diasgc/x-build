#!/bin/bash

lib='expat'
dsc='Fast streaming XML parser written in C'
lic=''
src='https://github.com/libexpat/libexpat.git'
cfg='cmake'
eta='77'
config_dir="expat"

ac_cfg='./buildconf.sh'
ac_bin='--without-examples|--with-examples'
ac_config='--without-tests --without-docbook --without-xmlwf --disable-fast-install'

cmake_static='BUILD_STATIC_LIBS'
cmake_bin='EXPAT_BUILD_TOOLS'
cmake_config='-DEXPAT_BUILD_EXAMPLES=OFF -DEXPAT_BUILD_TESTS=OFF'

lst_inc='expat_config.h expat.h expat_external.h'
lst_lib='libexpat'
lst_bin=''
lst_lic='expat/COPYING expat/AUTHORS'
lst_pc='expat.pc'

dev_bra='master'
dev_vrs='2.4.8'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

<<'LZS_PATCH'
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
LZS_PATCH


# Filelist
# --------
#
# bin/xmlwf
# include/expat_config.h
# include/expat_external.h
# include/expat.h
# lib/cmake/expat-2.4.8/expat.cmake
# lib/cmake/expat-2.4.8/expat-config.cmake
# lib/cmake/expat-2.4.8/expat-config-version.cmake
# lib/cmake/expat-2.4.8/expat-release.cmake
# lib/libexpat.a
# lib/libexpat.so
# lib/pkgconfig/expat.pc
# share/doc/expat/AUTHORS
# share/doc/expat/changelog
# share/doc/expat/expat/AUTHORS
# share/doc/expat/expat/COPYING
