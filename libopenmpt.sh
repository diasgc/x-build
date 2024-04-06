#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libopenmpt'
dsc='a library to render tracker music'
lic='BSD-3c'
src='https://github.com/OpenMPT/openmpt.git'
cfg='ar'
dep='ogg vorbis flac sndfile'
eta='0'

ac_config='--without-mpg123 --without-portaudio --without-portaudiocpp --without-pulseaudio --without-sdl2 --disable-tests'

ac_bin='--disable-examples|--enable-examples'

dev_bra='master'
dev_vrs='0.7.6'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

. xbuild

# get the latest release
libopenmpt_latest=$(git ls-remote --tags --sort "v:refname" ${src} | grep 'libopenmpt' | tail -n1 | rev | awk -v FS='/' '{print $1}' | rev)
vrs=${libopenmpt_latest/libopenmpt\-/}
# change source for autotools build
src="https://lib.openmpt.org/files/libopenmpt/src/${libopenmpt_latest}+release.autotools.tar.gz"

start