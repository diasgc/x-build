#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='librtmp'
dsc='rtmpdump is a toolkit for RTMP streams. All forms of RTMP are supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://.'
lic='GLP-2.0'
git='git://git.ffmpeg.org/rtmpdump'
dep='zlib openssl'

cfg='cmake'
cmake_file='librtmp.cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_EXECUTABLES'

dev_vrs='2.4.0'
pkg_deb='librtmp-dev'
eta='0'

lst_inc='librtmp/amf.h
 librtmp/http.h
 librtmp/log.h
 librtmp/rtmp.h'
lst_lib='librtmp'
lst_bin='rtmpdump
 rtmpgw
 rtmpsrv
 rtmpsuck'
lst_pc='librtmp.pc'


. xbuild && start

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
