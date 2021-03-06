#!/bin/bash

lib='vvdec'
pkg='libvvdec'
dsc='Fraunhofer Versatile Video Decoder (VVdeC)'
lic='LGPL-2.1'
src='https://github.com/fraunhoferhhi/vvdec.git'
cfg='cmake'
eta='480'
cmake_bin="BUILD_TOOLS"
cmake_static="BUILD_STATIC_LIBS"

lst_inc='vvenc/*.h'
lst_lib='libvvenc'
lst_bin='vvencapp vvencFFapp'
lst_lic='AUTHORS.md LICENSE.txt'
lst_pc='libvvenc.pc'

dev_bra='master'
dev_vrs='1.4.0'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/vvdec/LICENSE.txt
# share/doc/vvdec/AUTHORS.md
# lib/pkgconfig/libvvdec.pc
# lib/cmake/vvdec/vvdecTargets-shared-release.cmake
# lib/cmake/vvdec/vvdecTargets-shared.cmake
# lib/cmake/vvdec/vvdecConfigVersion.cmake
# lib/cmake/vvdec/vvdecConfig.cmake
# bin/vvdecapp
# lib/libvvdec.so
# include/vvdec/vvdecDecl.h
# include/vvdec/vvdec.h
# include/vvdec/sei.h
# include/vvdec/version.h
# lib/libvvdec.a
# 

# Patch 01 on source/Lib/vvdec/CMakeLists.txt and
# Patch 02 on cmake/modules/vvdecInstall.cmake to support dual static/shared build
# Patch 03 on source/Lib/vvdec/vvdecimpl.cpp to fix malloc_trim(0) error on android
<<'LZS_PATCH'
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
LZS_PATCH
