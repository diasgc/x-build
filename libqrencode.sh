#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libqrencode'
dsc='A fast and compact QR Code encoding library'
lic='GNU Lesser General Public License v2.1'
vrs=''
src="https://github.com/fukuchi/libqrencode.git"
cfg='cmake'
dep='libpng'

dev_bra='master'
dev_vrs='4.1.1'

lst_inc='qrencode.h'
lst_lib='libqrencode'
lst_bin='qrencode'
lst_lic='LICENSE AUTHORS'
lst_pc='libqrencode.pc'

eta='20'

. xbuild && start