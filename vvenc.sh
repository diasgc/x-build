#!/bin/bash

lib='vvenc'
pkg='libvvenc'
dsc='Fraunhofer Versatile Video Encoder'
lic='LGPL-2.1'
src='https://github.com/fraunhoferhhi/vvenc.git'
src_rel=false
#patch="vvenc-01"

cfg='cmake'

lst_inc='vvenc/version.h
 vvenc/vvencDecl.h
 vvenc/vvenc.h
 vvenc/vvencCfg.h'
lst_lib='libvvenc'
lst_bin='vvencapp vvencFFapp'
lst_lic='AUTHORS.md LICENSE.txt'
lst_pc='libvvenc.pc'

dev_bra='master'
dev_vrs='1.12.0'
pkg_deb=''
eta='1184'

on_config_gnu(){
    # debian pkg llvm-18.1.3: missing LLVMgold.so. Workaround: disable lto
    $host_clang && test -f "/usr/lib/LLVMgold.so" || cmake_config+=' -DVVENC_ENABLE_LINK_TIME_OPT=OFF' 
    return 0
}


. xbuild && start

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
