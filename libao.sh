#!/bin/bash

#vrs='1.2.2'
lib='libao'
dsc='Audio output portability library.'
lic='GPL-2'
src='https://gitlab.xiph.org/xiph/libao.git'
cfg='ag'
pkg='ao'
eta='60'

lst_inc='ao/*.h'
lst_lib='libao'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='ao.pc'

. xbuilder.sh

before_make(){
	#no docs
	sed -i '/^SUBDIRS/ {s/ doc//}' ${dir_src}/Makefile
}

start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ao/ao.h
# include/ao/plugin.h
# include/ao/os_types.h
# lib/pkgconfig/ao.pc
# lib/ao/plugins-4/liboss.la
# lib/ao/plugins-4/liboss.so
# lib/ao/plugins-4/liboss.a
# lib/libao.a
# lib/ckport/db/libao.ckport
# lib/libao.so
# lib/libao.la
# share/man/man5/libao.conf.5
# share/doc/libao/AUTHORS
# share/doc/libao/COPYING
# share/aclocal/ao.m4
