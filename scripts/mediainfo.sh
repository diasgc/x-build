#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang     + ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='mediainfo'
apt="${lib}-dev"
dsc='Convenient unified display of the most relevant technical and tag data for video and audio files.'
lic='BSD-2c'
src='https://github.com/MediaArea/MediaInfo.git'
cfg='ag'
eta='10'
dep='libmediainfo'
mki='install-strip'
mkc='distclean'
disable_shared=true
dir_config='Project/GNU/CLI'
lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# bin/mediainfo
