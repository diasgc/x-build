#!/bin/bash

lib='libheif'
dsc='HEIF and AVIF file format decoder and encoder'
lic='LGPL-3.0'
src='https://github.com/strukturag/libheif.git'
dep='libpng libjpeg x265 libde265 aom'
mingw_posix=true

cfg='cmake'
cmake_config='-DWITH_AOM=ON -DWITH_X265=ON -DWITH_DAV1D=OFF -DWITH_LIBDE265=ON -DWITH_RAV1E=OFF -DBUILD_TESTING=OFF'
cmake_bin='WITH_EXAMPLES'

on_config_ndk(){
    LIBS+=" -llog"
}

dev_bra='main'
dev_vrs='1.17.6'
pkg_deb='libheif-dev'
eta='60'

lst_inc='libheif/*.h'
lst_lib='libheif'
lst_bin='heif-convert heif-enc heif-info'
lst_lic='LICENSE AUTHORS'
lst_pc='libheif.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------

# include/libheif/heif_plugin.h
# include/libheif/heif_version.h
# include/libheif/heif_cxx.h
# include/libheif/heif.h
# share/man/man1/heif-info.1
# share/man/man1/heif-convert.1
# share/man/man1/heif-enc.1
# share/mime/packages/avif.xml
# share/mime/packages/heif.xml
# share/thumbnailers/heif.thumbnailer
# lib/libheif.so
# lib/cmake/libheif/libheif-config-version.cmake
# lib/cmake/libheif/libheif-config.cmake
# lib/cmake/libheif/libheif-config-release.cmake
# lib/pkgconfig/libheif.pc
# bin/heif-convert
# bin/heif-enc
# bin/heif-info
