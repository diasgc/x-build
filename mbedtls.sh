#!/bin/bash

lib='mbedtls'
apt="${lib}-dev"
dsc='An open source, portable, easy to use, readable and flexible SSL library.'
lic='Apache-2.0'
src='https://github.com/ARMmbed/mbedtls.git'
cfg='cmake'
tls='python3 perl'
eta='1266'

cmake_static='USE_STATIC_MBEDTLS_LIBRARY'
cmake_shared='USE_SHARED_MBEDTLS_LIBRARY'
cmake_bin="ENABLE_PROGRAMS"
cmake_config="-DENABLE_TESTING=OFF" #-DUNSAFE_BUILD=OFF -DMBEDTLS_FATAL_WARNINGS=ON -DLINK_WITH_PTHREAD=OFF -DLINK_WITH_TRUSTED_STORAGE=OFF"

dev_bra='master'
dev_vrs='v3.1.0'
stb_bra=''
stb_vrs=''

pc_llibs='-lmbedtls -lmbedx509 -lmbedcrypto'

lst_inc='psa/*.h mbedtls/*.h'
lst_lib='libmbedx509 libmbedcrypto libmbedtls'
lst_bin='cert_app crypto_examples key_app_writer
 ssl_client2 ecdh_curve25519 cert_req
 pk_sign pk_decrypt rsa_decrypt
 cert_write load_roots udp_proxy
 benchmark rsa_sign dh_server
 dh_genprime ssl_server pk_encrypt
 rsa_sign_pss zeroize hello
 dh_client crypt_and_hash ssl_server2
 req_app ecdsa key_ladder_demo.sh
 ssl_pthread_server dtls_client
 pk_verify mpi_demo rsa_verify_pss
 rsa_genkey ssl_fork_server
 ssl_mail_client rsa_encrypt
 generic_sum gen_key ssl_client1
 query_compile_time_config rsa_verify
 crl_app strerror selftest key_app
 pem2der mini_client dtls_server
 gen_random_ctr_drbg key_ladder_demo
 psa_constant_names ssl_context_info
 gen_entropy'
lst_lic='LICENSE'
lst_pc='libmbedx509.pc libmbedcrypto.pc libmbedtls.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/psa/crypto_driver_contexts_composites.h
# include/psa/crypto.h
# include/psa/crypto_driver_common.h
# include/psa/crypto_sizes.h
# include/psa/crypto_config.h
# include/psa/crypto_struct.h
# include/psa/crypto_values.h
# include/psa/crypto_platform.h
# include/psa/crypto_extra.h
# include/psa/crypto_builtin_composites.h
# include/psa/crypto_se_driver.h
# include/psa/crypto_driver_contexts_primitives.h
# include/psa/crypto_types.h
# include/psa/crypto_compat.h
# include/psa/crypto_builtin_primitives.h
# include/mbedtls/nist_kw.h
# include/mbedtls/cipher.h
# include/mbedtls/ssl_ticket.h
# include/mbedtls/ripemd160.h
# include/mbedtls/ecdsa.h
# include/mbedtls/pkcs12.h
# include/mbedtls/poly1305.h
# include/mbedtls/error.h
# include/mbedtls/asn1write.h
# include/mbedtls/md.h
# include/mbedtls/hmac_drbg.h
# include/mbedtls/ctr_drbg.h
# include/mbedtls/platform.h
# include/mbedtls/aria.h
# include/mbedtls/x509.h
# include/mbedtls/constant_time.h
# include/mbedtls/ssl_ciphersuites.h
# include/mbedtls/oid.h
# include/mbedtls/threading.h
# include/mbedtls/pkcs5.h
# include/mbedtls/timing.h
# include/mbedtls/aes.h
# include/mbedtls/md5.h
# include/mbedtls/x509_csr.h
# include/mbedtls/asn1.h
# include/mbedtls/base64.h
# include/mbedtls/sha256.h
# include/mbedtls/build_info.h
# include/mbedtls/x509_crt.h
# include/mbedtls/sha1.h
# include/mbedtls/platform_time.h
# include/mbedtls/compat-2.x.h
# include/mbedtls/pem.h
# include/mbedtls/entropy.h
# include/mbedtls/cmac.h
# include/mbedtls/net_sockets.h
# include/mbedtls/version.h
# include/mbedtls/chachapoly.h
# include/mbedtls/config_psa.h
# include/mbedtls/ccm.h
# include/mbedtls/psa_util.h
# include/mbedtls/gcm.h
# include/mbedtls/platform_util.h
# include/mbedtls/x509_crl.h
# include/mbedtls/des.h
# include/mbedtls/chacha20.h
# include/mbedtls/ecp.h
# include/mbedtls/hkdf.h
# include/mbedtls/ecdh.h
# include/mbedtls/ssl.h
# include/mbedtls/sha512.h
# include/mbedtls/check_config.h
# include/mbedtls/rsa.h
# include/mbedtls/dhm.h
# include/mbedtls/memory_buffer_alloc.h
# include/mbedtls/debug.h
# include/mbedtls/pk.h
# include/mbedtls/ssl_cookie.h
# include/mbedtls/bignum.h
# include/mbedtls/ecjpake.h
# include/mbedtls/mbedtls_config.h
# include/mbedtls/private_access.h
# include/mbedtls/ssl_cache.h
# include/mbedtls/camellia.h
# cmake/MbedTLSTargets-release.cmake
# cmake/MbedTLSConfigVersion.cmake
# cmake/MbedTLSTargets.cmake
# cmake/MbedTLSConfig.cmake
# lib/libmbedtls.so
# lib/libmbedx509.a
# lib/libmbedx509.so
# lib/libmbedcrypto.so
# lib/libmbedcrypto.a
# lib/libmbedtls.a
# share/doc/mbedtls/LICENSE
# bin/cert_app
# bin/crypto_examples
# bin/key_app_writer
# bin/ssl_client2
# bin/ecdh_curve25519
# bin/cert_req
# bin/pk_sign
# bin/pk_decrypt
# bin/rsa_decrypt
# bin/cert_write
# bin/load_roots
# bin/udp_proxy
# bin/benchmark
# bin/rsa_sign
# bin/dh_server
# bin/dh_genprime
# bin/ssl_server
# bin/pk_encrypt
# bin/rsa_sign_pss
# bin/zeroize
# bin/hello
# bin/dh_client
# bin/crypt_and_hash
# bin/ssl_server2
# bin/req_app
# bin/ecdsa
# bin/key_ladder_demo.sh
# bin/ssl_pthread_server
# bin/dtls_client
# bin/pk_verify
# bin/mpi_demo
# bin/rsa_verify_pss
# bin/rsa_genkey
# bin/ssl_fork_server
# bin/ssl_mail_client
# bin/rsa_encrypt
# bin/generic_sum
# bin/gen_key
# bin/ssl_client1
# bin/query_compile_time_config
# bin/rsa_verify
# bin/crl_app
# bin/strerror
# bin/selftest
# bin/key_app
# bin/pem2der
# bin/mini_client
# bin/dtls_server
# bin/gen_random_ctr_drbg
# bin/key_ladder_demo
# bin/psa_constant_names
# bin/ssl_context_info
# bin/gen_entropy
