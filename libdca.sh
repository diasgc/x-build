#!/bin/bash

lib='libdca'
dsc='Free library to decode DTS Coherent Acoustics streams'
lic='GLP-2.0'
src='https://code.videolan.org/videolan/libdca.git'
cfg='ar'
eta='0'

dev_bra='master'
dev_vrs='0.0.7'
stb_bra='tags/0.0.7'
stb_vrs='0.0.7'

lst_inc='dts.h dca.h'
lst_lib='libdca'
lst_bin='dcadec extract_dca dtsdec extract_dts'
lst_lic='COPYING AUTHORS'
lst_pc='libdca.pc libdts.pc'

. xbuilder.sh

ndk_assert_h_sys_soundcard

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/dts.h
# include/dca.h
# lib/pkgconfig/libdca.pc
# lib/pkgconfig/libdts.pc
# lib/libdca.la
# lib/libdca.a
# lib/libdca.so
# share/man/man1/extract_dca.1
# share/man/man1/dcadec.1
# share/doc/libdca/AUTHORS
# share/doc/libdca/COPYING
# bin/dcadec
# bin/extract_dca
# bin/dtsdec
# bin/extract_dts
