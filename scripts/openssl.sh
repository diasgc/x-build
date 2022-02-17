#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

# TODO
# . remove docs and html pages


lib='openssl'
dsc='TLS/SSL and crypto library'
lic='Apache-2.0'
src='https://github.com/openssl/openssl.git'
cfg='other'
tls='nasm perl'
dep='cryptopp'
eta='360'
mki="install"
csh0="-static no-shared pic"
csh1="-static shared pic"

lst_inc='openssl/*.h'
lst_lib='libssl libcrypto ossl-modules/legacy.so engines-3/*.so '
lst_bin='c_rehash openssl'
lst_lic='LICENSE.txt AUTHORS.md'
lst_pc='libssl.pc libcrypto.pc openssl.pc'

. xbuilder.sh

BUILD_DIR="${dir_src}/build_${arch}"
PATH=$TOOLCHAIN/bin:$PATH
case $arch in
  x86_64-w64-mingw32 )    CFG="no-idea no-mdc2 no-rc5 mingw64 --cross-compile-prefix=x86_64-w64-mingw32-";;
  i686-w64-mingw32 )      CFG="no-idea no-mdc2 no-rc5 mingw --cross-compile-prefix=i686-w64-mingw32-";;
  aarch64-linux-android ) CFG="android-arm64 -D__ANDROID_API__=$API" CC=clang;;
  arm-linux-androideabi ) CFG="android-arm -D__ANDROID_API__=$API" CC=clang;;
  i686-linux-android )    CFG="android-x86 -D__ANDROID_API__=$API" CC=clang;;
  x86_64-linux-android )  CFG="android-x86_64 -D__ANDROID_API__=$API" CC=clang;;
esac
#AS=$YASM
export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME

WFLAGS='-Wno-macro-redefined'

build_config(){
  do_log 'config' $dir_src/Configure $CFG --prefix=${dir_install}
}

on_make(){
  sed -i "0,/^install:(.*)install_docs$/{s/ install_docs//}" $dir_src/Makefile
  $MAKE_EXECUTABLE depend && $MAKE_EXECUTABLE -j${HOST_NPROC}
}

start

# Filelist
# --------
# include/openssl/lhash.h
# include/openssl/params.h
# include/openssl/err.h
# include/openssl/bio.h
# include/openssl/conf_api.h
# include/openssl/dsaerr.h
# include/openssl/sha.h
# include/openssl/modes.h
# include/openssl/core_dispatch.h
# include/openssl/cryptoerr_legacy.h
# include/openssl/objectserr.h
# include/openssl/ecdsa.h
# include/openssl/x509err.h
# include/openssl/pkcs12.h
# include/openssl/safestack.h
# include/openssl/fipskey.h
# include/openssl/opensslv.h
# include/openssl/crypto.h
# include/openssl/tls1.h
# include/openssl/ec.h
# include/openssl/esserr.h
# include/openssl/objects.h
# include/openssl/asn1_mac.h
# include/openssl/ui.h
# include/openssl/txt_db.h
# include/openssl/cryptoerr.h
# include/openssl/idea.h
# include/openssl/hmac.h
# include/openssl/cmperr.h
# include/openssl/ssl3.h
# include/openssl/buffer.h
# include/openssl/core_object.h
# include/openssl/x509v3err.h
# include/openssl/opensslconf.h
# include/openssl/core_names.h
# include/openssl/kdferr.h
# include/openssl/x509.h
# include/openssl/dtls1.h
# include/openssl/proverr.h
# include/openssl/rc2.h
# include/openssl/rsaerr.h
# include/openssl/core.h
# include/openssl/ripemd.h
# include/openssl/ebcdic.h
# include/openssl/blowfish.h
# include/openssl/decoder.h
# include/openssl/pkcs7.h
# include/openssl/types.h
# include/openssl/uierr.h
# include/openssl/cterr.h
# include/openssl/decodererr.h
# include/openssl/param_build.h
# include/openssl/self_test.h
# include/openssl/buffererr.h
# include/openssl/aes.h
# include/openssl/encodererr.h
# include/openssl/md5.h
# include/openssl/storeerr.h
# include/openssl/comperr.h
# include/openssl/mdc2.h
# include/openssl/conferr.h
# include/openssl/rand.h
# include/openssl/engineerr.h
# include/openssl/asn1.h
# include/openssl/seed.h
# include/openssl/pkcs7err.h
# include/openssl/pem2.h
# include/openssl/srtp.h
# include/openssl/sslerr.h
# include/openssl/comp.h
# include/openssl/dherr.h
# include/openssl/store.h
# include/openssl/prov_ssl.h
# include/openssl/tserr.h
# include/openssl/provider.h
# include/openssl/crmferr.h
# include/openssl/cms.h
# include/openssl/dsa.h
# include/openssl/md2.h
# include/openssl/md4.h
# include/openssl/pem.h
# include/openssl/dh.h
# include/openssl/evp.h
# include/openssl/cast.h
# include/openssl/rc4.h
# include/openssl/cmac.h
# include/openssl/ossl_typ.h
# include/openssl/conftypes.h
# include/openssl/whrlpool.h
# include/openssl/sslerr_legacy.h
# include/openssl/encoder.h
# include/openssl/bn.h
# include/openssl/kdf.h
# include/openssl/bnerr.h
# include/openssl/ess.h
# include/openssl/x509_vfy.h
# include/openssl/ocsp.h
# include/openssl/evperr.h
# include/openssl/e_os2.h
# include/openssl/des.h
# include/openssl/crmf.h
# include/openssl/ocsperr.h
# include/openssl/ecdh.h
# include/openssl/trace.h
# include/openssl/macros.h
# include/openssl/asn1err.h
# include/openssl/asn1t.h
# include/openssl/ssl.h
# include/openssl/asyncerr.h
# include/openssl/stack.h
# include/openssl/configuration.h
# include/openssl/ssl2.h
# include/openssl/obj_mac.h
# include/openssl/srp.h
# include/openssl/http.h
# include/openssl/fips_names.h
# include/openssl/rsa.h
# include/openssl/ecerr.h
# include/openssl/pkcs12err.h
# include/openssl/engine.h
# include/openssl/symhacks.h
# include/openssl/rc5.h
# include/openssl/conf.h
# include/openssl/cmp_util.h
# include/openssl/x509v3.h
# include/openssl/async.h
# include/openssl/ct.h
# include/openssl/ts.h
# include/openssl/pemerr.h
# include/openssl/cmserr.h
# include/openssl/httperr.h
# include/openssl/randerr.h
# include/openssl/bioerr.h
# include/openssl/cmp.h
# include/openssl/camellia.h
# lib/pkgconfig/libssl.pc
# lib/pkgconfig/libcrypto.pc
# lib/pkgconfig/openssl.pc
# lib/libcrypto.so
# lib/libcrypto.a
# lib/ossl-modules/legacy.so
# lib/engines-3/padlock.so
# lib/engines-3/loader_attic.so
# lib/engines-3/capi.so
# lib/libssl.a
# lib/libssl.so
# ssl/ct_log_list.cnf.dist
# ssl/ct_log_list.cnf
# ssl/openssl.cnf
# ssl/openssl.cnf.dist
# ssl/misc/tsget.pl
# ssl/misc/CA.pl
# bin/c_rehash
# bin/openssl
