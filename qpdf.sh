#!/bin/bash

lib='qpdf'
dsc='Primary QPDF source code and documentation'
lic='Apache-2.0'
src='https://github.com/qpdf/qpdf.git'
cfg='cmake'
eta='480'
ac_nosysroot=true

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE.txt'
lst_pc=''

dev_bra='master'
dev_vrs=''

cmake_config='-Dfmt_lld_EXITCODE=0 -Dfmt_lld_EXITCODE__TRYRUN_OUTPUT=0' # -DUSE_INSECURE_RANDOM=1'

_build_prepare(){
    local f=${dir_build}/seed.rnd
    head -c 1024 </dev/urandom >$f
    $host_cross && ac_config+=" --with-random=${f}"
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  F  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# fail to install