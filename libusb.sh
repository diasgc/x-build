#!/bin/bash

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='libusb'
pkg_deb='libpscs-dev'
pkg='libusb-1.0'
dsc='A cross-platform library to access USB devices'
lic='LGPL-2.1'
src='https://github.com/libusb/libusb.git'
cfg='ac'
eta='10'
cfg_cmd='./bootstrap.sh'

lst_inc='libusb/libusb.h'
lst_lib='libusb-1.0'
dev_vrs='1.0.27'

on_config_ndk(){
    ac_config+="--disable-udev"
}

. xbuild && start