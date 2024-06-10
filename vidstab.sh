#!/bin/bash

#vrs='1.20'
lib='vidstab'
pkg_deb='libvidstab-dev'
dsc='Vidstab is a video stabilization library which can be plugged-in with Ffmpeg and Transcode'
lic='GPL-2+'
src='https://github.com/georgmartius/vid.stab.git'
cfg='cmake'
patch="vidstab-01"
eta='80'

lst_inc='vid.stab/*.h'
lst_lib='libvidstab'
lst_bin=''
lst_lic='LICENSE'
lst_pc='vidstab.pc'

dev_bra='main'
dev_vrs='1.20'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  +   .   .   .  gcc
# WIN  +   .   .   .  clang/gcc

# Filelist
# --------
# include/vid.stab/vidstabdefines.h
# include/vid.stab/motiondetect_opt.h
# include/vid.stab/transformtype.h
# include/vid.stab/libvidstab.h
# include/vid.stab/vsvector.h
# include/vid.stab/motiondetect.h
# include/vid.stab/transform_internal.h
# include/vid.stab/transform.h
# include/vid.stab/transformtype_operations.h
# include/vid.stab/frameinfo.h
# include/vid.stab/motiondetect_internal.h
# include/vid.stab/serialize.h
# include/vid.stab/transformfixedpoint.h
# include/vid.stab/transformfloat.h
# include/vid.stab/localmotion2transform.h
# include/vid.stab/boxblur.h
# lib/pkgconfig/vidstab.pc
# lib/libvidstab.a
# lib/libvidstab.so
# share/doc/vidstab/LICENSE
