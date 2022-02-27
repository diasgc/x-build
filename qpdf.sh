#!/bin/bash

lib='qpdf'
dsc='Primary QPDF source code and documentation'
lic='Apache-2.0'
src='https://github.com/qpdf/qpdf.git'
cfg='ag'
eta='480'
ac_nosysroot=true

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE.txt'
lst_pc=''

dev_bra='master'
dev_vrs=''

build_prepare(){
    local f=${dir_build}/seed.rnd
    head -c 1024 </dev/urandom >$f
    $host_cross && ac_config+=" --with-random=${f}"
}

. xbuild

start

# cpu av8 av7 x86 x64
# NDK  F  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# fail to install