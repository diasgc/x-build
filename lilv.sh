#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='lilv'
pkg='lilv-0'
dsc='LV2 host library'
lic='ISC License'
src="https://gitlab.com/lv2/lilv.git"
patch="lilv-01"
dep='libiconv zix'

cfg='meson'
meson_cfg='-Dbindings_py=disabled -Ddocs=disabled -Dhtml=disabled -Dsinglehtml=disabled -Dtests=disabled -Dtools=disabled'
LDFLAGS+=" -liconv"

dev_bra='master'
dev_vrs='0.24.25'
pkg_deb='liblilv-dev'
eta='6'

lst_inc='lilv/lilv.h lilv/lilvmm.hpp'
lst_lib='liblilv-0'
lst_bin=''
lst_lic=''
lst_pc='lilv-0.pc'

. xbuild && start