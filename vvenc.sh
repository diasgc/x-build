#!/bin/bash

lib='vvenc'
pkg='libvvenc'
dsc='Fraunhofer Versatile Video Encoder'
lic='LGPL-2.1'
src='https://github.com/fraunhoferhhi/vvenc.git'
cfg='cmake'
eta='560'

lst_inc='vvenc/*.h'
lst_lib='libvvenc'
lst_bin='vvencapp vvencFFapp'
lst_lic='AUTHORS.md LICENSE.txt'
lst_pc='libvvenc.pc'

dev_bra='master'
dev_vrs='1.11.1'

on_config(){
    # native clang llvm-18: missing LLVMgold.so. Workaround:_ disable lto
    $host_clang && test "$host_sys" = "linux" && test -f ${SYSROOT}/lib/LLVMgold.so || cmake_config+=' -DVVENC_ENABLE_LINK_TIME_OPT=OFF' 
    return 0
}


start && . xbuild

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .  +++ gcc
# WIN +++  .   .   .  clang/gcc

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
