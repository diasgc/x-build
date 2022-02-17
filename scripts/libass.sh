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
lst_lic='LICENSE AUTHORS'
lst_pc=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh

start