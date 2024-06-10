#!/bin/bash

lib='libsrt'
pkg='srt'
dsc='Secure Reliable Transport (SRT) is an open source transport technology that optimizes streaming performance across unpredictable networks, such as the Internet.'
lic='MPL-2.0'
src='https://github.com/Haivision/srt.git'
cfg='cmake'
dep='openssl'

dev_bra='master'
dev_vrs='1.5.3'
pkg_deb='libsrt-openssl-dev'
eta='60'

lst_inc='srt/*.h'
lst_lib='libsrt'
lst_bin='srt-live-transmit srt-ffplay srt-tunnel srt-file-transmit'
lst_lic='LICENSE'
lst_pc='srt.pc haisrt.pc'

WFLAGS='-Wno-deprecated-declarations'

on_config(){
    $build_static || cmake_config+=' -DENABLE_STATIC=OFF'
    $build_shared || cmake_config+=' -DENABLE_SHARED=OFF'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/srt/platform_sys.h
# include/srt/udt.h
# include/srt/srt.h
# include/srt/access_control.h
# include/srt/version.h
# include/srt/logging_api.h
# lib/pkgconfig/haisrt.pc
# lib/pkgconfig/srt.pc
# lib/libsrt.so
# lib/libsrt.a
# share/doc/libsrt/LICENSE
# bin/srt-live-transmit
# bin/srt-ffplay
# bin/srt-tunnel
# bin/srt-file-transmit
