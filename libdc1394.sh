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
vrs='2.2.7'
#src='https://github.com/indigo-astronomy/libdc1394.git'
#src='git://libdc1394.git.sourceforge.net/gitroot/libdc1394/libdc1394'
#src="https://sourceforge.net/project/libdc1394/libdc1394/${vrs}/libdc1394-${vrs}.tar.gz"
src='https://sourceforge.net/projects/libdc1394/files/latest/download' sty='tgz'
eta='60'
cfg='ac'

. xbuild

#$host_clang && doErr "Clang does not support compile code with VLAiS. Aborting."
CFG='--disable-examples --disable-sdltest'

CLAGS="-std=gnu99 -pedantic-errors -g" 

_before_make(){
    sed -i 's/-std=gnu99 -g/-std=gnu99 -pedantic -g/g' ${dir_build}/dc1394/juju/Makefile
}

start