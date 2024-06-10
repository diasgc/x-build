#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='pscs'
pkg='libpcsclite'
pkg_deb='libpscs-dev'
dsc='Middleware to access a smart card using SCard API (PC/SC)'
lic='BSD-3c'
src='https://salsa.debian.org/rousseau/PCSC.git'
cfg='meson'
eta='10'
tls='flex'

lst_inc=''
lst_lib=''

ac_config="--disable-libsystemd --disable-libudev"
meson_cfg="-Dlibsystemd=false -Dlibudev=false -Dlibusb=false -Dpolkit=false -Dusb=false -Dserial=false"

source_config(){
    ./bootstrap
    autoreconf -i
}

. xbuild && start