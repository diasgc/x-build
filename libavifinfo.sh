#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

# install: no rule to make target install

lib='libavifinfo'
dsc='Provides high level information about the AVIF container'
lic='GLP-2.0'
src='https://aomedia.googlesource.com/libavifinfo.git'
cfg='cmake'
eta='0'
cmake_bin='AVIFINFO_BUILD_TOOLS'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib='libavifinfo'
lst_bin='avifinfo'
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start