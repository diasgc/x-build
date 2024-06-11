#!/bin/bash

lib='xavs'
dsc='High quality encoder and decoder of the Audio Video Standard of China (AVS)'
lic='GPL-2.0'
src='https://svn.code.sf.net/p/xavs/code/trunk'
cfg="ac"

dev_vrs='0.1.55'
pkg_deb=''
eta='30'

lst_inc='xavs.h'
lst_lib='libxavs'
lst_bin='xavs'
lst_lic=''
lst_pc='xavs.pc'

ac_opts='--update-config_sub --update-config_guess --no-sysroot --no-pic'
ac_config="--disable-asm --enable-pic"

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/xavs.h
# lib/pkgconfig/xavs.pc
# lib/libxavs.a
# lib/libxavs.so.1
# bin/xavs
