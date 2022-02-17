#!/bin/bash

lib='libwebp'
apt='webp'
dsc='Library to encode and decode images in WebP format'
lic='BSD'
src='https://chromium.googlesource.com/webm/libwebp.git'
cfg='ag' # cmake not supporting dual static+shared build
eta='70'

lst_inc='webp/*.h'
lst_lib='libwebp libwebpmux libwebpdemux libwebpdecoder'
lst_bin='webpinfo cwebp webpmux img2webp dwebp'
lst_lic='COPYING PATENTS AUTHORS README'
lst_pc='libwebp.pc libwebpmux.pc libwebpdemux.pc libwebpdecoder.pc'

. xbuilder.sh && start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/webp/types.h
# include/webp/decode.h
# include/webp/demux.h
# include/webp/mux_types.h
# include/webp/mux.h
# include/webp/encode.h
# lib/pkgconfig/libwebp.pc
# lib/pkgconfig/libwebpmux.pc
# lib/pkgconfig/libwebpdemux.pc
# lib/libwebpdemux.a
# lib/libwebp.so
# lib/libwebp.a
# lib/libwebpmux.la
# lib/libwebpdemux.so
# lib/libwebpdemux.la
# lib/libwebpmux.so
# lib/libwebp.la
# lib/libwebpmux.a
# share/man/man1/cwebp.1
# share/man/man1/webpmux.1
# share/man/man1/img2webp.1
# share/man/man1/dwebp.1
# share/man/man1/webpinfo.1
# share/doc/libwebp/PATENTS
# share/doc/libwebp/AUTHORS
# share/doc/libwebp/COPYING
# share/doc/libwebp/README
# bin/webpinfo
# bin/cwebp
# bin/webpmux
# bin/img2webp
# bin/dwebp
