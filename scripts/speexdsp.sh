#!/bin/bash

lvr='1.2.0'
lib='speexdsp'
apt='libspeexdsp-dev'
dsc='Speexdsp is a speech processing library that goes along with the Speex codec'
lic='BSD'
src='https://github.com/xiph/speexdsp.git'
#cfg='ag'
eta='62'

lst_inc='speex/*.h'
lst_lib='libspeexdsp'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='speexdsp.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/speex/speexdsp_config_types.h
# include/speex/speex_echo.h
# include/speex/speexdsp_types.h
# include/speex/speex_preprocess.h
# include/speex/speex_resampler.h
# include/speex/speex_jitter.h
# lib/pkgconfig/speexdsp.pc
# lib/libspeexdsp.a
# lib/libspeexdsp.so
# lib/libspeexdsp.la
# share/doc/speexdsp/manual.pdf
# share/doc/speexdsp/AUTHORS
# share/doc/speexdsp/COPYING
