#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared

lib='libcunit'
apt='libcunit1-dev'
dsc='C Unit Testing Framework'
lic='BSD'
src='https://svn.code.sf.net/p/cunit/code/trunk'
sty='svn'
cfg='ac'
pkg='cunit'
eta='27'

. xbuilder.sh

source_config(){
    libtoolize --force --copy
    aclocal
    autoheader
    automake --add-missing --include-deps --copy
    autoconf
}

start

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
# share/doc/cunit/headers/Win.h
# share/doc/cunit/headers/Console.h
# share/doc/cunit/headers/CUnit_intl.h
# share/doc/cunit/headers/TestDB.h
# share/doc/cunit/headers/CUError.h
# share/doc/cunit/headers/MyMem.h
# share/doc/cunit/headers/Util.h
# share/doc/cunit/headers/CUCurses.h
# share/doc/cunit/headers/CUnit.h
# share/doc/cunit/headers/TestRun.h
# share/doc/cunit/headers/Automated.h
# share/doc/cunit/headers/Basic.h
# share/doc/cunit/managing_tests.html
# share/doc/cunit/CUnit_doc.css
# share/doc/cunit/writing_tests.html
# share/doc/cunit/test_registry.html
# share/doc/cunit/running_tests.html
# share/doc/cunit/index.html
# share/doc/cunit/error_handling.html
# share/doc/cunit/introduction.html
# share/doc/cunit/fdl.html
# share/CUnit/Memory-Dump.dtd
# share/CUnit/Memory-Dump.xsl
# share/CUnit/CUnit-List.xsl
# share/CUnit/CUnit-Run.xsl
# share/CUnit/CUnit-List.dtd
# share/CUnit/CUnit-Run.dtd
