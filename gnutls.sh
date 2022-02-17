#!/bin/bash

lib='gnutls'
dsc='GnuTLS implements the TLS/SSL (Transport Layer Security aka Secure Sockets Layer) protocol'
lic='LGPL-2.1'
src='https://gitlab.com/gnutls/gnutls.git'
cfg='ac'
#automake_cmd='./bootstrap'
dep='libiconv gmp nettle'
eta='690'
ac_bin='--disable-tools|--enable-tools'
mki='install'

lst_inc='gnutls/*.h'
lst_lib='libgnutls libgnutlsxx'
lst_bin='gnutls-serv srptool psktool gnutls-cli ocsptool certtool gnutls-cli-debug'
lst_lic='LICENSE'
lst_pc='gnutls.pc'

. xbuilder.sh

vrs="3.6.16"
src="https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-${vrs}.tar.xz"

ac_config="--disable-hardware-acceleration --enable-local-libopts --with-included-libtasn1 --with-included-unistring --without-p11-kit --disable-doc --disable-manpages --disable-guile --disable-tests"
WFLAGS='-Wno-tautological-constant-compare -Wno-unused-but-set-variable -Wno-unused-function -Wno-implicit-const-int-float-conversion -Wno-implicit-const-int-float-conversion -Wno-unused-but-set-parameter'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/gnutls/pkcs12.h
# include/gnutls/crypto.h
# include/gnutls/dtls.h
# include/gnutls/x509.h
# include/gnutls/gnutlsxx.h
# include/gnutls/x509-ext.h
# include/gnutls/self-test.h
# include/gnutls/pkcs7.h
# include/gnutls/urls.h
# include/gnutls/system-keys.h
# include/gnutls/tpm.h
# include/gnutls/compat.h
# include/gnutls/abstract.h
# include/gnutls/openpgp.h
# include/gnutls/ocsp.h
# include/gnutls/gnutls.h
# include/gnutls/socket.h
# include/gnutls/pkcs11.h
# lib/pkgconfig/gnutls.pc
# lib/libgnutls.so
# lib/libgnutlsxx.a
# lib/libgnutlsxx.la
# lib/libgnutls.a
# lib/libgnutls.la
# lib/libgnutlsxx.so
# share/doc/gnutls/LICENSE
# bin/gnutls-serv
# bin/srptool
# bin/psktool
# bin/gnutls-cli
# bin/ocsptool
# bin/certtool
# bin/gnutls-cli-debug
