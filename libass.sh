#!/bin/bash

lib='libass'
dsc='LibASS is an SSA/ASS subtitles rendering library'
lic='ISC'
src='https://github.com/libass/libass.git'
cfg='ag'
dep='freetype fontconfig fribidi libpng harfbuzz'
pkg='libass'
eta='60'

lst_inc='ass/*.h'
lst_lib='libass'
lst_bin=''
lst_lic='COPYING README.md'
lst_pc='libass.pc'

dev_bra='master'
dev_vrs='0.15.2'

. xbuild
ac_nosysroot=true
CPPFLAGS+=" -I${dir_install_include}/fribidi -I${dir_install_include}/freetype2"
start

# Filelist
# --------
# share/doc/libass/README.md
# share/doc/libass/COPYING
# include/ass/ass.h
# include/ass/ass_types.h
# lib/libass.so
# lib/pkgconfig/libass.pc
# lib/libass.a
# lib/libass.la
