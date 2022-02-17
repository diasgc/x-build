#!/bin/bash

lib='samplerate'
dsc='An audio Sample Rate Conversion library'
lic='BSD'
src='https://github.com/libsndfile/libsamplerate.git'
cfg='ag'
dep='sndfile fftwf'
pkg='samplerate'
eta='54'

#cbk="LIBSAMPLERATE_EXAMPLES"
dev_bra='master'
dev_vrs='0.2.2'
stb_bra='tags/0.2.2'
stb_vrs='0.2.2'

lst_inc='samplerate.h'
lst_lib='libsamplerate'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='samplerate.pc'

. xbuilder.sh

cmake_config="-DBUILD_TESTING=OFF -DLIBSAMPLERATE_EXAMPLES=OFF"

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/samplerate.h
# lib/pkgconfig/samplerate.pc
# lib/libsamplerate.so
# lib/libsamplerate.la
# lib/libsamplerate.a
# share/doc/samplerate/AUTHORS
# share/doc/samplerate/COPYING
# share/doc/libsamplerate/api_full.md
# share/doc/libsamplerate/bugs.md
# share/doc/libsamplerate/license.md
# share/doc/libsamplerate/SRC.png
# share/doc/libsamplerate/quality.md
# share/doc/libsamplerate/api_callback.md
# share/doc/libsamplerate/api_simple.md
# share/doc/libsamplerate/history.md
# share/doc/libsamplerate/api.md
# share/doc/libsamplerate/win32.md
# share/doc/libsamplerate/download.md
# share/doc/libsamplerate/faq.md
# share/doc/libsamplerate/lists.md
# share/doc/libsamplerate/SRC.css
# share/doc/libsamplerate/api_misc.md
# share/doc/libsamplerate/index.md
