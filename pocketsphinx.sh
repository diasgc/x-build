#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='pocketsphinx'
dsc='Speech recognition tool'
lic='BSD-2c'
src='https://github.com/cmusphinx/pocketsphinx.git'
dep='sphinxbase'

cfg='cmake'
cmake_config='-DBUILD_TESTING=OFF'

on_config_ndk(){
    cmake_add_link_options='-llog'
}

dev_bra='master'
dev_vrs='5.0.3'
pkg_deb='libpocketsphinx-dev'
eta='0'

. xbuild && start