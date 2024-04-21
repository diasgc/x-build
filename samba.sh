#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='samba'
dsc='Samba is the standard Windows interoperability suite of programs for Linux and Unix'
lic='GNU General Public License v3.0'
vrs='4.20.0'
#git="https://gitlab.com/samba-team/samba"
src="https://download.samba.org/pub/samba/stable/samba-${vrs}.tar.gz"
cfg='ac'
eta='0'

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