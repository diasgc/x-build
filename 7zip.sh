#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='7zip'
dsc=''
lic=''
vrs='2107'
src="https://www.7-zip.org/a/7z${vrs}-src.tar.xz"
cfg='make'
eta='0'

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

. xbuilder.sh

source_config(){
    exit 0
}

start