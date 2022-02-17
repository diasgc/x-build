#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  -   .   .   .   .   .   .   .   .   .   .  bin

lib='libfishsound'
pkg='fishsound'
apt='libfishsound1-dev'
dsc='Simple API that wraps Xiph.Org audio codecs'
lic='BSD-2c'
src='https://gitlab.xiph.org/xiph/libfishsound.git'
sty='git'
cfg='ag'
dep='ogg vorbis speex flac sndfile'
eta='20'

. xbuilder.sh

unset SYSROOT
start

# Filelist
# --------

# include/fishsound/fishsound.h
# include/fishsound/decode.h
# include/fishsound/comments.h
# include/fishsound/deprecated.h
# include/fishsound/constants.h
# include/fishsound/encode.h
# lib/pkgconfig/fishsound.pc
# lib/libfishsound.la
# lib/libfishsound.so
# lib/libfishsound.a
