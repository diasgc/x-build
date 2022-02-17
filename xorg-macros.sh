#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='xorg-macros'
dsc='GNU autoconf macros shared across X.Org projects'
lic='GLP-2.0'
src='https://gitlab.freedesktop.org/xorg/util/macros.git'
cfg='ag'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# share/pkgconfig/xorg-macros.pc
# share/util-macros/INSTALL
# share/aclocal/xorg-macros.m4
