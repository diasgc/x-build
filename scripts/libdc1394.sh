#!/bin/bash
# cpu av8 av7 x86 x64
# NDK --------------- clang
# GNU  .   .   .   .  gcc
# WIN --------------- clang/gcc

# CLANG: capture.c contains clang-incompatible VLAiS 

lib='libdc1394'
apt='libdc1394-dev'
dsc='IIDC Camera Control Library '
lic='LGPL-2.1'
#src='https://github.com/indigo-astronomy/libdc1394.git'
src='https://git.code.sf.net/p/libdc1394/code.git'
eta='60'

. xbuilder.sh

$host_clang && doErr "Clang does not support compile code with VLAiS. Aborting."
CFG='--disable-examples'

source_config(){
    autoreconf -is
    sed -i 's/^AM_PATH_SDL/#&/' configure
}

start