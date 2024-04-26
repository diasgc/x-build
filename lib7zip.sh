#!/bin/bash

lib='lib7zip'
dsc='c++ library wrapper of 7zip'
lic='MLP-2.0'
src='https://github.com/stonewell/lib7zip.git'

cfg='cmake'
cmake_config+='-DENABLE_TEST=OFF'

eta='1095'
dev_vrs='3.0.0'

. xbuild

source_config(){
    git submodule init && git submodule update
}

start

# cmake incomplete - no install

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
