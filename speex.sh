#!/bin/bash

lib='speex'
dsc='Speex is an audio codec tuned for speech'
lic='BSD'
src='https://gitlab.xiph.org/xiph/speex'
# meson won't build static libs
cfg='ag'
dep='ogg speexdsp'
eta='90'
ac_bin="--disable-binaries|--enable-binaries"

lst_inc='speex/*.h'
lst_lib='libspeex'
lst_bin='speexdec speexenc'
lst_lic='COPYING AUTHORS'
lst_pc='speex.pc'
dev_vrs='1.2.0'

. xbuild

LDFLAGS+=" -lm"

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
