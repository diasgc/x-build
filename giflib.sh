#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++ +++  .   .  gcc
# WIN +++ +++  .   .  clang/gcc

lib='giflib'
pkg_deb='libgif-dev'
dsc='Library for manipulating GIF files'
lic='other'
git='https://git.code.sf.net/p/giflib/code'
cfg='cmake'

cmake_bin='BUILD_UTILITIES'
cmake_static='BUILD_STATIC_LIBS'
cmake_file='giflib'

lst_inc='gif_lib.h'
lst_lib='libgiflib'
lst_bin='giftext gifsponge giffilter giffix gifecho gifbg gifhisto gifwedge giftool gifclrmp gif2rgb gifcolor gifbuild gifinto'
lst_lic='COPYING AUTHORS'
lst_pc='giflib.pc'

dev_bra='main'
dev_vrs='5.2.2'
pkg_deb='libgif-dev'
eta='18'

. xbuild && start

# Filelist
# --------
# include/gif_lib.h
# lib/libgiflib.a
# lib/pkgconfig/giflib.pc
# lib/libgiflib.so
# share/doc/giflib/COPYING
# bin/giftext
# bin/gifsponge
# bin/giffilter
# bin/giffix
# bin/gifecho
# bin/gifbg
# bin/gifhisto
# bin/gifwedge
# bin/giftool
# bin/gifclrmp
# bin/gif2rgb
# bin/gifcolor
# bin/gifbuild
# bin/gifinto
