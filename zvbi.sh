#!/bin/bash

lib='zvbi'
pkg='zvbi-0.2'
apt='libzvbi-dev'
apt="${pkg}-dev"
dsc='VBI Capturing and Decoding Library'
lic='BSD 2-clause'
#src='https://github.com/OpenDMM/zvbi.git'
src='https://github.com/zapping-vbi/zvbi.git'
dep='libiconv'
cfg='ag'
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_vrs=''

. xbuild

ac_config="--disable-dependency-tracking --disable-silent-rules --without-x"

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
