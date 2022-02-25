#!/bin/bash

lib='grok'
dsc='Worlds Leading Open Source JPEG 2000 Codec'
lic='Other'
src='https://github.com/GrokImageCompression/grok.git'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
eta='35'

dev_bra='main'
dev_vrs='3.1.1'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENCE'
lst_pc=''

. xbuild

start

# cpu av8 av7 x86 x64
# NDK F  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# pthread_setaffinity_np fail on ndk builds