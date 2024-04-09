#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='lilv'
dsc='LV2 host library'
lic='ISC License'
vrs=''
src="https://gitlab.com/lv2/lilv.git"
cfg='meson'
eta='0'

#meson_cfg='-Dbindings_py=disabled -Ddocs=disabled -Dhtml=disabled -Dsinglehtml=disabled -Dtests=disabled -Dtools=disabled'

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

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start