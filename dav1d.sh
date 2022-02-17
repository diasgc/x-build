#!/bin/bash

lib='dav1d'
apt='libdav1d-dev'
dsc='AV1 cross-platform decoder, open-source, and focused on speed and correctness.'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/dav1d.git'
cfg='meson'
tls='meson ninja'
eta='60'
build_strip=false

meson_bin='enable_tools'
meson_cfg="-Db_pie=true -Db_lto=true"

dev_bra='main'
dev_vrs='0.9.2'
stb_bra='tags/0.9.2'
stb_vrs='0.9.2'

lst_inc='dav1d/*.h'
lst_lib='libdav1d'
lst_bin='dav1d'
lst_lic='COPYING'
lst_pc='dav1d.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/dav1d/common.h
# include/dav1d/data.h
# include/dav1d/dav1d.h
# include/dav1d/picture.h
# include/dav1d/headers.h
# include/dav1d/version.h
# lib/pkgconfig/dav1d.pc
# lib/libdav1d.a
# lib/libdav1d.so
# share/doc/dav1d/COPYING
# bin/dav1d
