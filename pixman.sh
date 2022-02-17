#!/bin/bash

lib='pixman'
apt='libpixman-1-dev'
pkg='pixman-1'
dsc='Pixel-manipulation library for X and cairo'
lic='GPL-2.0'
src='https://github.com/freedesktop/pixman.git'
cfg='ag'
dep='libpng'
eta='275'
mki='install'

. xbuilder.sh

dev_bra='master'
dev_vrs=''
stb_bra='tags/pixman-0.40.0'
stb_vrs='0.40.0'

lst_inc='pixman-1/*.h'
lst_lib='libpixman-1'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='pixman-1.pc'

$host_arm64 && CFG='--disable-arm-a64-neon'
$host_arm32 && CFG='--disable-arm-neon --disable-arm-simd'

before_make(){
    sed -i 's/-g -O2/-O3 -flto/g;s/-Wall -W/-W/g' Makefile pixman/Makefile
}

start

<<'XB64_PATCH'
LS0tIHBpeG1hbi9waXhtYW4tYXJtLmNvCTIwMjItMDEtMDUgMTI6MDE6NDMuNDczMDAwMDAwICsw
MDAwCisrKyBwaXhtYW4vcGl4bWFuLWFybS5jCTIwMjItMDEtMDUgMTI6MDg6MTcuMzUwMzMxNDAw
ICswMDAwCkBAIC05NiwyOSArOTYsMTEgQEAKIAogI2VsaWYgZGVmaW5lZChfX0FORFJPSURfXykg
fHwgZGVmaW5lZChBTkRST0lEKSAvKiBBbmRyb2lkICovCiAKLSNpbmNsdWRlIDxjcHUtZmVhdHVy
ZXMuaD4KIAogc3RhdGljIGFybV9jcHVfZmVhdHVyZXNfdAogZGV0ZWN0X2NwdV9mZWF0dXJlcyAo
dm9pZCkKIHsKLSAgICBhcm1fY3B1X2ZlYXR1cmVzX3QgZmVhdHVyZXMgPSAwOwotICAgIEFuZHJv
aWRDcHVGYW1pbHkgY3B1X2ZhbWlseTsKLSAgICB1aW50NjRfdCBjcHVfZmVhdHVyZXM7Ci0KLSAg
ICBjcHVfZmFtaWx5ID0gYW5kcm9pZF9nZXRDcHVGYW1pbHkoKTsKLSAgICBjcHVfZmVhdHVyZXMg
PSBhbmRyb2lkX2dldENwdUZlYXR1cmVzKCk7Ci0KLSAgICBpZiAoY3B1X2ZhbWlseSA9PSBBTkRS
T0lEX0NQVV9GQU1JTFlfQVJNKQotICAgIHsKLQlpZiAoY3B1X2ZlYXR1cmVzICYgQU5EUk9JRF9D
UFVfQVJNX0ZFQVRVUkVfQVJNdjcpCi0JICAgIGZlYXR1cmVzIHw9IEFSTV9WNzsKLQotCWlmIChj
cHVfZmVhdHVyZXMgJiBBTkRST0lEX0NQVV9BUk1fRkVBVFVSRV9WRlB2MykKLQkgICAgZmVhdHVy
ZXMgfD0gQVJNX1ZGUDsKLQotCWlmIChjcHVfZmVhdHVyZXMgJiBBTkRST0lEX0NQVV9BUk1fRkVB
VFVSRV9ORU9OKQotCSAgICBmZWF0dXJlcyB8PSBBUk1fTkVPTjsKLSAgICB9CisgICAgYXJtX2Nw
dV9mZWF0dXJlc190IGZlYXR1cmVzID0gKEFSTV9WNyB8IEFSTV9WRlAgfCBBUk1fTkVPTik7CiAK
ICAgICByZXR1cm4gZmVhdHVyZXM7CiB9Cg==
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/pixman-1/pixman-version.h
# include/pixman-1/pixman.h
# lib/pkgconfig/pixman-1.pc
# lib/libpixman-1.a
# lib/libpixman-1.la
# lib/libpixman-1.so
# share/doc/pixman/AUTHORS
# share/doc/pixman/COPYING
