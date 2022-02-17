#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='openmpt'
dsc='a library to render tracker music'
lic='BSD-3c'
src='https://github.com/OpenMPT/openmpt.git'
cfg='ar'
dep='ogg vorbis flac sndfile'
eta='0'
config_dir="build/autotools"

ac_config='--without-mpg123  --without-portaudio --without-portaudiocpp --without-pulseaudio --without-sdl2 --disable-tests'

ac_bin='--disable-examples|--enable-examples'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

. xbuilder.sh

source_config(){
    cd build/autotools
    autoreconf -fi 2>&1 >/dev/null
    cd ../..
}

start