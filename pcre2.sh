#!/bin/bash

lib='pcre2'
apt='libpcre2-dev'
pkg='libpcre2-8'
dsc='New Perl Compatible Regular Expression Library'
lic='BSD-3c'
src='https://github.com/PhilipHazel/pcre2.git'
cfg='cmake'
eta='0'

cmake_config='-DPCRE2_BUILD_PCRE2_32=ON 
    -DPCRE2_BUILD_PCRE2_16=ON 
    -DPCRE2_BUILD_TESTS=OFF 
    -DINSTALL_DOCS=OFF'
cmake_static='BUILD_STATIC_LIBS'

dev_vrs='10.40'


lst_inc='pcre2.h pcre2posix.h'
lst_lib='libpcre2-posix libpcre2-8 libpcre2-16 libpcre2-32'
lst_bin='pcre2-config pcre2grep'
lst_lic='LICENSE COPYING AUTHORS'
lst_pc='libpcre2-posix.pc libpcre2-8.pc libpcre2-16.pc libpcre2-32.pc'

. xbuild

$host_mingw || cmake_config+=' -DPCRE2_STATIC_PIC=ON'

start

# patch 01 on CMakeLists.txt to insert option INSTALL_DOCS
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMub2xkCTIwMjEtMTEtMDIgMTA6MTE6MjguMTU2MDAwMDAwICswMDAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTExLTAyIDEwOjEyOjQxLjI2ODUxMzAwMCArMDAwMApAQCAt
MTgwLDcgKzE4MCw3IEBACiBTRVQoQlVJTERfU0hBUkVEX0xJQlMgT0ZGIENBQ0hFIEJPT0wgIkJ1
aWxkIHNoYXJlZCBsaWJyYXJpZXMuIikKIAogT1BUSU9OKEJVSUxEX1NUQVRJQ19MSUJTICJCdWls
ZCBzdGF0aWMgbGlicmFyaWVzLiIgT04pCi0KK09QVElPTihJTlNUQUxMX0RPQ1MgIkluc3RhbGwg
ZG9jdW1lbnRzIGFuZCBtYW4gcGFnZXMiIE9GRikKIE9QVElPTihQQ1JFMl9CVUlMRF9QQ1JFMl84
ICJCdWlsZCA4IGJpdCBQQ1JFMiBsaWJyYXJ5IiBPTikKIAogT1BUSU9OKFBDUkUyX0JVSUxEX1BD
UkUyXzE2ICJCdWlsZCAxNiBiaXQgUENSRTIgbGlicmFyeSIgT0ZGKQpAQCAtMTAyNywxMCArMTAy
NywxMSBAQAogICAgICAgICBTRVQobWFuM19uZXcgJHttYW4zfSAke21hbn0pCiBFTkRGT1JFQUNI
KG1hbiAke21hbjN9KQogU0VUKG1hbjMgJHttYW4zX25ld30pCi0KK0lGKElOU1RBTExfRE9DUykK
IElOU1RBTEwoRklMRVMgJHttYW4xfSBERVNUSU5BVElPTiBtYW4vbWFuMSkKIElOU1RBTEwoRklM
RVMgJHttYW4zfSBERVNUSU5BVElPTiBtYW4vbWFuMykKIElOU1RBTEwoRklMRVMgJHtodG1sfSBE
RVNUSU5BVElPTiBzaGFyZS9kb2MvcGNyZTIvaHRtbCkKK0VORElGKElOU1RBTExfRE9DUykKIAog
SUYoTVNWQyBBTkQgSU5TVEFMTF9NU1ZDX1BEQikKICAgICBJTlNUQUxMKEZJTEVTICR7UFJPSkVD
VF9CSU5BUllfRElSfS9wY3JlMi5wZGIK
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# Filelist
# --------
# include/pcre2posix.h
# include/pcre2.h
# cmake/pcre2-config-version.cmake
# cmake/pcre2-config.cmake
# lib/pkgconfig/libpcre2-32.pc
# lib/pkgconfig/libpcre2-posix.pc
# lib/pkgconfig/libpcre2-16.pc
# lib/pkgconfig/libpcre2-8.pc
# lib/libpcre2-32.a
# lib/libpcre2-16.a
# lib/libpcre2-8.so
# lib/libpcre2-16.so
# lib/libpcre2-posix.so
# lib/libpcre2-posix.a
# lib/libpcre2-8.a
# lib/libpcre2-32.so
# bin/pcre2-config
# bin/pcre2grep
