#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='zenity'
dsc='Zenity'
lic='LGPL2.1'
vrs=''
src="https://gitlab.gnome.org/GNOME/zenity"
cfg='meson'
eta='0'
#dep='gtk libadwaita'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

$host_cross && doErr "Unavailable"
dep='libadwaita-1-dev webkitgtk-6.0'

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start