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

dev_bra='master'
dev_vrs=''
pkg_deb=''
eta=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

source_config(){
    exit 0
}

. xbuild && start