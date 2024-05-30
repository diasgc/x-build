#!/bin/bash

lib='libjpeg'
apt="${lib}-dev"
dsc='JPEG image codec that uses SIMD instructions'
lic='BSD'
src='https://github.com/libjpeg-turbo/libjpeg-turbo.git'
cfg='cmake'
eta='78'
cmake_static="ENABLE_STATIC"
cmake_shared="ENABLE_SHARED"
mki='install/strip'

cmake_config="-DWITH_JPEG8=ON -DWITH_JPEG7=ON -DWITH_DOCS=OFF -DWITH_MAN=OFF"

dev_vrs='3.0.4'
lst_inc='jerror.h jconfig.h jpeglib.h jmorecfg.h turbojpeg.h'
lst_lib='libjpeg libturbojpeg'
lst_bin='rdjpgcom jpegtran wrjpgcom djpeg tjbench cjpeg'
lst_lic='LICENSE.md'
lst_pc='libjpeg.pc libturbojpeg.pc'

extraOpts(){
  case $1 in
    --jpeg7) cmake_config+=" -DWITH_JPEG7=ON";;
    --jpeg8) cmake_config+=" -DWITH_JPEG8=ON";;
    --12bit) cmake_config+=" -DWITH_12BIT=ON";;
  esac
}

#test $host_arm && $host_mingw && cmake_definitions+=(-mfloat-abi=softfp)

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/jerror.h
# include/jconfig.h
# include/jpeglib.h
# include/jmorecfg.h
# include/turbojpeg.h
# lib/pkgconfig/libjpeg.pc
# lib/pkgconfig/libturbojpeg.pc
# lib/libturbojpeg.a
# lib/cmake/libjpeg-turbo/libjpeg-turboTargets-release.cmake
# lib/cmake/libjpeg-turbo/libjpeg-turboConfig.cmake
# lib/cmake/libjpeg-turbo/libjpeg-turboConfigVersion.cmake
# lib/cmake/libjpeg-turbo/libjpeg-turboTargets.cmake
# lib/libjpeg.so
# lib/libturbojpeg.so
# lib/libjpeg.a
# share/doc/libjpeg/LICENSE.md
# bin/rdjpgcom
# bin/jpegtran
# bin/wrjpgcom
# bin/djpeg
# bin/tjbench
# bin/cjpeg
