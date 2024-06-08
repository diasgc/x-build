#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .  +++ clang/gcc

lib='uchardet'
dsc='an encoding detector library'
lic='GPL-2'
src='https://gitlab.freedesktop.org/uchardet/uchardet.git'
cfg='cmake'
cmake_bin="BUILD_BINARY"
WFLAGS='-Wno-unused-const-variable'

lst_inc='uchardet/uchardet.h'
lst_lib='libuchardet'
lst_bin='uchardet'
dev_vrs='0.0.8'
eta='10'



#$host_arm && cmake_config+=" -DCHECK_SSE2=OFF" || cmake_config+=" -DCHECK_SSE2=ON"

. xbuild && start

# Filelist
# --------

# include/uchardet/uchardet.h
# lib/libuchardet.a
# lib/pkgconfig/uchardet.pc
# lib/libuchardet.so
# share/man/man1/uchardet.1
# bin/uchardet
