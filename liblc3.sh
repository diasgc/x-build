#!/bin/bash

lib='liblc3'
pkg='lc3'
dsc='LC3 and LC3 Plus are audio codecs designed for low-latency audio transport.'
lic='Apache License 2.0'
src="https://github.com/google/liblc3.git"

cfg='meson'

dev_bra='master'
dev_vrs='1.1.0'
pkg_deb='liblc3-dev'
eta='2'

lst_inc='lc3_private.h lc3.h lc3_cpp.h'
lst_lib='liblc3'
lst_bin=''
lst_lic=''
lst_pc='lc3.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  +   .   .   .  clang/gcc
# WIN  +   .   .   .  clang/gcc
