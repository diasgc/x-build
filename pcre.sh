#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='pcre'
pkg='libpcre'
dsc=''
lic='BSD-3c'
src='https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz'
cfg='cmake'
dep='bzip2 readline editline'
eta='0'

lst_inc='pcre.h pcreposix.h pcrecpparg.h pcre_scanner.h pcre_stringpiece.h pcrecpp.h'
lst_lib='libpcreposix libpcrecpp libpcre'
lst_bin='pcre_scanner_unittest pcrecpp_unittest pcregrep pcre-config pcretest pcre_stringpiece_unittest'

. xbuild

$build_static && CSH="-DBUILD_SHARED_LIBS=OFF"

start

# Filelist
# --------
# include/pcre.h
# include/pcreposix.h
# include/pcrecpparg.h
# include/pcre_scanner.h
# include/pcre_stringpiece.h
# include/pcrecpp.h
# lib/pkgconfig/libpcreposix.pc
# lib/pkgconfig/libpcre.pc
# lib/pkgconfig/libpcrecpp.pc
# lib/libpcreposix.a
# lib/libpcrecpp.a
# lib/libpcre.a
# bin/pcre_scanner_unittest
# bin/pcrecpp_unittest
# bin/pcregrep
# bin/pcre-config
# bin/pcretest
# bin/pcre_stringpiece_unittest
