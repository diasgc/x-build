#!/bin/bash

lib='davs2'
dsc='An open-source decoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
src='https://github.com/pkuvcl/davs2.git'
cfg='ac'
eta='40'
ac_bin="--disable-cli| "
build_static=''
build_shared='--enable-shared'

dev_bra='main'
dev_vrs='1.7.1'

lst_inc='davs2.h davs2_config.h'
lst_lib='libdavs2'
lst_bin='davs2'
lst_lic='COPYING'
lst_pc='davs2.pc'

on_config(){
    dir_config="${dir_src}/build/linux"
    dir_build="${dir_src}/build/linux"
    mkf="STRIP="
}

on_config_ndk(){
    ac_config="--enable-lto --enable-pic --enable-strip"
    LDFLAGS="-llog"
}

. xbuildv && start

#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/davs2.h
# include/davs2_config.h
# lib/pkgconfig/davs2.pc
# lib/libdavs2.a
# lib/libdavs2.so.16
# share/doc/davs2/COPYING
# bin/davs2