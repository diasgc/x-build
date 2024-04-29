#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='uvg266'
dsc='An open-source VVC encoder based on Kvazaar'
lic='BSD 3-Clause New" or "Revised"'
vrs=''
src="https://github.com/ultravideo/uvg266.git"
cfg='cmake'
eta='0'
cmake_config='-DBUILD_TESTS=OFF'

dev_bra='master'
dev_vrs='0.8.0-63da667'
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