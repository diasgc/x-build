#!/bin/bash

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libdc1394'
apt='libdc1394-dev'
dsc='IIDC Camera Control Library'
lic='LGPL-2.1'
vrs='2.2.7'
src='https://sourceforge.net/projects/libdc1394/files/latest/download' sty='tgz'
eta='60'
pkg='libdc1394-2'
cfg='cmake'

. xbuild && start