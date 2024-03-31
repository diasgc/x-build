#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='liblc3'
pkg='lc3'
dsc='LC3 and LC3 Plus are audio codecs designed for low-latency audio transport.'
lic='Apache License 2.0'
src="https://github.com/google/liblc3.git"
cfg='meson'
eta='0'

dev_bra='master'
dev_vrs='1.1.0'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start