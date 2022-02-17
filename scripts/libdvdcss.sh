#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ++0 ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libdvdcss'
apt="${lib}-dev"
dsc='Library for accessing DVDs like block devices with transparent decryption'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/libdvdcss.git'
cfg='ar'
eta='10'
mki='install-strip'
mkc='distclean'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='dvdcss/*.h'
lst_lib='libdvdcss'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='libdvdcss.pc'

. xbuilder.sh

start

# Filelist
# --------
# include/dvdcss/dvdcss.h
# include/dvdcss/version.h
# lib/pkgconfig/libdvdcss.pc
# lib/libdvdcss.so
# lib/libdvdcss.la
# lib/libdvdcss.a
# share/doc/libdvdcss/NEWS
# share/doc/libdvdcss/AUTHORS
# share/doc/libdvdcss/README.md
# share/doc/libdvdcss/ChangeLog
# share/doc/libdvdcss/COPYING
