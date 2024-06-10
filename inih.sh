#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='inih'
dsc='Simple .INI file parser in C, good for embedded systems'
lic='Other'
vrs=''
src="https://github.com/benhoyt/inih.git"
cfg='meson'
eta='0'
pkg_deb="libinih-dev"


dev_bra='master'
dev_vrs='58'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'
pkg_deb="libinih-dev"


. xbuild && start