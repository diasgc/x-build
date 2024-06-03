#!/bin/bash

# no install target rule

lib='libadrenotools'
dsc='A library for applying rootless Adreno GPU driver modifications/replacements'
lic='BSD-2c'
src='https://github.com/bylaws/libadrenotools.git'
cfg='cmake'
src_opt='--recursive'
#patch='libadrenotools-01'
eta='575'

cmake_static='BUILD_STATIC_LIBS'

lst_inc=''
lst_lib='libadrenotools'
lst_bin=''
lst_lic='LICENSE README.md'
lst_pc='adrenotools.pc'

dev_vrs=''
src_rel=false

on_create_pc(){
    build_pkgconfig --libs=-ladrenotools
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/adrenotools/bcenabler.h
# include/adrenotools/driver.h
# include/adrenotools/priv.h
# lib/libadrenotools.a
# lib/libadrenotools.so
# lib/pkgconfig/libadrenotools.pc
# share/doc/libadrenotools/LICENSE
# share/doc/libadrenotools/README.md
