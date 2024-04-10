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
#src='https://download.drobilla.net/lilv-0.24.24.tar.xz'
cfg='meson'
dep='libiconv'
eta='6'

meson_cfg='-Dbindings_py=disabled -Ddocs=disabled -Dhtml=disabled -Dsinglehtml=disabled -Dtests=disabled -Dtools=disabled'

dev_bra='master'
dev_vrs='0.24.25'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='lilv-0.pc sratom-0.pc sord-0.pc serd-0.pc zix-0.pc'

eta='20'

. xbuild

LDFLAGS+=" -liconv"

start