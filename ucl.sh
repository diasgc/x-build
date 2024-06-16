#!/bin/bash

lib='ucl'
dsc='UCL is a portable lossless data compression library written in ANSI C'
lic='GPL-2.0'
src='https://github.com/korczis/ucl.git'
url='http://www.oberhumer.com/opensource/ucl'

#cfg='cmake'
#patch="ucl-01"
#cmake_static='BUILD_STATIC_LIBS'
#cmake_bin='BUILD_PROGRAM'

cfg='ac'
build_strip=false

on_create_pc(){
    build_pkgconfig --libs=-lucl
}

dev_vrs='1.03'
pkg_deb='libucl-dev'
eta='14'

lst_inc='ucl/ucl.h
 ucl/uclconf.h
 ucl/uclutil.h'
lst_lib='libucl'
lst_bin='uclpack'
lst_lic='COPYING README'
lst_pc='ucl.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# bin/uclpack
# include/ucl/ucl.h
# include/ucl/uclconf.h
# include/ucl/uclutil.h
# lib/libucl.a
# lib/libucl.so
# lib/pkgconfig/ucl.pc
# share/doc/ucl/COPYING
# share/doc/ucl/README