#!/bin/bash

lib='libbs2b'
apt='libbs2b-dev'
dsc='Bauer stereophonic-to-binaural DSP'
lic='MIT'
src='https://github.com/alexmarsev/libbs2b.git'
cfg='ag'
dep='sndfile'
eta='30'

dev_bra='main'
dev_vrs='3.1.0'
stb_bra=''
stb_vrs=''

lst_inc='bs2b/*.h'
lst_lib='libbs2b'
lst_bin='bs2bstream bs2bconvert'
lst_lic='COPYING AUTHORS'
lst_pc='libbs2b.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/bs2b/bs2btypes.h
# include/bs2b/bs2b.h
# include/bs2b/bs2bversion.h
# include/bs2b/bs2bclass.h
# lib/pkgconfig/libbs2b.pc
# lib/libbs2b.so
# lib/libbs2b.a
# lib/libbs2b.la
# share/doc/libbs2b/AUTHORS
# share/doc/libbs2b/COPYING
# bin/bs2bstream
# bin/bs2bconvert
