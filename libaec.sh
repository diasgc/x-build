#!/bin/bash

lib='libaec'
pkg='aec'
pkg_deb='libaec-dev'
dsc='Adaptive Entropy Coding library'
lic='BSD-s2c'
src='https://gitlab.dkrz.de/k202009/libaec.git'
cfg='cmake'
eta='30'
pc_llibs='-lsz -laec'

lst_inc='libaec.h szlib.h'
lst_lib='libsz libaec'
lst_bin='aec'
lst_lic='LICENSE.txt AUTHORS'
lst_pc='aec.pc sz.pc'

dev_bra='master'
dev_vrs='1.0.6'
stb_bra=''
stb_vrs=''

CFG="-DBUILD_TESTING=OFF"

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/libaec.h
# include/szlib.h
# cmake/libaec-config-version.cmake
# cmake/libaec-config.cmake
# lib/pkgconfig/sz.pc
# lib/pkgconfig/aec.pc
# lib/libsz.a
# lib/libaec.so
# lib/libsz.so
# lib/libaec.a
# share/man/man1/aec.1
# share/doc/libaec/AUTHORS
# share/doc/libaec/LICENSE.txt
# bin/aec
