#!/bin/bash

lib='ucl'
dsc='UCL is a portable lossless data compression library written in ANSI C'
lic='GPL-2.0'
src='https://github.com/korczis/ucl.git'
url='http://www.oberhumer.com/opensource/ucl'
cfg='ac'
eta='0'

dev_vrs='1.03'

pc_llib='-lucl'
lst_inc='ucl/*.h'
lst_lib='libucl'
lst_bin=''
lst_lic='COPYING README'
lst_pc='ucl.pc'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/ucl/COPYING
# share/doc/ucl/README
# include/ucl/ucl.h
# include/ucl/uclconf.h
# include/ucl/uclutil.h
# lib/pkgconfig/ucl.pc
# lib/libucl.a
# lib/libucl.la
# lib/libucl.so
