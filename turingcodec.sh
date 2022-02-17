#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   V   F   F   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='turingcodec'
dsc='HEVC software encoder optimised for fast encoding of large resolution video content'
lic='GLP-2.0'
src='https://github.com/bbc/turingcodec.git'
cfg='cmake'
pkg='libturing'
eta='1095'
#CFG="-DUSE_SYSTEM_BOOST=OFF"

. xbuilder.sh

nodev=true


source_patch(){
    # update cmakelists version to 3.1
    for c in $(find . -name "CMakeLists.txt"); do
        sed -i 's/VERSION 2.8/VERSION 3.1/g' $c
    done
}

start