#!/bin/bash

lib='frei0r'
apt='frei0r-plugins'
dsc='A large collection of free and portable video plugins'
lic='GPL-2.0'
src='https://github.com/dyne/frei0r.git'
cfg='ag'
xdp='gavl opencv libcairo'
eta='275'
mki='install'

lst_inc='frei0r.h'
lst_lib='frei0r-1/*.*'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='frei0r.pc'

. xbuilder.sh

unset CSH
cmake_config='-DWITHOUT_GAVL=ON -DWITHOUT_OPENCV=ON -DBUILD_SHARED_LIBS=ON'
ac_config='--enable-shared'

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# issues:
# static build is disabled
# aarch64-android : ld: error: unable to find library -lcairo
