#!/bin/bash

lib='id3v2lib'
pkg_deb='id3lib-dev'
dsc='id3v2lib is a library written in C to read and edit id3 tags from mp3 files'
lic='BSD-2c'
src='https://github.com/larsbs/id3v2lib.git'
cfg='cmake'
eta='10'
cmake_static='BUILD_STATIC_LIBS'
patch='id3v2lib-01'

lst_inc='id3v2lib/constants.h
 id3v2lib/frame.h
 id3v2lib.h
 id3v2lib/header.h
 id3v2lib/types.h
 id3v2lib/utils.h'
lst_lib='libid3v2'
lst_bin=''
lst_lic='LICENSE README.md'
lst_pc='id3v2lib.pc'

dev_vrs='1.0.0'

. xbuild && start

# Filelist
# --------
# include/id3v2lib/constants.h
# include/id3v2lib/frame.h
# include/id3v2lib.h
# include/id3v2lib/header.h
# include/id3v2lib/types.h
# include/id3v2lib/utils.h
# lib/libid3v2.a
# lib/libid3v2.so
# lib/pkgconfig/id3v2lib.pc
# share/doc/id3v2lib/LICENSE
# share/doc/id3v2lib/README.md
