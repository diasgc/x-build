#!/bin/bash

lib='acr'
dsc='A fully compatible autoconf replacement'
lic='GPL-2.0'
src='https://github.com/radare/acr.git"'
cfg='ac'
mki='install'
mkf='all'

lst_inc=''
lst_lib=''
lst_bin='amr acr acr-install acr-sh acr-cat'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK ..+  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# bin/amr
# bin/acr
# bin/acr-install
# bin/acr-sh
# bin/acr-cat
