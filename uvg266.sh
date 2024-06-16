#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='uvg266'
dsc='An open-source VVC encoder based on Kvazaar'
lic='BSD 3-Clause New" or "Revised"'
src="https://github.com/ultravideo/uvg266.git"
src_rel=false

cfg='cmake'
cmake_config='-DBUILD_TESTS=OFF'
cmake_definitions=( -Wno-switch 
 -Wno-pointer-sign 
 -Wno-incompatible-pointer-types-discards-qualifiers 
 -Wno-return-type 
 -Wno-duplicate-decl-specifier 
 -Wno-tautological-constant-out-of-range-compare )

dev_bra='master'
dev_vrs='0.8.0-63da667'
pkg_deb=''
eta='128'

lst_inc='uvg266.h'
lst_lib='libuvg266'
lst_bin='uvg266'
lst_lic=''
lst_pc='uvg266.pc'

. xbuild && start