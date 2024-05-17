#!/bin/bash

lib='tensorflow'
dsc='An Open Source Machine Learning Framework for Everyone'
lic='Apache-2.0'
src='https://github.com/tensorflow/tensorflow.git'
cfg='bazel'
dep=''
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc