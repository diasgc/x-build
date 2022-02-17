#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='libraw1394'
apt="${lib}-dev"
dsc='Interface library for the Linux IEEE1394 drivers.'
lic='LGPL-2.1'
src='https://github.com/Distrotech/libraw1394.git'
cfg='ac'
eta='30'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING.LIB AUTHORS'
lst_pc=''

. xbuilder.sh

start

# Filelist
# --------
# include/libraw1394/ieee1394.h
# include/libraw1394/raw1394.h
# include/libraw1394/csr.h
# share/man/man5/isodump.5
# share/man/man1/dumpiso.1
# share/man/man1/testlibraw.1
# share/man/man1/sendiso.1
# share/doc/libraw1394/AUTHORS
# share/doc/libraw1394/COPYING.LIB
# lib/libraw1394.la
# lib/libraw1394.so.11.0.1
# lib/pkgconfig/libraw1394.pc
# lib/libraw1394.a
# bin/sendiso
# bin/dumpiso
# bin/testlibraw
