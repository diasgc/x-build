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

on_config(){
    $host_mingw || cmake_config+=' -DPCRE2_STATIC_PIC=ON'
}

. xbuild && start

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
