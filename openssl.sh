#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='openssl'
dsc='TLS/SSL and crypto library'
lic='Apache-2.0'
src='https://github.com/openssl/openssl.git'
cfg='other'
tls='nasm perl'
#dep='cryptopp'
eta='360'

lst_inc='openssl/*.h'
lst_lib='libssl libcrypto ossl-modules/legacy.so engines-3/*.so '
lst_bin='c_rehash openssl'
lst_lic='LICENSE.txt AUTHORS.md'
lst_pc='libssl.pc libcrypto.pc openssl.pc'

dev_vrs='3.3.0'
CFLAGS='-Wno-macro-redefined'

# install no docs
mki="install_sw"

on_config(){
  dir_build="${dir_src}/build_${arch}"
  PATH=$TOOLCHAIN/bin:$PATH
  $host_ndk && CFG="android-${target_trip[0]} -D__ANDROID_API__=$API no-tests" && CFG="${CFG/aarch64/arm64}"

  case $arch in
    x86_64-w64-mingw32 )    CFG="no-idea no-mdc2 no-rc5 mingw64 --cross-compile-prefix=x86_64-w64-mingw32-";;
    i686-w64-mingw32 )      CFG="no-idea no-mdc2 no-rc5 mingw --cross-compile-prefix=i686-w64-mingw32-";;
  esac

  $build_shared || CFG+=" no-shared"
  export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME
}

build_config(){
  do_log 'config' $dir_src/Configure ${CFG} --prefix=${dir_install}
}

. xbuild && start


# Filelist
# --------
# share/doc/openssl/LICENSE.txt
# share/doc/openssl/AUTHORS.md
# include/openssl/rc5.h
# include/openssl/rc4.h
# include/openssl/pemerr.h
# include/openssl/asn1_mac.h
# include/openssl/provider.h
# include/openssl/core.h
# include/openssl/engine.h
# include/openssl/dherr.h
# include/openssl/dsaerr.h
# include/openssl/proverr.h
# include/openssl/pem2.h
# include/openssl/ebcdic.h
# include/openssl/asn1err.h
# include/openssl/ui.h
# include/openssl/core_object.h
# include/openssl/encodererr.h
# include/openssl/ssl.h
# include/openssl/http.h
# include/openssl/param_build.h
# include/openssl/cmac.h
# include/openssl/self_test.h
# include/openssl/rc2.h
# include/openssl/pem.h
# include/openssl/sha.h
# include/openssl/txt_db.h
# include/openssl/params.h
# include/openssl/modes.h
# include/openssl/uierr.h
# include/openssl/cast.h
# include/openssl/ecdh.h
# include/openssl/dh.h
# include/openssl/kdferr.h
# include/openssl/bio.h
# include/openssl/rsa.h
# include/openssl/cmserr.h
# include/openssl/ripemd.h
# include/openssl/conf.h
# include/openssl/conf_api.h
# include/openssl/rsaerr.h
# include/openssl/crypto.h
# include/openssl/err.h
# include/openssl/ecdsa.h
# include/openssl/opensslconf.h
# include/openssl/ts.h
# include/openssl/esserr.h
# include/openssl/seed.h
# include/openssl/idea.h
# include/openssl/kdf.h
# include/openssl/engineerr.h
# include/openssl/md5.h
# include/openssl/stack.h
# include/openssl/pkcs12.h
# include/openssl/x509v3err.h
# include/openssl/rand.h
# include/openssl/bnerr.h
# include/openssl/des.h
# include/openssl/x509v3.h
# include/openssl/ocsperr.h
# include/openssl/pkcs7.h
# include/openssl/ossl_typ.h
# include/openssl/lhash.h
# include/openssl/fips_names.h
# include/openssl/storeerr.h
# include/openssl/mdc2.h
# include/openssl/decoder.h
# include/openssl/macros.h
# include/openssl/asn1.h
# include/openssl/cterr.h
# include/openssl/md2.h
# include/openssl/prov_ssl.h
# include/openssl/dsa.h
# include/openssl/comp.h
# include/openssl/cms.h
# include/openssl/ssl2.h
# include/openssl/conferr.h
# include/openssl/srtp.h
# include/openssl/conftypes.h
# include/openssl/x509.h
# include/openssl/objects.h
# include/openssl/sslerr_legacy.h
# include/openssl/camellia.h
# include/openssl/ocsp.h
# include/openssl/ess.h
# include/openssl/fipskey.h
# include/openssl/e_os2.h
# include/openssl/cryptoerr.h
# include/openssl/store.h
# include/openssl/buffer.h
# include/openssl/bioerr.h
# include/openssl/hmac.h
# include/openssl/whrlpool.h
# include/openssl/opensslv.h
# include/openssl/core_names.h
# include/openssl/cmperr.h
# include/openssl/pkcs12err.h
# include/openssl/sslerr.h
# include/openssl/cmp_util.h
# include/openssl/pkcs7err.h
# include/openssl/safestack.h
# include/openssl/randerr.h
# include/openssl/dtls1.h
# include/openssl/evp.h
# include/openssl/async.h
# include/openssl/asyncerr.h
# include/openssl/md4.h
# include/openssl/tls1.h
# include/openssl/comperr.h
# include/openssl/ct.h
# include/openssl/srp.h
# include/openssl/cryptoerr_legacy.h
# include/openssl/cmp.h
# include/openssl/x509_vfy.h
# include/openssl/blowfish.h
# include/openssl/objectserr.h
# include/openssl/trace.h
# include/openssl/httperr.h
# include/openssl/x509err.h
# include/openssl/configuration.h
# include/openssl/ec.h
# include/openssl/obj_mac.h
# include/openssl/buffererr.h
# include/openssl/aes.h
# include/openssl/decodererr.h
# include/openssl/asn1t.h
# include/openssl/crmferr.h
# include/openssl/encoder.h
# include/openssl/symhacks.h
# include/openssl/ecerr.h
# include/openssl/ssl3.h
# include/openssl/core_dispatch.h
# include/openssl/bn.h
# include/openssl/tserr.h
# include/openssl/crmf.h
# include/openssl/evperr.h
# include/openssl/types.h
# ssl/openssl.cnf
# ssl/ct_log_list.cnf.dist
# ssl/ct_log_list.cnf
# ssl/misc/CA.pl
# ssl/misc/tsget.pl
# ssl/openssl.cnf.dist
# bin/c_rehash
# bin/openssl
# lib/pkgconfig/openssl.pc
# lib/pkgconfig/libssl.pc
# lib/pkgconfig/libcrypto.pc
# lib/libssl.a
# lib/libssl.so
# lib/libcrypto.so
# lib/libcrypto.a
# lib/ossl-modules/legacy.so
# lib/engines-3/capi.so
# lib/engines-3/padlock.so
# lib/engines-3/loader_attic.so

