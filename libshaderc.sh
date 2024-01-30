#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libshaderc'
dsc='A library for compiling shader strings into SPIR-V.'
lic='Apache-2.0'
vrs=''
src="https://github.com/google/shaderc.git"
cfg='cmake'
eta='0'
dep='spirv-tools'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic=''
lst_pc=''

eta='20'

. xbuild

cmake_config='-DSHADERC_SKIP_TESTS=ON -DSHADERC_SKIP_EXAMPLES=ON'

$host_ndk && bra='ndkr25'

start