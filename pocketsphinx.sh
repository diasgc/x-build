#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='pocketsphinx'
dsc='Speech recognition tool'
lic='BSD-2c'
src='https://github.com/cmusphinx/pocketsphinx.git'
cfg='cmake'
eta='0'
dep='sphinxbase'

cmake_config='-DBUILD_TESTING=OFF'

lst_inc=''
lst_lib=''
lst_bin=''

dev_vrs='5.0.3'

on_config(){
    $host_ndk && cmake_add_link_options='-llog'
}

. xbuild && start