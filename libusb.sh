#!/bin/bash

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='libusb'
pkg='libusb-1.0'
dsc='A cross-platform library to access USB devices'
lic='LGPL-2.1'
src='https://github.com/libusb/libusb.git'

cfg='ac'
cfg_cmd='./bootstrap.sh'

on_config_ndk(){
    am_config+="--disable-udev"
}

dev_vrs='1.0.27'
pkg_deb='libusb-dev'
eta='256'

lst_inc='libusb/libusb.h'
lst_lib='libusb-1.0'

. xbuild && start