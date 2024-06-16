#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='spirv-headers'
dsc='-'
lic='Apache-2.0'
src="https://github.com/KhronosGroup/SPIRV-Headers.git"

cfg='cmake'

on_config_ndk(){
    CXXFLAGS+=" -I${ANDROID_NDK_HOME}/sources/third_party/shaderc/third_party/spirv-tools/external/spirv-headers"
    end_script
}

dev_bra='master'
dev_vrs=''
pkg_deb='spirv-headers'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start