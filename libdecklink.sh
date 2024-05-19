#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libdecklink'
dsc=''
lic=''
vrs=''
src="https://gitlab.com/Polimi-dVRK/decklink/libdecklink.git"
src_opt='--recursive'
cfg='cmake'
eta='0'
dep='boost'

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

. xbuild && start