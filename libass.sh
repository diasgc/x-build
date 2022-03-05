#!/bin/bash

lib='libass'
dsc='LibASS is an SSA/ASS subtitles rendering library'
lic='ISC'
src='https://github.com/libass/libass.git'
cfg='ag'
dep='freetype fontconfig fribidi libpng harfbuzz'
pkg='libass'
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING README.md'
lst_pc=''

dev_bra='master'
dev_vrs='0.9.9'
stb_bra=''
stb_vrs=''

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
