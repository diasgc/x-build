#!/bin/bash

lib='opus'
dsc='Opus is a codec for interactive speech and audio transmission over the Internet'
lic='BSD'
src='https://github.com/xiph/opus.git'
dep='ogg'

cfg='cmake'
cmake_bin='OPUS_BUILD_PROGRAMS'

dev_bra='master'
dev_vrs='1.4'
pkg_deb='libopus-dev'
eta='60'

lst_inc='opus/opus_projection.h
 opus/opus.h
 opus/opus_multistream.h
 opus/opus_types.h
 opus/opus_defines.h'
lst_lib='libopus'
lst_bin=''
lst_lic='LICENSE_PLEASE_READ.txt COPYING AUTHORS'
lst_pc='opus.pc'

. xbuild && start

#$build_bin && am_config+=' --enable-extra-programs' && meson_config+=' -Dextra-programs=enabled'
#am_config="--disable-doc"
#meson_config='-Dtests=disabled -Ddocs=disabled'

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
