#!/bin/bash

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='libgcrypt'
pkg_deb='libgcrypt20-dev'
dsc='The GNU crypto library'
lic='LGPL-2.1'
src='https://dev.gnupg.org/source/libgcrypt.git'
cfg='ag'
dep='libgpg-error'
eta='60'

lst_inc='gcrypt.h'
lst_lib='libgcrypt'
lst_bin='mpicalc libgcrypt-config dumpsexp hmac256'

on_config(){
    am_config="--disable-doc --with-libgpg-error-prefix=${LIBSDIR}"
    $host_arm && am_config+=" --disable-aesni-support \
        --disable-shaext-support \
        --disable-pclmul-support \
        --disable-sse41-support \
        --disable-drng-support \
        --disable-avx-support \
        --disable-avx2-support"
    $host_gnu && am_config+=" --with-capabilities=yes"
}

. xbuild && start

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
