#!/bin/bash

lib='charls'
apt='libcharls-dev'
dsc='C++ JPEG-LS (ISO/IEC 14495-1 / ITU-T.87) library implementation.'
lic='BSD-3c'
src='https://github.com/team-charls/charls.git'
cfg='cmake'
eta='15'
cbk="CHARLS_BUILD_SAMPLES"
mki='install/strip'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='charls/*.h'
lst_lib='libcharls'
lst_bin=''
lst_lic='LICENSE.md'
lst_pc='charls.pc'

. xbuilder.sh

# unsupported dual static shared build
# todo patch src/CMakeLists.txt
start

# cpu av8 av7 x86 x64
# NDK  P   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/charls/charls_jpegls_decoder.h
# include/charls/api_abi.h
# include/charls/annotations.h
# include/charls/jpegls_error.h
# include/charls/public_types.h
# include/charls/charls.h
# include/charls/charls_jpegls_encoder.h
# include/charls/version.h
# lib/pkgconfig/charls.pc
# lib/cmake/charls/charlsConfig.cmake
# lib/cmake/charls/charlsConfig-release.cmake
# lib/libcharls.so
