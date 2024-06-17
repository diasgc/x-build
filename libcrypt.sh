#!/bin/bash

lib='libcrypt'
dsc='The GNU crypto library'
lic='GLP-2.0'
src='https://github.com/gpg/libgcrypt.git'
dep='libgpg-error'

dev_bra='master'
dev_vrs=''
pkg_deb='libcrypt-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

on_config(){
    am_config="--with-libgpg-error-prefix=${dir_install} --with-capabilities --disable-doc"
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc