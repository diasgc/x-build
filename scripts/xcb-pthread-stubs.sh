#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='xcb-pthread-stubs'
pkg='pthread-stubs'
dsc='Library that provides pthread stubs that are missing from your platform libc.'
lic='Other'
src='https://github.com/freedesktop/xcb-pthread-stubs.git'
cfg='ag'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# lib/pkgconfig/pthread-stubs.pc
