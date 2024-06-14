#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# no make install
# todo: patch CMakeLists.txt to install headers, libs, binaries (+ option) and docs. Make pc file

lib='libxaac'
dsc='Extended HE-AAC, the latest innovation member of the MPEG AAC codec family'
lic='Apache-2.0'
src="https://android.googlesource.com/platform/external/libxaac.git"

cfg='cmake'
cmake_definitions+=('-Wno-unused-command-line-argument')

dev_bra='master'
dev_vrs=''
pkg_deb=''
eta='0'

lst_inc=''
lst_lib='libxaacenc libxaacdec'
lst_bin='xaacenc xaacdec xaac_dec_fuzzer xaac_enc_fuzzer'
lst_lic='LICENSE OWNERS NOTICE'
lst_pc=''

. xbuild && start