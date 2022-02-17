#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  -   .   .   .   .   .   .   .   .   .   .  bin

lib='libmodplug'
apt="${lib}-dev"
dsc='The ModPlug mod file playing library.'
lic='Public'
src='https://github.com/Konstanty/libmodplug.git'
sty='git'
cfg='ar'
eta='40'

. xbuilder.sh

start

# Filelist
# --------
# include/libmodplug/stdafx.h
# include/libmodplug/modplug.h
# include/libmodplug/it_defs.h
# include/libmodplug/sndfile.h
# lib/pkgconfig/libmodplug.pc
# lib/libmodplug.la
# lib/libmodplug.so
# lib/libmodplug.a
