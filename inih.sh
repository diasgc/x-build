#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='inih'
dsc='Simple .INI file parser in C, good for embedded systems'
lic='Other'
src="https://github.com/benhoyt/inih.git"

cfg='meson'

dev_bra='master'
dev_vrs='58'
eta='20'
pkg_deb="libinih-dev"

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start