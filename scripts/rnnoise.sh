#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   +   +   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  -   .   .   .   .   .   .   .   .   .   .  bin

lib='rnnoise'
dsc='Recurrent neural network for audio noise reduction'
lic='BSD'
src='https://gitlab.xiph.org/xiph/rnnoise.git'
sty='git'
cfg='ag'
eta='40'
cb0="--disable-examples"
cb1="--enable-examples"

. xbuilder.sh

CFG="--disable-doc"

start

# Filelist
# --------
# include/rnnoise.h
# lib/pkgconfig/rnnoise.pc
# lib/librnnoise.a
# lib/librnnoise.la
# lib/librnnoise.so
# share/doc/rnnoise/AUTHORS
# share/doc/rnnoise/COPYING
# share/doc/rnnoise/README
