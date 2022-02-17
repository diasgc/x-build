#!/bin/bash

lib='davs2'
dsc='An open-source decoder of AVS2-P2/IEEE1857.4 video coding standard'
lic='GPL-2.0'
src='https://github.com/pkuvcl/davs2.git'
cfg='ac'
eta='40'
config_dir="build/linux"
ac_bin="--disable-cli| "

dev_bra='main'
dev_vrs='1.6.205'
stb_bra='tags/1.6'
stb_vrs='1.6'

lst_inc='davs2.h davs2_config.h'
lst_lib='libdavs2'
lst_bin='davs2'
lst_lic='COPYING'
lst_pc='davs2.pc'

. xbuilder.sh

AS=nasm
$host_ndk && LDFLAGS+=" -L${SYSROOT}/usr/lib -llog"
$host_arm && ac_config+=" --disable-asm"

start

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