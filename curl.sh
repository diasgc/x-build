#!/bin/bash

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='curl'
pkg='libcurl'
dsc='A command line tool and library for transferring data with URL syntax'
lic='Other'
src='https://github.com/curl/curl.git'
cfg='ar'
eta='130'
dep='zlib libzstd brotli openssl'

lst_inc='curl/*.h'
lst_lib='libcurl'
lst_bin='curl curl-config'
lst_lic='COPYING'
lst_pc='libcurl.pc'

. xbuilder.sh

# todo remove manual
ac_config="--with-openssl --disable-manual"

start


# Filelist
# --------
# include/curl/typecheck-gcc.h
# include/curl/multi.h
# include/curl/curl.h
# include/curl/urlapi.h
# include/curl/mprintf.h
# include/curl/stdcheaders.h
# include/curl/options.h
# include/curl/easy.h
# include/curl/curlver.h
# include/curl/system.h
# lib/pkgconfig/libcurl.pc
# lib/libcurl.la
# lib/libcurl.so
# lib/libcurl.a
# share/aclocal/libcurl.m4
# bin/curl-config
# bin/curl
