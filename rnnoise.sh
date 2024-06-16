#!/bin/bash

lib='rnnoise'
dsc='Recurrent neural network for audio noise reduction'
lic='BSD'
src='https://gitlab.xiph.org/xiph/rnnoise.git'

cfg='ag'
ac_bin="examples"
ac_config="--disable-doc"

dev_bra=''
dev_vrs=''
pkg_deb=''
eta='40'

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
