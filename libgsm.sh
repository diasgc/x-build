#!/bin/bash

lib='libgsm'
apt='libgsm1-dev'
dsc='GSM 06.10 lossy speech compression'
lic='LGPL-2.1'
vrs='1.0.19'
src="http://www.quut.com/gsm/gsm-${vrs}.tar.gz"
cfg='cmake'
eta='60'
pc_llib="-lgsm"

cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_TOOLS'

dev_bra=''
dev_vrs='1.0.19'
stb_bra=''
stb_vrs=''

lst_inc='gsm.h'
lst_lib='libgsm'
lst_bin='toast untoast tcat'
lst_lic='COPYRIGHT'
lst_pc='libgsm.pc'

. xbuild

LD=${CC}

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/gsm.h
# lib/pkgconfig/libgsm.pc
# lib/libgsm.so
# lib/libgsm.a
# share/doc/libgsm/COPYRIGHT
# bin/toast
# bin/untoast
# bin/tcat
