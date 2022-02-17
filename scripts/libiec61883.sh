#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ ... ... ... CLANG
# GNU +++ ... ... ... GCC
# WIN  F  ... ... ... CLANG/GCC

lib='libiec61883'
apt="${lib}-dev"
dsc='An isochronous streaming media library for IEEE 1394'
lic='LGPL-2.1'
src='https://github.com/Distrotech/libiec61883.git'
cfg='ar'
dep='libraw1394'
eta='15'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

. xbuilder.sh

#$host_mingw && unset dep

start


# Filelist
# --------
# include/libiec61883/iec61883.h
# share/man/man1/plugctl.1
# share/man/man1/plugreport.1
# share/doc/libiec61883/COPYING
# share/doc/libiec61883/AUTHORS
# lib/libiec61883.so
# lib/libiec61883.a
# lib/pkgconfig/libiec61883.pc
# lib/libiec61883.la
# bin/plugreport
# bin/plugctl
