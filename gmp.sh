#!/bin/bash

lib='gmp'
apt='libgmp-dev'
dsc='GNU Multiple Precision Arithmetic Library'
lic='LGPL-3.0 License'
src='https://gmplib.org/repo/gmp/'
sty='hg'
tls='mercurial'
cfg='ac'
eta='272'
mkc='distclean'

lst_inc='gmp.h'
lst_lib='libgmp'
lst_bin=''
lst_lic='COPYING.LESSERv3 COPYINGv2 COPYINGv3 AUTHORS'
lst_pc='gmp.pc'

. xbuilder.sh

ac_config="CC_FOR_BUILD=cc"
unset ABI
$host_mingw && CFG+=" --enable-fat"

source_config(){
  # from bootstrap:
  rm -rf autom4te.cache
  autoreconf -i -s >/dev/null 2>&1
  cat >doc/version.texi <<-EOF
  @set UPDATED 19 January 2038
  @set UPDATED-MONTH January 2038
  @set EDITION 12.35
  @set VERSION 12.35
	EOF
}

start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU ++   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/gmp.h
# lib/pkgconfig/gmp.pc
# lib/libgmp.la
# lib/libgmp.so
# lib/libgmp.a
# share/doc/gmp/COPYINGv2
# share/doc/gmp/AUTHORS
# share/doc/gmp/COPYING.LESSERv3
# share/doc/gmp/COPYINGv3
# share/info/gmp.info
# share/info/gmp.info-2
# share/info/gmp.info-1
# share/info/dir
