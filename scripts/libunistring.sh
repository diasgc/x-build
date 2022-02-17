#!/bin/bash

lib='libunistring'
dsc='Unicode string library'
lic='GLP-3.0'
vrs='1.0'
#src='https://git.savannah.gnu.org/git/libunistring.git'
src="https://ftp.gnu.org/gnu/libunistring/libunistring-${vrs}.tar.gz"
cfg='ac'
eta='431'
dep='libiconv'
pc_llib='-lunistring'

lst_inc='unigbrk.h uniwidth.h uniwbrk.h unitypes.h unilbrk.h unistr.h unistdio.h uniname.h uninorm.h uniconv.h unicase.h unictype.h unistring/*.h'
lst_lib='libunistring'
lst_bin=''
lst_lic='COPYING COPYING.LIB AUTHORS'
lst_pc='libunistring'

. xbuilder.sh

before_make(){
    #No docs
    sed -i 's/^SUBDIRS = doc /SUBDIRS = /g' Makefile
}

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/unigbrk.h
# include/uniwidth.h
# include/uniwbrk.h
# include/unitypes.h
# include/unistring/iconveh.h
# include/unistring/woe32dll.h
# include/unistring/stdbool.h
# include/unistring/version.h
# include/unistring/cdefs.h
# include/unistring/localcharset.h
# include/unistring/stdint.h
# include/unistring/inline.h
# include/unilbrk.h
# include/unistr.h
# include/unistdio.h
# include/uniname.h
# include/uninorm.h
# include/uniconv.h
# include/unicase.h
# include/unictype.h
# lib/libunistring.a
# lib/pkgconfig/libunistring.pc
# lib/libunistring.la
# lib/libunistring.so
# share/doc/libunistring/COPYING.LIB
# share/doc/libunistring/AUTHORS
# share/doc/libunistring/COPYING
