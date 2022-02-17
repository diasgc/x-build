#!/bin/bash

lib='openjpeg'
rel='2.4.0'
dev='2.5.0'
apt='libopenjp2-7-dev'
pkg='libopenjp2'
dsc='OpenJPEG is an open-source JPEG 2000 codec written in C language.'
lic='BSD-2c'
spdx_id='BSD-2-Clause'
src='https://github.com/uclouvain/openjpeg.git'
cfg='cmake'
dep='lcms2 libtiff libpng'
eta='123'
cbk='BUILD_CODEC'

lst_inc='openjpeg-2.5/*.h'
lst_lib='libopenjp2'
lst_bin='opj_dump opj_decompress opj_compress'
lst_lic='LICENSE AUTHORS'
lst_pc='libopenjp2.pc'

. xbuilder.sh

WFLAGS='-Wno-implicit-const-int-float-conversion'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# issues:
# wa8: lld: error: unable to find library -ltiff


# Filelist
# --------
# include/openjpeg-2.5/opj_config.h
# include/openjpeg-2.5/opj_stdint.h
# include/openjpeg-2.5/openjpeg.h
# lib/pkgconfig/libopenjp2.pc
# lib/openjpeg-2.5/OpenJPEGConfig.cmake
# lib/openjpeg-2.5/OpenJPEGTargets.cmake
# lib/openjpeg-2.5/OpenJPEGTargets-release.cmake
# lib/libopenjp2.a
# lib/libopenjp2.so
# share/doc/openjpeg/LICENSE
# bin/opj_dump
# bin/opj_decompress
# bin/opj_compress
