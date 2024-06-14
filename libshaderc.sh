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

dep='spirv-tools'

cfg='cmake'
cmake_config='-DSHADERC_SKIP_TESTS=ON -DSHADERC_SKIP_EXAMPLES=ON'

dev_bra='master'
dev_vrs=''
pkg_deb='libshaderc-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic=''
lst_pc=''

on_config_ndk(){
    CXXFLAGS+=" -I${ANDROID_NDK_HOME}/sources/third_party/shaderc/libshaderc/include"
    end_script
}

. xbuild && start
