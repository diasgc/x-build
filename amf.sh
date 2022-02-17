#!/bin/bash

lib='amf'
dsc='The Advanced Media Framework (AMF) SDK'
lic='MIT'
src='https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git'
sty='git'
cfg='cmake'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_pc=''
lst_lic='LICENSE.txt'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

