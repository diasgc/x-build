#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   F   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='postfish'
dsc='A digital audio post-processing, restoration, filtering and mixdown tool.'
lic='GPL-2'
src='https://gitlab.xiph.org/xiph/postfish.git'
cfg='cmake'
dep='libao fftw glib gtk'
pkg='postfish'
eta='60'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

_source_patch(){
  sed -i 's|gtk+-2.0 ao|gtk+-2.0 ao fftw|' Makefile
}

. xbuild && start