#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='mediainfolib'
pkg='libmediainfo'
dsc='Convenient unified display of the most relevant technical and tag data for video and audio files.'
lic='BSD 2-Clause Simplified"'
vrs=''
src="https://github.com/MediaArea/MediaInfoLib.git"
cfg='cmake'
eta='0'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

on_config(){
    dir_config="${dir_src}/Project/CMake"
}

. xbuild && start