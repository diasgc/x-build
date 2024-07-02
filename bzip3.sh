#!/bin/bash

lib='bzip3'
dsc='A better and stronger spiritual successor to BZip2.'
lic='GNU Lesser General Public License v3.0'
src="https://github.com/kspalaiologos/bzip3"

cfg='cmake'
cmake_bin='BZIP3_BUILD_APPS'

dev_bra='master'
dev_vrs='1.3.0'
pkg_deb='libbzip3-dev'
eta='48'

lst_inc='libbz3.h'
lst_lib='libbzip3'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc
