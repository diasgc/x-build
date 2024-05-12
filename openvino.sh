#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='openvino'
dsc='OpenVINO™ is an open-source toolkit for optimizing and deploying AI inference'
lic='Apache License 2.0'
vrs=''
src="https://github.com/openvinotoolkit/openvino.git"
cfg='cmake'
eta='0'
sub='submodule update --init --recursive'

cmake_config='-DENABLE_TESTS=OFF -DENABLE_SAMPLES=OFF -DENABLE_TEMPLATE=OFF'

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

$host_ndk && {
    build_shared=true
    build_static=false
    cmake_config+=" -DANDROID=ON -DANDROID_STL=c++_shared -DENABLE_INTEL_CPU=OFF" #-DANDROID_PLATFORM=34 -DANDROID_ABI=arm64-v8a"
    LDFLAGS+=" -llog"
}

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start