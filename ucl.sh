#!/bin/bash

lib='ucl'
dsc='UCL is a portable lossless data compression library written in ANSI C'
lic='GPL-2.0'
src='https://github.com/korczis/ucl.git'
url='http://www.oberhumer.com/opensource/ucl'

#cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_PROGRAM'

dev_vrs='1.03'

cfg='ac'
pc_llib='-lucl'

lst_inc='ucl/*.h'
lst_lib='libucl'
lst_bin=''
lst_lic='COPYING README'
lst_pc='ucl.pc'
build_strip=false
eta='14'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# bin/uclpack
# include/ucl/ucl.h
# include/ucl/uclconf.h
# include/ucl/uclutil.h
# lib/libucl.a
# lib/libucl.so
# lib/pkgconfig/ucl.pc
# share/doc/ucl/COPYING
# share/doc/ucl/README