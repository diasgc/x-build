#!/bin/bash


lib='openvino'
dsc='OpenVINO™ is an open-source toolkit for optimizing and deploying AI inference'
lic='Apache License 2.0'
src="https://github.com/openvinotoolkit/openvino.git"
sub='submodule update --init --recursive'

cfg='cmake'
cmake_config='-DENABLE_TESTS=OFF -DENABLE_SAMPLES=OFF -DENABLE_TEMPLATE=OFF'

on_config_ndk(){
    build_shared=true
    build_static=false
    cmake_config+=" -DANDROID=ON -DANDROID_STL=c++_shared -DENABLE_INTEL_CPU=OFF" #-DANDROID_PLATFORM=34 -DANDROID_ABI=arm64-v8a"
    LDFLAGS+=" -llog"
}

dev_bra='master'
dev_vrs=''
pkg_deb=''
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc