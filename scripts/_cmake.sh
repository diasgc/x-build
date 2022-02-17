#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='cmake'
dsc='cross-platform, open-source make system'
lic='BSD 3-clause'
src='https://github.com/Kitware/CMake.git'
cfg=''
tls=''
dep=''

eta='52'

cs0=' '
cs1=' '
# -----------------------------------------

arch="x86_64-linux-gnu"

. xbuilder.sh $arch

MAKE_EXECUTABLE=gmake

source_patch(){
  ./bootstrap
}

start