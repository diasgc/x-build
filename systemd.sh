#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='systemd'

dsc='The systemd System and Service Manager'
lic='GPL-2.0'
src='https://github.com/systemd/systemd.git'
#dep='crypt'

cfg='meson'

dev_bra=''
dev_vrs=''
pkg_deb='systemd-dev'
eta='60'

lst_inc=''
lst_lib=''

on_config(){
    meson_cfg="-Drootprefix=${dir_root}/builds"
}

. xbuild && start