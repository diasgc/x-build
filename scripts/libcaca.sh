#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .   clang
# GNU  F   .   .   F   gcc
# WIN  .   .   .   F   clang/gcc

lib='libcaca'
dsc='Colour AsCii Art library'
lic='GPL'
src='https://github.com/cacalabs/libcaca.git'
cfg='ac'
pkg='caca'
eta='80'

dev_bra='main'
dev_vrs=''
stb_bra='tags/v0.99.beta20'
stb_vrs='v0.99.beta20'

lst_inc='caca++.h caca.h caca0.h caca_types.h caca_conio.h'
lst_lib='libcaca libcaca++'
lst_bin='caca-config cacafire cacaserver img2txt cacaclock cacademo cacaview cacaplay'
lst_lic='COPYING COPYING.GPL COPYING.LGPL COPYING.ISC AUTHORS'
lst_pc='caca++.pc caca.pc'

. xbuilder.sh

CFG="--disable-doc --disable-imlib2 --disable-java --disable-win32 --disable-cppunit --disable-zzuf --disable-conio"

source_config(){
  sed -i 's/^AC_PREREQ/# &/' configure.ac
  ./bootstrap
  sed -i 's/if defined _WIN32/if defined _MSC_VER/g' caca/caca.h \
    caca/caca0.h caca/caca0.h caca/figfont.c \
    caca/string.c
  sed -i 's/if defined(_WIN32)/if defined(_MSC_VER)/g' cxx/caca++.h
  sed -i 's/-O2 -fno-strength-reduce/-O3 -flto/g' configure
}

WFLAGS="-Wno-ignored-optimization-argument -Wno-absolute-value -Wno-unused-but-set-variable"

start

# patch 01 caca/driver/win32.c to support llvm-mingw toolchain
<<'XB64_PATCH'
LS0tIGNhY2EvZHJpdmVyL3dpbjMyLmMJMjAyMS0xMC0yOCAyMTozNTo0NC41MDgwMDAwMDAgKzAx
MDAKKysrIGNhY2EvZHJpdmVyL3dpbjMyLmMJMjAyMS0xMC0yOCAyMTozNTo0Ny4xMTUwMDAwMDAg
KzAxMDAKQEAgLTIzLDcgKzIzLDcgQEAKICNkZWZpbmUgV0lOMzJfTEVBTl9BTkRfTUVBTgogI2lu
Y2x1ZGUgPHdpbmRvd3MuaD4KIAotI2lmZGVmIF9fTUlOR1czMl9fCisjaWYgZGVmaW5lZChfX01J
TkdXMzJfXykgJiYgIWRlZmluZWQoX19jbGFuZ19fKQogLyogVGhpcyBpcyBtaXNzaW5nIGZyb20g
dGhlIE1pbkdXIGhlYWRlcnMuICovCiAjICAgaWYgKF9XSU4zMl9XSU5OVCA+PSAweDA1MDApCiBC
T09MIFdJTkFQSSBHZXRDdXJyZW50Q29uc29sZUZvbnQoSEFORExFIGhDb25zb2xlT3V0cHV0LCBC
T09MIGJNYXhpbXVtV2luZG93LApAQCAtMzMsNyArMzMsNiBAQAogI2lmbmRlZiBNT1VTRV9IV0hF
RUxFRAogIyAgIGRlZmluZSBNT1VTRV9IV0hFRUxFRCAweDAwMDgKICNlbmRpZgotCiAjaW5jbHVk
ZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8c3RkaW8uaD4K
XB64_PATCH

# Filelist
# --------
# include/caca++.h
# include/caca.h
# include/caca0.h
# include/caca_types.h
# include/caca_conio.h
# lib/pkgconfig/caca++.pc
# lib/pkgconfig/caca.pc
# lib/libcaca.so
# lib/libcaca++.so
# lib/libcaca++.la
# lib/libcaca.a
# lib/libcaca.la
# lib/libcaca++.a
# share/man/man1/img2txt.1
# share/man/man1/cacaserver.1
# share/man/man1/cacaview.1
# share/man/man1/cacafire.1
# share/man/man1/caca-config.1
# share/man/man1/cacaplay.1
# share/libcaca/caca.txt
# bin/caca-config
# bin/cacafire
# bin/cacaserver
# bin/img2txt
# bin/cacaclock
# bin/cacademo
# bin/cacaview
# bin/cacaplay
