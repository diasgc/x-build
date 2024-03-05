#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libusb'
apt='libpscs-dev'
pkg='libusb-1.0'
dsc='A cross-platform library to access USB devices'
lic='LGPL-2.1'
src='https://github.com/libusb/libusb.git'
cfg='ac'
eta='10'
cfg_cmd='./bootstrap.sh'

lst_inc=''
lst_lib=''

. xbuild

$host_ndk && CFG+="--disable-udev"

start