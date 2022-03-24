#!/bin/bash

lib='vvenc'
pkg='libvvenc'
dsc='Fraunhofer Versatile Video Encoder'
lic='LGPL-2.1'
src='https://github.com/fraunhoferhhi/vvenc.git'
cfg='cmake'
eta='560'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='vvenc/*.h'
lst_lib='libvvenc'
lst_bin='vvencapp vvencFFapp'
lst_lic='AUTHORS.md LICENSE.txt'
lst_pc='libvvenc.pc'

dev_bra='master'
dev_vrs='1.3.1'

on_config_arm(){
  cmake_config+=' -DVVENC_ENABLE_X86_SIMD=FALSE -DVVENC_ENABLE_ARM_SIMD=TRUE'
}

. xbuild

start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .  +++ gcc
# WIN +++  .   .   .  clang/gcc


# patch 01 on CMakeLists.txt to support arm build
# patch 02 on source/Lib/apputils/CMakeLists.txt to remove -Werror
# patch 03 on source/Lib/vvenc/CMakeLists.txt to remove -Werror and 
# patch 04 on cmake/modules/vvencInstall.cmake to support dual static/shared config 
# patch 05 on source/Lib/vvenc/vvencimpl.cpp to fix malloc_trim error on android-ndk
<<'LZS_PATCH'
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
H1H0n1n3wAX2DpX1oHeC33wD327yP3P1AA==
LZS_PATCH


# Filelist
# --------
# share/doc/vvenc/LICENSE.txt
# share/doc/vvenc/AUTHORS.md
# bin/vvencFFapp
# bin/vvencapp
# include/vvenc/vvencCfg.h
# include/vvenc/vvenc.h
# include/vvenc/vvencDecl.h
# include/vvenc/version.h
# lib/libvvenc.so
# lib/libvvenc.a
# lib/pkgconfig/libvvenc.pc
# lib/cmake/vvenc/vvencTargets-static-release.cmake
# lib/cmake/vvenc/vvencTargets-static.cmake
# lib/cmake/vvenc/vvencTargets-shared-release.cmake
# lib/cmake/vvenc/vvencTargets-shared.cmake
# lib/cmake/vvenc/vvencConfigVersion.cmake
# lib/cmake/vvenc/vvencConfig.cmake
