#!/bin/bash

lib='libmysofa'
apt="${lib}-dev"
dsc='Reader for AES SOFA files to get better HRTFs'
lic='BSD'
src='https://github.com/hoene/libmysofa.git'
cfg='cmake'
dep='libcunit zlib'
pkg='libmysofa'
eta='60'

cmake_static='BUILD_STATIC_LIBS'

dev_bra='master'
dev_vrs=''
stb_bra='tags/v1.2.1'
stb_vrs='v1.2.1'

lst_inc='mysofa.h'
lst_lib='libmysofa'
lst_bin=''
lst_lic='LICENSE'
lst_pc='libmysofa.pc'

. xbuilder.sh

# CMAKE OPTIONS (default): -DADDRESS_SANITIZE=OFF -DCODE_COVERAGE=OFF 

cmake_config="-DBUILD_TESTS=OFF"

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/mysofa.h
# lib/pkgconfig/libmysofa.pc
# lib/libmysofa.so
# lib/libmysofa.a
# share/libmysofa/MIT_KEMAR_normal_pinna.sofa
# share/doc/libmysofa/LICENSE
