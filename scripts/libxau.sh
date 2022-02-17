#!/bin/bash

lib='libxau'
dsc='Functions for handling Xauthority files and entries.'
lic='Other'
src='https://gitlab.freedesktop.org/xorg/lib/libxau.git'
cfg='ag'
eta='0'
dep='xorgproto'
pkg='xau'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='X11/Xauth.h'
lst_lib='libXau'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='xau.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/X11/Xauth.h
# lib/pkgconfig/xau.pc
# lib/libXau.so
# lib/libXau.la
# lib/libXau.a
# share/man/man3/XauWriteAuth.3
# share/man/man3/XauLockAuth.3
# share/man/man3/XauUnlockAuth.3
# share/man/man3/XauReadAuth.3
# share/man/man3/Xau.3
# share/man/man3/XauGetBestAuthByAddr.3
# share/man/man3/XauGetAuthByAddr.3
# share/man/man3/XauDisposeAuth.3
# share/man/man3/XauFileName.3
# share/doc/libxau/AUTHORS
# share/doc/libxau/COPYING
