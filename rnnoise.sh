#!/bin/bash

lib='rnnoise'
dsc='Recurrent neural network for audio noise reduction'
lic='BSD'
src='https://gitlab.xiph.org/xiph/rnnoise.git'
cfg='ag'
eta='40'

ac_bin="--disable-examples|--enable-examples"
ac_config="--disable-doc"

lst_inc='rnnoise.h'
lst_lib='librnnoise'
lst_bin=''
lst_lic='AUTHORS COPYING'
lst_pc='rnnoise.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .   clang
# GNU  .   .   .   .   gcc
# WIN  .   .   .   .   clang/gcc

# Filelist
# --------
# include/rnnoise.h
# lib/pkgconfig/rnnoise.pc
# lib/librnnoise.a
# lib/librnnoise.la
# lib/librnnoise.so
# share/doc/rnnoise/AUTHORS
# share/doc/rnnoise/COPYING
# share/doc/rnnoise/README
