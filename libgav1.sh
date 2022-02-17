#!/bin/bash

lib='libgav1'
apt='libgav1-dev'
dsc='Main profile (0) & High profile (1) compliant AV1 decoder'
lic='BSD'
src='https://chromium.googlesource.com/codecs/libgav1.git'
cfg='cmake'
eta='181'

dev_bra='main'
dev_vrs='1.17.0'
stb_bra=''
stb_vrs=''

lst_inc='gav1/*.h'
lst_lib='libgav1'
lst_bin='gav1_decode'
lst_lic='LICENSE AUTHORS'
lst_pc='libgav1.pc'

. xbuilder.sh

source_config(){
	git_clone https://github.com/abseil/abseil-cpp.git third_party/abseil-cpp
}

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/gav1/decoder.h
# include/gav1/decoder_buffer.h
# include/gav1/status_code.h
# include/gav1/frame_buffer.h
# include/gav1/version.h
# include/gav1/symbol_visibility.h
# include/gav1/decoder_settings.h
# lib/pkgconfig/libgav1.pc
# lib/libgav1.so
# lib/libgav1.a
# share/doc/libgav1/LICENSE
# share/doc/libgav1/AUTHORS
# share/cmake/libgav1-config.cmake
# bin/gav1_decode
