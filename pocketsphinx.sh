#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='pocketsphinx'
dsc='Speech recognition tool'
lic='BSD-2c'
src='https://github.com/cmusphinx/pocketsphinx.git'
cfg='ag'
eta='0'
dep='sphinxbase'
CFG='--without-python'

lst_inc=''
lst_lib=''
lst_bin=''


. xbuilder.sh

start