#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='zix'
pkg='zix-0'
dsc='A lightweight C library of portability wrappers and data structures'
lic='ISC License'
vrs=''
src="https://github.com/drobilla/zix.git"
cfg='meson'
eta='0'

meson_cfg='-Dbenchmarks=disabled -Ddocs=disabled -Dhtml=disabled -Dtests=disabled -Dtests_cpp=disabled' 
dev_bra='master'
dev_vrs='0.4.3'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

. xbuild

#$host_ndk   && meson_cfg+=' -Dthreads=disabled' || meson_cfg+=' -Dthreads=enabled'
#$host_mingw && meson_cfg+=' -Dposix=disabled'   || meson_cfg+=' -Dposix=enabled'

start