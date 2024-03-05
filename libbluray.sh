#!/bin/bash

lib='libbluray'
dsc='Library to access Blu-Ray disks'
lic='LGPL-2.1'
src='https://code.videolan.org/videolan/libbluray.git'
sty='git'
cfg='ar'
dep='libxml2 freetype fontconfig libudfread liblzma'
pkg='libbluray'
eta='60'

ac_nosysroot=true
ac_config="--disable-bdjava-jar --disable-examples"

dev_bra='master'
dev_vrs='1.3.4'

lst_inc='libbluray/*.h'
lst_lib='libzstd'
lst_bin='zstdgrep zstd zstdless'
lst_lic='LICENSE COPYING'
lst_pc='libzstd.pc'

. xbuild


start

# cpu av8 av7 x86 x64 (static-shared-bin)
# NDK +++  .   .   .  clang
# GNU +..  .   .   .  gcc
# WIN +..  .   .   .  clang/gcc

# Filelist
# --------
#libbluray/filesystem.h 
#libbluray/bluray.h
#libbluray/bluray-version.h 
#libbluray/keys.h 
#libbluray/player_settings.h 
#libbluray/clpi_data.h 
#libbluray/meta_data.h 
#libbluray/overlay.h 
#libbluray/log_control.h