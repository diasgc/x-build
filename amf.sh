#!/bin/bash

lib='amf'
dsc='The Advanced Media Framework (AMF) SDK'
lic='MIT'
src='https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git'
cfg='cmake'
tls='texinfo'

lst_inc=''
lst_lib=''
lst_bin=''
lst_pc=''
lst_lic='LICENSE.txt'
dev_vrs='1.4.23'

on_config(){
    vrs="$(c_printf 'amf/public/include/core' 'Version.h' \
        '"%d.%d.%d",AMF_VERSION_MAJOR,AMF_VERSION_MINOR,AMF_VERSION_RELEASE')"
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

