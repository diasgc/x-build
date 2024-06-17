#!/bin/bash

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='libraw'
dsc='LibRaw is a library for reading RAW files from digital cameras'
lic='Other'
src="https://github.com/LibRaw/LibRaw.git"
dep='libjpeg lcms2 zlib jasper'

cfg='ar'
am_config='--disable-examples --disable-openmp'

dev_bra='master'
dev_vrs='0.21.2'
pkg_deb='libraw-dev'
eta='0'

lst_inc='libraw/libraw_alloc.h \
    libraw/libraw_const.h \
    libraw/libraw_datastream.h \
    libraw/libraw_internal.h \
    libraw/libraw_types.h \
    libraw/libraw_version.h'
lst_lib='libraw libraw_r'
lst_bin=''
lst_lic='COPYRIGHT LICENSE.CDDL LICENSE.LGPL'
lst_pc='libraw.pc libraw_r.pc'

. xbuild && start

