#!/bin/bash

lib='amf'
dsc='The Advanced Media Framework (AMF) SDK'
lic='MIT'
src='https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git'
cfg='cmake'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_pc=''
lst_lic='LICENSE.txt'
dev_vrs='1.4.23'

. xbuild

vrs="$(c_printf 'amf/public/include/core' 'Version.h' \
    '"%d.%d.%d",AMF_VERSION_MAJOR,AMF_VERSION_MINOR,AMF_VERSION_RELEASE')"

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

