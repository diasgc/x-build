#!/bin/bash

lib='bzip2'
dsc='Lossless, block-sorting data compression'
lic='Other'
src='https://gitlab.com/bzip2/bzip2.git'
cfg='cmake'
eta='20'

cmake_static="ENABLE_STATIC_LIB"
cmake_shared="ENABLE_SHARED_LIB"
cmake_bin="ENABLE_APP"
cmake_config="-DENABLE_EXAMPLES=OFF -DENABLE_DOCS=OFF"

lst_inc='bzlib.h'
lst_lib='libbz2 libbz2_static.a'
lst_bin='bzgrep bzdiff bzip2recover bzmore bzip2'
lst_lic='COPYING READM.md'
lst_pc='libbrotlidec.pc libbrotlicommon.pc libbrotlienc.pc'

dev_bra='master'
dev_vrs='1.1.0'
stb_bra=''
stb_vrs=''

WFLAGS='-Wno-sign-conversion'

. xbuilder.sh

start

#             a8  a7  x86 x64
# ndk-clang   +++ +++ ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...


# Filelist
# --------
# include/bzlib.h
# man/man1/bzmore.1
# man/man1/bzip2.1
# man/man1/bzgrep.1
# man/man1/bzdiff.1
# lib/pkgconfig/bzip2.pc
# lib/libbz2.so
# lib/libbz2_static.a
# share/bzip2/README.md
# share/bzip2/COPYING
# bin/bzgrep
# bin/bzdiff
# bin/bzip2recover
# bin/bzmore
# bin/bzip2
