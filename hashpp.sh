#!/bin/bash

lib='hashpp'
dsc='Portable C++ hashing library'
lic='Zlib'
url='https://create.stephan-brumme.com/hash-library/'
src='https://github.com/stbrumme/hash-library.git'
cfg='cmake'
eta='60'
build_strip=false

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE readme.md'
lst_pc=''

dev_vrs='9'

. xbuild

start

<<'LZS_PATCH'
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
8QElqqyQA=
LZS_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
#
# include/hashpp/crc32.h
# include/hashpp/hash.h
# include/hashpp/hmac.h
# include/hashpp/keccak.h
# include/hashpp/md5.h
# include/hashpp/sha1.h
# include/hashpp/sha256.h
# include/hashpp/sha3.h
# lib/libhashpp.a
# lib/libhashpp.so
# lib/pkgconfig/hashpp.pc
# share/doc/hashpp/LICENSE
# share/doc/hashpp/readme.md
