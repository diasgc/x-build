#!/bin/bash

lib='zvbi'
pkg='zvbi-0.2'
apt='libzvbi-dev'
apt="${pkg}-dev"
dsc='VBI Capturing and Decoding Library'
lic='BSD 2-clause'
#src='https://github.com/OpenDMM/zvbi.git'
src='https://github.com/zapping-vbi/zvbi.git'
dep='libiconv'
cfg='ag'
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

# ndk:error ld.lld: warning: ../src/.libs/libzvbi.a: archive member 'libiconv.a' is neither ET_REL nor LLVM bitcode
dev_vrs='0.2.42'

ac_config="--disable-dependency-tracking --disable-silent-rules --without-x --disable-tests --disable-examples"

CPPFLAGS+=" -Wno-invalid-source-encoding \
 -Wno-tautological-pointer-compare \
 -Wno-pointer-bool-conversion \
 -Wno-string-plus-int \
 -Wno-dangling-else \
 -Wno-unused-command-line-argument \
 -Wno-single-bit-bitfield-constant-conversion"
LDFLAGS+=" -liconv"

on_config(){
    $host_ndk && ac_config+=' --disable-nls'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
