#!/bin/bash

lib='libunistring'
dsc='Unicode string library'
lic='GLP-3.0'
#src='https://git.savannah.gnu.org/git/libunistring.git'
url='https://ftp.gnu.org/gnu/libunistring'
cfg='ac'
eta='431'
dep='libiconv'
pc_llib='-lunistring'

lst_inc='unigbrk.h uniwidth.h uniwbrk.h unitypes.h unilbrk.h unistr.h unistdio.h uniname.h uninorm.h uniconv.h unicase.h unictype.h unistring/*.h'
lst_lib='libunistring'
lst_bin=''
lst_lic='COPYING COPYING.LIB AUTHORS'
lst_pc='libunistring'

on_config(){
    #vrs='latest'
    vrs="$(curl -s "${url}/" | grep -oP '(?<=libunistring-)([0-9\.]+)(?=.tar.gz)' | tail -n 1)"
    src="${url}/libunistring-${vrs}.tar.gz"
}

before_make(){
    #No docs
    sed -i 's/^SUBDIRS = doc /SUBDIRS = /g' Makefile
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
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
