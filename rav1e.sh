#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='rav1e'
dsc='The fastest and safest AV1 encoder. '
lic='BSD-2c'
vrs=''
src="https://github.com/xiph/rav1e.git"
cfg='cargo'
eta='0'

dev_bra='master'
dev_vrs='0.7.1'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

build_all(){
    pushd ${dir_src}
    cargo cinstall --release --prefix ${dir_install}/rav1e --target ${arch}
    popd
}

. xbuild && start