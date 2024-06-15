#!/bin/bash

lib='mediainfolib'
pkg='libmediainfo'
dsc='Convenient unified display of the most relevant technical and tag data for video and audio files.'
lic='BSD 2-Clause Simplified"'
src="https://github.com/MediaArea/MediaInfoLib.git"

cfg='cmake'

dev_bra='master'
dev_vrs='24.05'
pkg_deb=''
eta='0'

on_config(){
    dir_config="${dir_src}/Project/CMake"
}

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc