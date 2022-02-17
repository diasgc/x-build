#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   +   .   .   .   +   .   .   .   .   .  static
#  +   +   .   .   .   +   .   .   .   .   .  shared
#  +   +   .   .   .   +   .   .   .   .   .  bin

lib='opencore-amr'
pkg='opencore-amrnb'
apt="${pkg}-dev"
dsc='OpenCORE Adaptive Multi Rate (AMR) speech codec'
lic='Apache-2'
src='https://git.code.sf.net/p/opencore-amr/code'
sty='git'
cfg='ar'
eta='100'
cbk="able-examples"

. xbuilder.sh

start

# Filelist
# --------

# include/opencore-amrnb/interf_dec.h
# include/opencore-amrnb/interf_enc.h
# include/opencore-amrwb/dec_if.h
# include/opencore-amrwb/if_rom.h
# lib/pkgconfig/opencore-amrnb.pc
# lib/pkgconfig/opencore-amrwb.pc
# lib/libopencore-amrwb.la
# lib/libopencore-amrnb.la
# lib/libopencore-amrnb.so
# lib/libopencore-amrnb.a
# lib/libopencore-amrwb.so
# lib/libopencore-amrwb.a
# bin/amrnb-enc
# bin/amrnb-dec
# bin/amrwb-dec
