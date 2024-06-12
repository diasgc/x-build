#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='postfish'
dsc='A digital audio post-processing, restoration, filtering and mixdown tool.'
lic='GPL-2'
src='https://gitlab.xiph.org/xiph/postfish.git'
cfg='cmake'
dep='libao fftw glib gtk'
pkg='postfish'

cmake_file='postfish'

dev_bra='master'
dev_vrs=''
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

_source_patch(){
  sed -i 's|gtk+-2.0 ao|gtk+-2.0 ao fftw|' Makefile
}

. xbuild && start