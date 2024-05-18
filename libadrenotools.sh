#!/bin/bash

# no install target rule

lib='libadrenotools'
dsc='A library for applying rootless Adreno GPU driver modifications/replacements'
lic='BSD-2c'
src='https://github.com/bylaws/libadrenotools.git'
src_opt='--recursive'
cfg='cmake'
eta='575'

cmake_static='BUILD_STATIC_LIBS'
pc_llib='-ladrenotools'

lst_inc=''
lst_lib='libadrenotools'
lst_bin=''
lst_lic='LICENSE README.md'
lst_pc='adrenotools.pc'

dev_vrs=''

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
