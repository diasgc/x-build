#!/bin/bash

lib='libcunit'
apt='libcunit1-dev'
dsc='C Unit Testing Framework'
lic='BSD'
src='https://svn.code.sf.net/p/cunit/code/trunk'
sty='svn'
cfg='ac'
pkg='cunit'
eta='27'

dev_bra='main'
dev_vrs='2.1-3'
stb_bra=''
stb_vrs=''

lst_inc='CUnit/*.h'
lst_lib=''
lst_bin=''
lst_lic='AUTHORS COPYING'
lst_pc='cunit.pc'

source_config(){
    libtoolize --force --copy
    aclocal
    autoheader
    automake --add-missing --include-deps --copy
    autoconf
}

on_editpack(){
    # remove documents from tarball
    rm -rf share/doc/cunit share/CUnit
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  F   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/CUnit/Console.h
# include/CUnit/CUnit_intl.h
# include/CUnit/TestDB.h
# include/CUnit/CUError.h
# include/CUnit/MyMem.h
# include/CUnit/Util.h
# include/CUnit/CUnit.h
# include/CUnit/TestRun.h
# include/CUnit/Automated.h
# include/CUnit/Basic.h
# lib/libcunit.la
# lib/pkgconfig/cunit.pc
# lib/libcunit.so
# lib/libcunit.a
# share/man/man3/CUnit.3
# share/doc/libcunit/AUTHORS
# share/doc/libcunit/COPYING
