#!/bin/bash

lvr='1.2.0'
lib='speex'
dsc='Speex is an audio codec tuned for speech'
lic='BSD'
src='https://github.com/xiph/speex.git'
#cfg='ag'
dep='ogg speexdsp'
eta='90'
cbk="able-binaries"

lst_inc='speex/*.h'
lst_lib='libspeex'
lst_bin='speexdec speexenc'
lst_lic='COPYING AUTHORS'
lst_pc='speex.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/speex/speex_header.h
# include/speex/speex_callbacks.h
# include/speex/speex.h
# include/speex/speex_bits.h
# include/speex/speex_stereo.h
# include/speex/speex_config_types.h
# include/speex/speex_types.h
# lib/pkgconfig/speex.pc
# lib/libspeex.a
# lib/libspeex.la
# lib/libspeex.so
# share/man/man1/speexenc.1
# share/man/man1/speexdec.1
# share/doc/speex/manual.pdf
# share/doc/speex/AUTHORS
# share/doc/speex/COPYING
# share/aclocal/speex.m4
# bin/speexdec
# bin/speexenc
