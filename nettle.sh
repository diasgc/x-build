#!/bin/bash

lib='nettle'
dsc='Nettle - a low-level cryptographic library'
lic='LGPL-3.0'
src='https://git.lysator.liu.se/nettle/nettle.git'
cfg='ac'
automake_cmd='./.bootstrap'
dep='gmp'
prp='lib64/pkgconfig/nettle.pc'
eta='90'
mkc='distclean'

lst_inc='nettle/*.h'
lst_lib='libhogweed libnettle'
lst_bin='pkcs1-conv nettle-lfib-stream nettle-hash nettle-pbkdf2 sexp-conv'
lst_lic='COPYINGv2 COPYINGv3 COPYING.LESSERv3'
lst_pc='hogweed.pc nettle.pc'

. xbuilder.sh

CFG="--disable-documentation --disable-mini-gmp --enable-pic CC_FOR_BUILD=gcc"

$host_arm && CFG+=" --enable-arm-neon" || CFG+=" --enable-x86-sha-ni --enable-x86-aesni"
($host_ndk || $host_mingw) && CFG+=' --disable-assembler'
$host_cross || dir_install_pc=${dir_install}/lib64/pkgconfig

on_create_pc(){
  [ -d "${dir_install}/lib64" ] && [ ! -d "${dir_install}/lib" ] && ln -s "${dir_install}/lib64" "${dir_install}/lib"
  return 0
}

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/nettle/nettle-types.h
# include/nettle/sha.h
# include/nettle/ripemd160.h
# include/nettle/ecdsa.h
# include/nettle/nettle-meta.h
# include/nettle/siv-cmac.h
# include/nettle/poly1305.h
# include/nettle/base16.h
# include/nettle/gostdsa.h
# include/nettle/arcfour.h
# include/nettle/hmac.h
# include/nettle/yarrow.h
# include/nettle/curve25519.h
# include/nettle/memops.h
# include/nettle/buffer.h
# include/nettle/sha3.h
# include/nettle/pgp.h
# include/nettle/pkcs1.h
# include/nettle/ctr.h
# include/nettle/pss.h
# include/nettle/pbkdf2.h
# include/nettle/umac.h
# include/nettle/blowfish.h
# include/nettle/md5-compat.h
# include/nettle/cfb.h
# include/nettle/ecc.h
# include/nettle/streebog.h
# include/nettle/aes.h
# include/nettle/md5.h
# include/nettle/cast128.h
# include/nettle/eax.h
# include/nettle/arctwo.h
# include/nettle/asn1.h
# include/nettle/base64.h
# include/nettle/cbc.h
# include/nettle/pss-mgf1.h
# include/nettle/curve448.h
# include/nettle/sha1.h
# include/nettle/knuth-lfib.h
# include/nettle/memxor.h
# include/nettle/dsa.h
# include/nettle/md2.h
# include/nettle/nist-keywrap.h
# include/nettle/salsa20.h
# include/nettle/md4.h
# include/nettle/realloc.h
# include/nettle/eddsa.h
# include/nettle/ecc-curve.h
# include/nettle/twofish.h
# include/nettle/cmac.h
# include/nettle/version.h
# include/nettle/sha2.h
# include/nettle/sexp.h
# include/nettle/ccm.h
# include/nettle/gcm.h
# include/nettle/dsa-compat.h
# include/nettle/sm3.h
# include/nettle/des.h
# include/nettle/chacha-poly1305.h
# include/nettle/hkdf.h
# include/nettle/macros.h
# include/nettle/chacha.h
# include/nettle/serpent.h
# include/nettle/rsa.h
# include/nettle/gosthash94.h
# include/nettle/bignum.h
# include/nettle/xts.h
# include/nettle/camellia.h
# lib/pkgconfig/hogweed.pc
# lib/pkgconfig/nettle.pc
# lib/libhogweed.so.6.2
# lib/libnettle.a
# lib/libhogweed.a
# lib/libnettle.so.8.2
# share/doc/nettle/COPYINGv2
# share/doc/nettle/COPYING.LESSERv3
# share/doc/nettle/COPYINGv3
# bin/pkcs1-conv
# bin/nettle-lfib-stream
# bin/nettle-hash
# bin/nettle-pbkdf2
# bin/sexp-conv
