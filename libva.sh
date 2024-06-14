#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libva'
dsc='Libva is an implementation for VA-API (Video Acceleration API)'
lic='Other'
src="https://github.com/intel/libva.git"

cfg='ag' # meson buildsystem only compiles shared libs

dev_bra='master'
dev_vrs='1.22.0'
pkg_deb='libva-dev'
eta='20'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start