#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='simde'
dsc='Implementations of SIMD instruction sets for systems which dont natively support them.'
lic='MIT License'
src="https://github.com/simd-everywhere/simde.git"
cfg='meson'

meson_config='-Dtests=false'

dev_bra='master'
dev_vrs='0.8.2'
eta='80'
pkg_deb='libsimde-dev'

lst_inc='simde/*.h
 simde/x86/*.h
 simde/x86/avx512/*.h 
 simde/arm/*.h 
 simde/arm/neon/*.h 
 simde/wasm/*.h 
 simde/mips/*.h 
 simde/mips/msa/*.h'
lst_lib=''
lst_bin=''
lst_lic=''
lst_pc='simde.pc'

LDFLAGS+=" -lm"

. xbuild && start