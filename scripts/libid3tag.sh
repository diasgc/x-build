#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libid3tag'
dsc='libid3tag is a library for reading and (eventually) writing ID3 tags'
lic='GLP-2.0'
src='https://github.com/markjeee/libid3tag.git'
cfg='ar'
eta='0'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING COPYRIGHT'
lst_pc=''

eta='20'    

. xbuilder.sh

start