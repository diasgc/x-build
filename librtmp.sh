#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='librtmp'
dsc='rtmpdump is a toolkit for RTMP streams. All forms of RTMP are supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://.'
lic='GLP-2.0'
src='git://git.ffmpeg.org/rtmpdump' sty='git'
cfg='cmake'
dep='zlib openssl'
eta='0'

cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_EXECUTABLES'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild

start

# patch 01 to create CMakeLists.txt supporting dual static/shared build and pkgconfig file
# options: BUILD_STATIC_LIBS, BUILD_EXECUTABLES, INSTALL_DOCS
<<'LZS_PATCH'
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
pcP5j2NubWQ3N7bu3dqUIOvqA6BBAA
LZS_PATCH


# Filelist
# --------
# bin/rtmpdump
# bin/rtmpgw
# bin/rtmpsrv
# bin/rtmpsuck
# include/librtmp/amf.h
# include/librtmp/http.h
# include/librtmp/log.h
# include/librtmp/rtmp.h
# lib/librtmp.a
# lib/librtmp.so
# lib/pkgconfig/librtmp.pc
# share/doc/librtmp/COPYING
# share/doc/rtmpdump/COPYING
# share/doc/rtmpdump/README
# share/man/man1/rtmpdump.1
# share/man/man1/rtmpdump.1.html
# share/man/man3/librtmp.3
# share/man/man3/librtmp.3.html
# share/man/man8/rtmpgw.8
# share/man/man8/rtmpgw.8.html
