#!/bin/bash

lib='libdvdread'
apt="${lib}-dev"
pkg='dvdread'
dsc='Library to read DVD disks'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/libdvdread.git'
cfg='ar'
eta='52'
mki='install-strip'
mkc='distclean'

dev_bra='main'
dev_vrs='6.1.2'
stb_bra=''
stb_vrs=''

lst_inc='dvdread/*.h'
lst_lib='libdvdread'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='dvdread.pc'

. xbuilder.sh

CFG="--disable-apidoc"

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc



# Filelist
# --------
# include/dvdread/nav_types.h
# include/dvdread/ifo_print.h
# include/dvdread/bitreader.h
# include/dvdread/ifo_types.h
# include/dvdread/dvd_udf.h
# include/dvdread/version.h
# include/dvdread/nav_read.h
# include/dvdread/dvd_reader.h
# include/dvdread/nav_print.h
# include/dvdread/ifo_read.h
# lib/pkgconfig/dvdread.pc
# lib/libdvdread.la
# lib/libdvdread.a
# lib/libdvdread.so
# share/doc/libdvdread/NEWS
# share/doc/libdvdread/AUTHORS
# share/doc/libdvdread/README.md
# share/doc/libdvdread/ChangeLog
# share/doc/libdvdread/COPYING
# share/doc/libdvdread/TODO
