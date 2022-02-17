#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  X   X   .   .   .   .   X   X   X   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='vvc'
dsc='VVC VTM reference software'
lic='LGPL-2.1'
src='https://vcgit.hhi.fraunhofer.de/jvet/VVCSoftware_VTM.git'
# https://github.com/OpenVVC/VVCSoftware_VTM.git'
sty='git'
cfg='cm'
pkg='vvc'
eta='480'
cbk="BUILD_TOOLS"
mkinstall='all'

. xbuilder.sh

case $arch in
  aarch64*|arm*) doErr "VVC not available for arm archs";;
esac

source_patch(){
  sed -i "s|5.3|$xv_x86_mingw|g" cmake/CMakeBuild/cmake/toolchains/i686-w64-mingw32-gcc-posix-ubuntu1604.cmake
  sed -i "s|5.3|$xv_x64_mingw|g" cmake/CMakeBuild/cmake/toolchains/x86_64-w64-mingw32-gcc-posix-ubuntu1604.cmake
}

build_clean(){
  case $arch in
    i686-w64-mingw32)   export cmake_toolchain_file="${dir_src}/cmake/CMakeBuild/cmake/toolchains/$arch-gcc-posix-ubuntu1604.cmake" mkf="$mkf toolset=gcc";;
    x86_64-w64-mingw32) export cmake_toolchain_file="${dir_src}/cmake/CMakeBuild/cmake/toolchains/$arch-gcc-posix-ubuntu1604.cmake" mkf="all toolset=gcc";;
  esac
}

start
