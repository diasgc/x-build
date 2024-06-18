#!/bin/bash

lib='xcb'
pkg='libxcb'
dsc='C interface to the X Window System protocol'
lic='Other'
src='https://gitlab.freedesktop.org/xorg/lib/libxcb.git'
url="https://xcb.freedesktop.org/"
dep='xcb-proto xorg-macros check'

cfg='ac'

dev_bra='master'
dev_vrs='1.17.0'
pkg_deb='libxcb1-dev'
eta='0'

on_src_release(){
    vrs="$(tar_version https://xcb.freedesktop.org/dist/ libxcb-)"
    src="https://xcb.freedesktop.org/dist/libxcb-${vrs}.tar.gz"
    tar_stripcomponents=true
}

on_config(){
    ${src_rel} && on_src_release
}

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc
