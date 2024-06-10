#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='jpegoptim'
pkg_deb='jpegoptim'
dsc='Utility to optimize/compress JPEG files'
lic='GPL-2'
src='https://github.com/tjko/jpegoptim.git'
cfg='cmake'
dep='libjpeg'
eta='60'

on_config(){
    # cannot cross-compile mozjpeg
    $host_cross && cmake_config+=' -DUSE_MOZJPEG=OFF'
    return 0
}

. xbuild && start

# Filelist
# --------

# share/man/man1/jpegoptim.1
# bin/jpegoptim
