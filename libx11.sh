#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libx11'
dsc='Core X11 protocol client library'
lic='Other'
#vrs='1.7.3'
src='https://gitlab.freedesktop.org/xorg/lib/libx11.git'
#src="https://www.x.org/releases/individual/lib/libX11-${vrs}.tar.gz"
cfg='ac'
eta='0'
dep='xorg-macros libxtrans xorgproto'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh

start