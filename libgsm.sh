#!/bin/bash

lib='libgsm'
apt='libgsm1-dev'
dsc='GSM 06.10 lossy speech compression'
lic='LGPL-2.1'
url='http://www.quut.com/gsm'
cfg='cmake'
patch="libgsm-01"
eta='60'
pc_llib="-lgsm"

cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_TOOLS'

dev_bra='master'
dev_vrs='1.0.22'

lst_inc='gsm.h'
lst_lib='libgsm'
lst_bin='toast untoast tcat'
lst_lic='COPYRIGHT'
lst_pc='libgsm.pc'

on_config(){
    vrs="$(curl -sL ${url} | grep -oP 'gsm-[0-9\.]+.tar.gz' | tail -n1)"
    src="${url}/${vrs}"
    vrs="$(sed 's/gsm-//;s/.tar.gz//' <<<"${vrs}")"
    LD=${CC}
}

. xbuild && start

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
