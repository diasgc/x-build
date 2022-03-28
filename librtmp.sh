#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='librtmp'
dsc='rtmpdump is a toolkit for RTMP streams. All forms of RTMP are supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://.'
lic='GLP-2.0'
src='git://git.ffmpeg.org/rtmpdump' sty='git'
cfg='make'
dep='zlib openssl'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild

export XCFLAGS=$CFLAGS XLDFLAGS=$LDFLAGS INC=$CPPFLAGS
mkf="prefix=${dir_install}"
mki='install'
mkc='clean'

source_patch(){
    sed -i 's/^CC=/# &/g;s/^LD=/# &/g;s/^AR=/# &/g' Makefile librtmp/Makefile
}

start

<<'CMakeLists.txt'
cmake_minimum_required(VERSION 3.5)
project(rtmp LANGUAGES C VERSION 2.4.0)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" ON)
option(BUILD_EXECUTABLES "Build executables" ON)

find_package(PkgConfig REQUIRED)
pkg_check_module(OPENSSL)
find_package(OpenSSL REQUIRED)
if(OpenSSL_FOUND)
    list(APPEND tlinks ${OpenSSL_LIBRARIES})
endif()
find_package(GnuTLS REQUIRED)
if(GnuTLS_FOUND)
    list(APPEND tlinks ${GnuTLS_LIBRARIES})
endif()
list(APPEND tlinks z)
message(STATUS "link libs: ${tlinks}")
CMakeLists.txt