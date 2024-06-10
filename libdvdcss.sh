#!/bin/bash

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libdvdcss'
pkg_deb="${lib}-dev"
dsc='Library for accessing DVDs like block devices with transparent decryption'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/libdvdcss.git'
cfg='ar'

dev_bra='main'
dev_vrs='1.4.3'
eta='10'

lst_inc='dvdcss/*.h'
lst_lib='libdvdcss'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='libdvdcss.pc'

. xbuild && start

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