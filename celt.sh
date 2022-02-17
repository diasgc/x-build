#!/bin/bash

lib='celt'
dsc='CELT is a low-delay audio codec'
lic='BSD-2c'
src='https://gitlab.xiph.org/xiph/celt.git'
cfg='ag'
dep='ogg'
eta='60'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''
     
lst_inc='celt/*.h'
lst_lib='libcelt0'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='celt.pc'

ac_config="--enable-experimental-postfilter \
     --enable-float-approx \
     --enable-fixed-point \
     --enable-custom-modes"


. xbuilder.sh

source_patch(){
  sed -i 's|XIPH_PATH_OGG|#XIPH_PATH_OGG|g' configure
}

start

# cpu av8 av7 x86 x64
# NDK ++  ++  ++  ++  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/celt/celt_header.h
# include/celt/celt_types.h
# include/celt/celt.h
# lib/pkgconfig/celt.pc
# lib/libcelt0.so
# lib/libcelt0.a
# lib/libcelt0.la
