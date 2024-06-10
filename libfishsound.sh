#!/bin/bash

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libfishsound'
pkg='fishsound'
pkg_deb='libfishsound1-dev'
dsc='Simple API that wraps Xiph.Org audio codecs'
lic='BSD-2c'
src='https://gitlab.xiph.org/xiph/libfishsound.git'
cfg='ag'
dep='ogg vorbis speex flac sndfile'
eta='20'

ac_nosysroot=true

. xbuild && start

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
