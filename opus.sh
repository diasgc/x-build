#!/bin/bash

lvr='1.3.1-101-*'
lib='opus'
dsc='Opus is a codec for interactive speech and audio transmission over the Internet'
lic='BSD'
src='https://github.com/xiph/opus.git'
cfg='meson'
dep='ogg'
eta='60'
ac_nopic=true

lst_inc='opus/*.h'
lst_lib='libopus'
lst_bin=''
lst_lic='LICENSE_PLEASE_READ.txt COPYING AUTHORS'
lst_pc='opus.pc'

ac_config="--disable-doc"
meson_cfg='-Dtests=disabled -Ddocs=disabled'

. xbuilder.sh

$build_bin && ac_config+=' --enable-extra-programs' && meson_cfg+=' -Dextra-programs=enabled'

start

# cpu av8 av7 x86 x64
# NDK ++  ++  ++  ++  clang
# GNU ++   .   .   .  gcc
# WIN  F   .   .   .  clang/gcc

# Filelist
# --------
# include/opus/opus_projection.h
# include/opus/opus.h
# include/opus/opus_multistream.h
# include/opus/opus_types.h
# include/opus/opus_defines.h
# lib/pkgconfig/opus.pc
# lib/libopus.a
# lib/libopus.so
# share/doc/opus/LICENSE_PLEASE_READ.txt
# share/doc/opus/AUTHORS
# share/doc/opus/COPYING
