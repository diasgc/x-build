#!/bin/bash

lib='zvbi'
pkg='zvbi-0.2'
apt='libzvbi-dev'
apt="${pkg}-dev"
dsc='VBI Capturing and Decoding Library'
lic='BSD 2-clause'
src='https://github.com/OpenDMM/zvbi.git'
sty='git'
#vrs='0-2-35'
#src="https://github.com/OpenDMM/zvbi/archive/refs/tags/zvbi-${vrs}.tar.gz"
#sty="tgz"
dep='libiconv'
cfg='ar'
eta='60'
API=28

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuilder.sh

#$host_ndk && dep+=" libbthread"

ac_config="--disable-dvb --disable-bktr --disable-nls --disable-proxy --without-doxygen --with-x=no"

CPPFLAGS="-Wno-string-plus-int -Wno-invalid-source-encoding -Wno-deprecated-declarations -Wno-tautological-pointer-compare"

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
