#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='lilv'
pkg='lilv-0'
dsc='LV2 host library'
lic='ISC License'
vrs=''
src="https://gitlab.com/lv2/lilv.git"
cfg='meson'
dep='libiconv zix'
eta='6'
patch_skip=true

meson_cfg='-Dbindings_py=disabled -Ddocs=disabled -Dhtml=disabled -Dsinglehtml=disabled -Dtests=disabled -Dtools=disabled'

dev_bra='master'
dev_vrs='0.24.25'

lst_inc='lilv/lilv.h lilv/lilvmm.hpp'
lst_lib='liblilv-0'
lst_bin=''
lst_lic=''
lst_pc='lilv-0.pc'

eta='20'

. xbuild

LDFLAGS+=" -liconv"

start