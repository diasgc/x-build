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

cmake_static='SPIRV_TOOLS_BUILD_STATIC'

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

#if [ $host_ndk ]; then
#    CXXFLAGS+=" -I${ANDROID_NDK_HOME}/sources/third_party/shaderc/third_party/spirv-tools/include"
#else
#    start
#fi

start