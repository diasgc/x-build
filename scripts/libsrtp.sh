#!/bin/bash

lib='libsrtp'
pkg='libsrtp2'
dsc='Library for SRTP (Secure Realtime Transport Protocol)'
lic='BSD-3c'
src='https://github.com/cisco/libsrtp.git'
cfg='meson'
eta='35'

lst_inc='srtp2/*.h'
lst_lib='libsrtp2'
lst_bin=''
lst_lic='LICENSE CODEOWNERS'
lst_pc='libsrtp2.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
# latest: v2.5.0

# Filelist
# --------
# include/srtp2/cipher.h
# include/srtp2/srtp.h
# include/srtp2/crypto_types.h
# include/srtp2/auth.h
# lib/pkgconfig/libsrtp2.pc
# lib/libsrtp2.so
# lib/libsrtp2.a
# share/doc/libsrtp/CODEOWNERS
# share/doc/libsrtp/LICENSE
