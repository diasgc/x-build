#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libcamera'
dsc='libcamera - Making complex cameras easy'
lic='Other'
vrs=''
src="https://git.libcamera.org/libcamera/libcamera.git"
cfg='meson'
tls='python3 python-jinja2 python3-ply'
eta='0'

dev_bra='master'
dev_vrs='0.2.0'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

start