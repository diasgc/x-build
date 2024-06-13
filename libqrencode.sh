#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libqrencode'
dsc='A fast and compact QR Code encoding library'
lic='GNU Lesser General Public License v2.1'
src="https://github.com/fukuchi/libqrencode.git"
dep='libpng'

cfg='cmake'

dev_bra='master'
dev_vrs='4.1.1'
pkg_deb='libqrencode-dev'
eta='20'

lst_inc='qrencode.h'
lst_lib='libqrencode'
lst_bin='qrencode'
lst_lic='LICENSE AUTHORS'
lst_pc='libqrencode.pc'

. xbuild && start