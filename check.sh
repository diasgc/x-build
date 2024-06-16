#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='check'
dsc='A unit testing framework for C'
lic='GNU Lesser General Public License v2.1'
src="https://github.com/libcheck/check.git"

cfg='cmake'
#cmake_config='-DBUILD_TESTING=OFF -DCHECK_ENABLE_TESTS=OFF -DCHECK_ENABLE_TIMEOUT_TESTS=OFF -DENABLE_MEMORY_LEAKING_TESTS=OFF"

dev_bra='master'
dev_vrs='0.15.2'
pkg_deb=''
eta='20'

lst_inc=''
lst_lib=''
lst_bin='checkmk'
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start