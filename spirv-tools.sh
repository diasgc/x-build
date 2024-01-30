#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='spirv-tools'
dsc='-'
lic='Apache-2.0'
vrs=''
src="https://github.com/KhronosGroup/SPIRV-Tools.git"
cfg='cmake'
eta='0'
dep='spirv-headers'

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

. xbuild

start