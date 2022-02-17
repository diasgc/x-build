#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   . static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='lib7zip'
dsc='c++ library wrapper of 7zip'
lic='MLP-2.0'
src='https://github.com/stonewell/lib7zip.git'
cfg='ccm'

eta='1095'

. xbuilder.sh

source_config(){
    git submodule init && git submodule update
}

start