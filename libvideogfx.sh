#!/bin/bash

lib='libvideogfx'
dsc='Rapid prototyping library for graphics and video processing.'
lic='LGPL-3.0'
src='https://github.com/farindk/libvideogfx.git'
eta='120'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc