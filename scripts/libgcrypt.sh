#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   +++ ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libgcrypt'
apt='libgcrypt20-dev'
dsc='The GNU crypto library'
lic='LGPL-2.1'
src='https://dev.gnupg.org/source/libgcrypt.git'
cfg='ag'
dep='libgpg-error'
eta='60'

lst_inc='gcrypt.h'
lst_lib='libgcrypt'
lst_bin='mpicalc libgcrypt-config dumpsexp hmac256'

. xbuilder.sh

CFG="--disable-doc --with-libgpg-error-prefix=${LIBSDIR}"

$host_arm && CFG+=" --disable-aesni-support \
        --disable-shaext-support \
        --disable-pclmul-support \
        --disable-sse41-support \
        --disable-drng-support \
        --disable-avx-support \
        --disable-avx2-support"
$host_gnu && CFG+=" --with-capabilities=yes"

start

# Filelist
# --------
# include/gcrypt.h
# lib/pkgconfig/libgcrypt.pc
# lib/libgcrypt.so
# lib/libgcrypt.a
# lib/libgcrypt.la
# share/aclocal/libgcrypt.m4
# bin/mpicalc
# bin/libgcrypt-config
# bin/dumpsexp
# bin/hmac256
