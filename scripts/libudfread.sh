#!/bin/bash

lib='libudfread'
dsc='UDF filesystem access library'
lic='LGPL-2.1'
src='https://code.videolan.org/videolan/libudfread.git'
cfg='ar'
eta='40'

dev_bra='master'
dev_vrs='1.1.2'
stb_bra=''
stb_vrs=''

lst_inc='udfread/*.h'
lst_lib='libudfread'
lst_bin=''
lst_lic='COPYING'
lst_pc='libudfread.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/udfread/udfread.h
# include/udfread/blockinput.h
# include/udfread/udfread-version.h
# lib/libudfread.la
# lib/pkgconfig/libudfread.pc
# lib/libudfread.a
# lib/libudfread.so
# share/doc/libudfread/COPYING
