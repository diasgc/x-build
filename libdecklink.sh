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

dep='boost'

dev_bra='master'
dev_vrs=''
pkg_deb=''
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild && start