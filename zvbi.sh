#!/bin/bash

lib='zvbi'
pkg='zvbi-0.2'
apt='libzvbi-dev'
apt="${pkg}-dev"
dsc='VBI Capturing and Decoding Library'
lic='BSD 2-clause'
src='https://github.com/OpenDMM/zvbi.git'
dep='libiconv'
cfg='ar'
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_vrs=''


. xbuild

#$host_ndk && dep+=" libbthread"

ac_config="--disable-dependency-tracking --disable-dvb --disable-bktr --disable-nls --disable-proxy --without-doxygen"

CPPFLAGS="-Wno-enum-conversion -Wno-string-plus-int -Wno-invalid-source-encoding -Wno-deprecated-declarations -Wno-tautological-pointer-compare -Wno-unused-command-line-argument -Wno-pointer-bool-conversion"

$host_ndk && ac_config+=" --disable-v4l --without-x"

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
