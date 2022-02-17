#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='pcre'
pkg='libpcre'
dsc=''
lic='BSD-3c'
src='https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz'
cfg='cmake'
dep='bzip2 readline editline'
eta='0'

lst_inc='pcre.h pcreposix.h pcrecpparg.h pcre_scanner.h pcre_stringpiece.h pcrecpp.h'
lst_lib='libpcreposix libpcrecpp libpcre'
lst_bin='pcre_scanner_unittest pcrecpp_unittest pcregrep pcre-config pcretest pcre_stringpiece_unittest'

. xbuilder.sh

$build_static && CSH="-DBUILD_SHARED_LIBS=OFF"

start

<<'XB64_PATCH'
LS0tIHBjcmVjcHAuY2MJMjAyMS0xMS0wMSAyMDo1MDozNS40NTkwMDAwMDAgKzAwMDAKKysrIHBj
cmVjcHAuY2MJMjAyMS0xMS0wMSAyMTozMzoyMy4xNzIzODcyMDAgKzAwMDAKQEAgLTQ4LDYgKzQ4
LDkgQEAKICNpbmNsdWRlICJwY3JlY3BwLmgiCiAjaW5jbHVkZSAicGNyZV9zdHJpbmdwaWVjZS5o
IgogCisjaWYgZGVmaW5lZChfX0FORFJPSURfXykKKyN1bmRlZiBIQVZFX1NUUlRPUQorI2VuZGlm
CiAKIG5hbWVzcGFjZSBwY3JlY3BwIHsKCi0tLSBDTWFrZUxpc3RzLm9sZAkyMDIxLTExLTAxIDIx
OjM4OjQ1LjY3NTAwMDAwMCArMDAwMAorKysgQ01ha2VMaXN0cy50eHQJMjAyMS0xMS0wMSAyMTo0
MTowNC40ODIzODcyMDAgKzAwMDAKQEAgLTEyNyw3ICsxMjcsNyBAQAogCiBTRVQoQlVJTERfU0hB
UkVEX0xJQlMgT0ZGIENBQ0hFIEJPT0wKICAgICAiQnVpbGQgc2hhcmVkIGxpYnJhcmllcyBpbnN0
ZWFkIG9mIHN0YXRpYyBvbmVzLiIpCi0KK09QVElPTihJTlNUQUxMX0RPQ1MgIklOU1RBTEwgRE9D
UyBBTkQgTUFOIiBPRkYpCiBPUFRJT04oUENSRV9CVUlMRF9QQ1JFOCAiQnVpbGQgOCBiaXQgUENS
RSBsaWJyYXJ5IiBPTikKIAogT1BUSU9OKFBDUkVfQlVJTERfUENSRTE2ICJCdWlsZCAxNiBiaXQg
UENSRSBsaWJyYXJ5IiBPRkYpCkBAIC05NTgsMTAgKzk1OCwxMSBAQAogICAgICAgICBFTkRGT1JF
QUNIKG1hbiAke21hbjN9KQogICAgICAgICBTRVQobWFuMyAke21hbjNfbmV3fSkKIEVORElGKFBD
UkVfQlVJTERfUENSRUNQUCkKLQorSUYoSU5TVEFMTF9ET0NTKQogSU5TVEFMTChGSUxFUyAke21h
bjF9IERFU1RJTkFUSU9OIG1hbi9tYW4xKQogSU5TVEFMTChGSUxFUyAke21hbjN9IERFU1RJTkFU
SU9OIG1hbi9tYW4zKQogSU5TVEFMTChGSUxFUyAke2h0bWx9IERFU1RJTkFUSU9OIHNoYXJlL2Rv
Yy9wY3JlL2h0bWwpCitFTkRJRigpCiBJTlNUQUxMKEZJTEVTICR7cGN9IERFU1RJTkFUSU9OICR7
Q01BS0VfSU5TVEFMTF9MSUJESVJ9L3BrZ2NvbmZpZykKIElOU1RBTEwoRklMRVMgIiR7Q01BS0Vf
Q1VSUkVOVF9CSU5BUllfRElSfS9wY3JlLWNvbmZpZyIKICAgICAgICAgREVTVElOQVRJT04gYmlu
Cg==
XB64_PATCH




# Filelist
# --------
# include/pcre.h
# include/pcreposix.h
# include/pcrecpparg.h
# include/pcre_scanner.h
# include/pcre_stringpiece.h
# include/pcrecpp.h
# lib/pkgconfig/libpcreposix.pc
# lib/pkgconfig/libpcre.pc
# lib/pkgconfig/libpcrecpp.pc
# lib/libpcreposix.a
# lib/libpcrecpp.a
# lib/libpcre.a
# bin/pcre_scanner_unittest
# bin/pcrecpp_unittest
# bin/pcregrep
# bin/pcre-config
# bin/pcretest
# bin/pcre_stringpiece_unittest
