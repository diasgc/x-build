#!/bin/bash
# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU  .   .   .   .  gcc
# WIN ++   .   .   .  clang/gcc

lib='libsodium'
dsc='A modern, portable, easy to use crypto library.'
lic='ISC'
src='https://github.com/jedisct1/libsodium.git'
bra='stable'
automake_cmd="./autogen.sh -s"
eta='144'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='sodium.h sodium/*.h'
lst_lib='libsodium'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='libsodium'

. xbuilder.sh

start


# Filelist
# --------
# include/sodium/crypto_kdf.h
# include/sodium/crypto_verify_16.h
# include/sodium/crypto_scalarmult_ristretto255.h
# include/sodium/crypto_kx.h
# include/sodium/crypto_core_salsa20.h
# include/sodium/crypto_scalarmult_ed25519.h
# include/sodium/crypto_secretbox.h
# include/sodium/crypto_aead_chacha20poly1305.h
# include/sodium/crypto_shorthash_siphash24.h
# include/sodium/utils.h
# include/sodium/crypto_stream_salsa208.h
# include/sodium/crypto_sign_edwards25519sha512batch.h
# include/sodium/crypto_secretbox_xsalsa20poly1305.h
# include/sodium/crypto_verify_64.h
# include/sodium/crypto_hash.h
# include/sodium/crypto_scalarmult_curve25519.h
# include/sodium/crypto_secretbox_xchacha20poly1305.h
# include/sodium/crypto_box_curve25519xsalsa20poly1305.h
# include/sodium/crypto_sign.h
# include/sodium/crypto_auth_hmacsha512256.h
# include/sodium/crypto_onetimeauth_poly1305.h
# include/sodium/core.h
# include/sodium/crypto_kdf_blake2b.h
# include/sodium/crypto_core_hsalsa20.h
# include/sodium/crypto_pwhash_scryptsalsa208sha256.h
# include/sodium/crypto_core_ristretto255.h
# include/sodium/crypto_hash_sha512.h
# include/sodium/crypto_aead_xchacha20poly1305.h
# include/sodium/crypto_core_salsa2012.h
# include/sodium/randombytes.h
# include/sodium/crypto_box.h
# include/sodium/crypto_verify_32.h
# include/sodium/crypto_auth.h
# include/sodium/runtime.h
# include/sodium/crypto_onetimeauth.h
# include/sodium/crypto_core_hchacha20.h
# include/sodium/randombytes_internal_random.h
# include/sodium/crypto_pwhash_argon2id.h
# include/sodium/crypto_stream_salsa20.h
# include/sodium/export.h
# include/sodium/crypto_auth_hmacsha256.h
# include/sodium/crypto_stream.h
# include/sodium/crypto_core_salsa208.h
# include/sodium/crypto_pwhash_argon2i.h
# include/sodium/version.h
# include/sodium/crypto_stream_xchacha20.h
# include/sodium/crypto_stream_chacha20.h
# include/sodium/crypto_generichash.h
# include/sodium/crypto_pwhash.h
# include/sodium/crypto_core_ed25519.h
# include/sodium/crypto_generichash_blake2b.h
# include/sodium/randombytes_sysrandom.h
# include/sodium/crypto_box_curve25519xchacha20poly1305.h
# include/sodium/crypto_secretstream_xchacha20poly1305.h
# include/sodium/crypto_aead_aes256gcm.h
# include/sodium/crypto_stream_salsa2012.h
# include/sodium/crypto_auth_hmacsha512.h
# include/sodium/crypto_scalarmult.h
# include/sodium/crypto_shorthash.h
# include/sodium/crypto_sign_ed25519.h
# include/sodium/crypto_stream_xsalsa20.h
# include/sodium/crypto_hash_sha256.h
# include/sodium.h
# lib/libsodium.la
# lib/pkgconfig/libsodium.pc
# lib/libsodium.a
# lib/libsodium.so
# share/libsodium/LICENSE
# share/libsodium/AUTHORS
