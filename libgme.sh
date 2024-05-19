#!/bin/bash

lib='libgme'
apt='libgme-dev'
dsc='Blarggs video game music emulation library'
lic='LGPL-2.1'
src='https://bitbucket.org/mpyne/game-music-emu.git'
cfg='cmake'
eta='60'
cmake_config='-DBUILD_TESTING=OFF -DBLARGG_BUILD_DLL=0'

lst_inc='gme/*.h'
lst_lib='libgme'
lst_bin=''
lst_lic='license.txt license.gpl2.txt'
lst_pc='libgme.pc'

dev_bra='master'
dev_vrs='0.6.4'
stb_bra=''
stb_vrs=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/gme/gme.h
# include/gme/blargg_source.h
# lib/pkgconfig/libgme.pc
# lib/libgme.a
# lib/libgme.so
# share/doc/libgme/license.txt
# share/doc/libgme/license.gpl2.txt
