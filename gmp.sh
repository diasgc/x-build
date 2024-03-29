#!/bin/bash

lib='gmp'
apt='libgmp-dev'
dsc='GNU Multiple Precision Arithmetic Library'
lic='LGPL-3.0 License'
url='https://gmplib.org/'
src='https://gmplib.org/repo/gmp/'
sty='hg'
tls='mercurial'
cfg='ac'
eta='272'
#mkc='distclean'

ac_config="CC_FOR_BUILD=cc"

dev_vrs='6.3.0'

lst_inc='gmp.h'
lst_lib='libgmp'
lst_bin=''
lst_lic='COPYING.LESSERv3 COPYINGv2 COPYINGv3 AUTHORS'
lst_pc='gmp.pc'

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

before_make(){
  for f in $(find . -name "Makefile"); do sed -i 's/-O2 -pedantic/-O3 -flto/g' $f; done
  build_strip=false
}

. xbuild

if $host_arm64 || $host_x64; then
  ABI=64
else
  ABI=32
fi

$host_mingw && ac_config+=" --enable-fat"

start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU ++   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


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


# Filelist
# --------
# lib/pkgconfig/gmp.pc
# lib/libgmp.la
# lib/libgmp.a
# lib/libgmp.so
# share/info/gmp.info
# share/info/dir
# share/info/gmp.info-1
# share/info/gmp.info-2
# share/doc/gmp/COPYINGv2
# share/doc/gmp/AUTHORS
# share/doc/gmp/COPYINGv3
# share/doc/gmp/COPYING.LESSERv3
# include/gmp.h
