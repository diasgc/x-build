#!/bin/bash

lib='codec2'
apt='libcodec2-0.9'
dsc='A speech codec for 2400 bit/s and below'
lic='LGPL-2.1'
src='https://github.com/drowe67/codec2.git'
cfg='cmake'
eta='80'
patch='codec2-01' # patch generate_codebook for cross compiling
cmake_static="BUILD_STATIC_LIBS"
cmake_config="-DUNITTEST=OFF -DLPCNET=OFF"

dev_bra='master'
dev_vrs='1.2.0'
stb_bra=''
stb_vrs=''

lst_inc='codec2/*.h'
lst_lib='libcodec2'
lst_bin=''
lst_lic='COPYING'
lst_pc='codec2.pc'

on_config(){
    unset LDFLAGS
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++. ++. ++. ++. clang
# GNU  .   .   .   .  gcc
# WIN ++.  .   .   .  clang/gcc

# Filelist
# --------
# include/codec2/modem_stats.h
# include/codec2/codec2_cohpsk.h
# include/codec2/fsk.h
# include/codec2/codec2_fdmdv.h
# include/codec2/codec2_ofdm.h
# include/codec2/comp.h
# include/codec2/codec2_fifo.h
# include/codec2/version.h
# include/codec2/freedv_api.h
# include/codec2/codec2.h
# include/codec2/codec2_fm.h
# include/codec2/reliable_text.h
# lib/pkgconfig/codec2.pc
# lib/libcodec2.a
# lib/libcodec2.so
# lib/cmake/codec2/codec2-config.cmake
# lib/cmake/codec2/codec2-config-release.cmake