#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='quirc'
dsc='QR decoder library'
lic='Other'
src="https://github.com/dlbeer/quirc.git"
cfg='cmake'
eta='0'
#dep='sdl2 opencv'

dev_bra='master'
dev_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild && start