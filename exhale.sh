#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .   .  gcc
# WIN +++ +++  .  +++ clang/gcc

lib='exhale'
dsc='an open-source ISO/IEC 23003-3 (USAC, xHE-AAC) encoder'
lic='BSD-3'
src='https://gitlab.com/ecodis/exhale.git'
cfg='cmake'
eta='8'

dev_bra='master'
dev_vrs='v1.2.1'
pkg_deb=''
     
lst_inc='exhaleDecl.h'
lst_lib='libexhale'
lst_bin='exhale'
lst_lic='README.md'
lst_pc='exhale.pc'

cmake_config="-DBUILD_TESTS=OFF -DCMAKE_DL_LIBS=ON"

. xbuild && start

on_create_pc(){
    build_pkgconfig --lib=-lexhale
}

# Filelist
# --------
# lib/pkgconfig/exhale.pc
# lib/libexhale.so
# lib/libexhale.a
# bin/exhale
