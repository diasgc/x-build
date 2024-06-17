#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='gtk'
dsc='GTK is a multi-platform toolkit for creating graphical user interfaces'
lic='GLP-2.0'
src='https://gitlab.gnome.org/GNOME/gtk.git'
#dep='shared-mime-info'

cfg='meson'
meson_config='-Ddemos=false -Dbuild-examples=false -Dbuild-tests=false -Dx11-backend=false -Dwayland-backend=false'

API=28

dev_vrs=''
eta='0'
pkg_deb="libzbargtk-dev"

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start