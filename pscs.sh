#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='pscs'
apt='libpscs-dev'
dsc='Middleware to access a smart card using SCard API (PC/SC)'
lic='BSD-3c'
src='https://salsa.debian.org/rousseau/PCSC.git'
cfg='ac'
eta='10'
dep='libusb'
mki='install-strip'
mkc='distclean'

lst_inc=''
lst_lib=''

. xbuild

CFG="--disable-libsystemd --disable-libudev"

source_config(){
    ./bootstrap
    autoreconf -i
}

start