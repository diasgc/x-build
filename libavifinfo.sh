#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libavifinfo'
dsc='Provides high level information about the AVIF container'
lic='GLP-2.0'
src='https://aomedia.googlesource.com/libavifinfo.git'
cfg='cmake'
eta='0'
cbk='AVIFINFO_BUILD_TOOLS'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh

start