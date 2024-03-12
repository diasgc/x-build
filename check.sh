#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='check'
dsc='A unit testing framework for C'
lic='GNU Lesser General Public License v2.1'
vrs=''
src="https://github.com/libcheck/check.git"
cfg='cmake'
eta='0'

dev_bra='master'
dev_vrs='0.15.2'

lst_inc=''
lst_lib=''
lst_bin='checkmk'
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

#cmake_config='-DBUILD_TESTING=OFF -DCHECK_ENABLE_TESTS=OFF -DCHECK_ENABLE_TIMEOUT_TESTS=OFF -DENABLE_MEMORY_LEAKING_TESTS=OFF"

. xbuild

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start