#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='aom-rav1e'
dsc='aom tree used in rav1e submodule'
lic='BSD-2c'
vrs=''
src="https://gitlab.xiph.org/xiph/aom-rav1e.git"
cfg='cmake'
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

WFLAGS+="-Wno-dev"

. xbuild && start