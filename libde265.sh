#!/bin/bash

lib='libde265'
dsc='Open h.265 video codec implementation.'
lic='LGPL-3.0'
src='https://github.com/strukturag/libde265.git'

cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_config='-DENABLE_SDL=OFF'

on_config(){
  cmake_config+=" -DDISABLE_SSE=$(bool2str ${host_arm} ON OFF)"
}

lst_inc='libde265/*.h'
lst_lib='liblibde265'
lst_bin='enc265 hdrcopy dec265'
lst_lic='COPYING AUTHORS'
lst_pc='libde265.pc'

dev_bra='main'
dev_vrs='1.0.15'
eta='140'
pkg_deb='libde265-dev'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/libde265/motion.h
# include/libde265/fallback-dct.h
# include/libde265/cabac.h
# include/libde265/deblock.h
# include/libde265/pps.h
# include/libde265/en265.h
# include/libde265/fallback-motion.h
# include/libde265/sei.h
# include/libde265/fallback.h
# include/libde265/image-io.h
# include/libde265/scan.h
# include/libde265/threads.h
# include/libde265/contextmodel.h
# include/libde265/transform.h
# include/libde265/bitstream.h
# include/libde265/sps.h
# include/libde265/vps.h
# include/libde265/slice.h
# include/libde265/md5.h
# include/libde265/alloc_pool.h
# include/libde265/image.h
# include/libde265/sao.h
# include/libde265/vui.h
# include/libde265/decctx.h
# include/libde265/refpic.h
# include/libde265/de265.h
# include/libde265/configparam.h
# include/libde265/quality.h
# include/libde265/de265-version.h
# include/libde265/nal.h
# include/libde265/nal-parser.h
# include/libde265/intrapred.h
# include/libde265/visualize.h
# include/libde265/acceleration.h
# include/libde265/dpb.h
# include/libde265/util.h
# lib/pkgconfig/libde265.pc
# lib/cmake/libde265/libde265ConfigVersion.cmake
# lib/cmake/libde265/libde265Config-release.cmake
# lib/cmake/libde265/libde265Config.cmake
# lib/liblibde265.so
# lib/liblibde265.a
# share/doc/libde265/AUTHORS
# share/doc/libde265/COPYING
# bin/enc265
# bin/hdrcopy
# bin/dec265
