#!/bin/bash

lib='libtool'
dsc='A library for reading and writing audio files'
lic='LGPL-3.0'
src='https://git.savannah.gnu.org/git/libtool.git'
cfg='ac'
automake_cmd='./bootstrap'
tls='help2man'
eta='35'
pc_llib="-ltdl"
pc_url="https://savannah.gnu.org/git/?group=libtool"

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''
mki='install'

dev_bra='main'
dev_vrs='2.4.6'
stb_bra=''
stb_vrs=''

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ltdl.h
# include/libltdl/lt_error.h
# include/libltdl/lt_dlloader.h
# include/libltdl/lt_system.h
# lib/pkgconfig/libtool.pc
# lib/libltdl.a
# lib/libltdl.la
# lib/libltdl.so
# share/man/man1/libtoolize.1
# share/man/man1/libtool.1
# share/doc/libtool/AUTHORS
# share/doc/libtool/COPYING
# share/aclocal/ltoptions.m4
# share/aclocal/ltsugar.m4
# share/aclocal/libtool.m4
# share/aclocal/ltversion.m4
# share/aclocal/ltargz.m4
# share/aclocal/ltdl.m4
# share/aclocal/lt~obsolete.m4
# share/libtool/lt_error.c
# share/libtool/COPYING.LIB
# share/libtool/ltdl.h
# share/libtool/slist.c
# share/libtool/lt__alloc.c
# share/libtool/lt__argz.c
# share/libtool/configure.ac
# share/libtool/config-h.in
# share/libtool/lt_dlloader.c
# share/libtool/Makefile.in
# share/libtool/lt__strl.c
# share/libtool/ltdl.c
# share/libtool/build-aux/config.sub
# share/libtool/build-aux/missing
# share/libtool/build-aux/depcomp
# share/libtool/build-aux/config.guess
# share/libtool/build-aux/compile
# share/libtool/build-aux/ltmain.sh
# share/libtool/build-aux/install-sh
# share/libtool/lt__dirent.c
# share/libtool/libltdl/lt__strl.h
# share/libtool/libltdl/lt__argz_.h
# share/libtool/libltdl/lt__dirent.h
# share/libtool/libltdl/slist.h
# share/libtool/libltdl/lt_error.h
# share/libtool/libltdl/lt__alloc.h
# share/libtool/libltdl/lt__glibc.h
# share/libtool/libltdl/lt_dlloader.h
# share/libtool/libltdl/lt_system.h
# share/libtool/libltdl/lt__private.h
# share/libtool/ltdl.mk
# share/libtool/configure
# share/libtool/aclocal.m4
# share/libtool/Makefile.am
# share/libtool/loaders/preopen.c
# share/libtool/loaders/dlopen.c
# share/libtool/loaders/dld_link.c
# share/libtool/loaders/load_add_on.c
# share/libtool/loaders/dyld.c
# share/libtool/loaders/loadlibrary.c
# share/libtool/loaders/shl_load.c
# share/libtool/README
# share/info/libtool.info-1
# share/info/libtool.info-2
# share/info/dir
# share/info/libtool.info
# bin/libtoolize
# bin/libtool
