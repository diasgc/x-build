#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  -   .   .   .   .   .   .   .   .   .   .  bin

lib='theora'
apt='libtheora-dev'
dsc='Theora video compression format'
lic='BSD'
src='https://github.com/xiph/theora.git'
cfg='am'
dep='ogg vorbis'
eta='391'

. xbuilder.sh

CFG="--disable-doc --disable-spec --disable-examples --disable-oggtest --disable-vorbistest"


start

# Filelist
# --------
# include/theora/theoraenc.h
# include/theora/theora.h
# include/theora/theoradec.h
# include/theora/codec.h
# lib/pkgconfig/theoraenc.pc
# lib/pkgconfig/theoradec.pc
# lib/pkgconfig/theora.pc
# lib/libtheoraenc.so
# lib/libtheora.la
# lib/libtheoradec.la
# lib/libtheora.so
# lib/libtheora.a
# lib/libtheoradec.a
# lib/libtheoraenc.a
# lib/libtheoraenc.la
# lib/libtheoradec.so
# share/doc/libtheora/color.html
# share/doc/libtheora/draft-ietf-avt-rtp-theora-00.txt
# share/doc/libtheora/draft-ietf-avt-rtp-theora-00.xml
# share/doc/libtheora/doxygen-build.stamp
# share/doc/libtheora/vp3-format.txt
