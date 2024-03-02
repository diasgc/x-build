#!/bin/bash

lib='libiconv'
dsc='Character set conversion library'
lic='LGPL2.1'
vrs='1.17' src="https://ftp.gnu.org/gnu/libiconv/libiconv-${vrs}.tar.gz"
#src='https://git.savannah.gnu.org/git/libiconv.git'
eta='90'
cfg='ac'

pc_llib="-liconv"
pc_url="https://www.gnu.org/software/libiconv"

ac_config=" --enable-extra-encodings"
ac_reconf=false

lst_inc='iconv.h libcharset.h localcharset.h'
lst_lib='libiconv libcharset'
lst_bin='iconv'
lst_lic='COPYING COPYING.LIB AUTHORS'
lst_pc='libiconv.pc'

dev_vrs='1.16'

iconv_latest_vrs(){
	local out="$(curl https://ftp.gnu.org/gnu/libiconv/ 2>/dev/null)"
	echo "$out" | grep -oP 'libiconv-[0-9\.]+.tar.gz' | tail -n 1 | grep -oP '[0-9]+.[0-9]+'
}

. xbuild


start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ CLANG
# GNU  +   +   +   +  GCC
# WIN +++ +++  +   +  CLANG/GCC

# Filelist
# --------
# include/iconv.h
# include/libcharset.h
# include/localcharset.h
# lib/libcharset.so
# lib/pkgconfig/libiconv.pc
# lib/libiconv.so
# lib/libcharset.a
# lib/libcharset.la
# lib/libiconv.a
# lib/libiconv.la
# share/doc/libiconv/COPYING.LIB
# share/doc/libiconv/AUTHORS
# share/doc/libiconv/COPYING
# bin/iconv