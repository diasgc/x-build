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

lst_inc='vvdec/*.h'
lst_lib='libvvdec'
lst_bin='vvdecapp'
lst_lic='AUTHORS.md LICENSE.txt'
lst_pc='libvvdec.pc'

dev_bra='master'
dev_vrs='2.3.0'

. xbuild

#cmake_cxx_flags_release=(-Ofast -flto -g -DNDEBUG)

start

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