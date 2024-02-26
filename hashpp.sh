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
