#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
# -/+  .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

# ISSUES
#  - cannot build both static and shared
#  - no pkg-config created

lib='libwebp2'
dsc='WebP 2 is the successor of the WebP image format'
lic='TEST'
src='https://chromium.googlesource.com/codecs/libwebp2.git'
cfg='cmake'
#dep='aom libavif libjpeg'
cmake_path='lib/wp2/cmake'

. xbuild

cmake_config="-DWP2_BUILD_EXAMPLES=OFF -DWP2_ENABLE_TESTS=OFF -DWP2_BUILD_EXTRAS=OFF"

start

# Filelist
# --------
# include/wp2/decode.h
# include/wp2/base.h
# include/wp2/format_constants.h
# include/wp2/debug.h
# include/wp2/encode.h
# lib/libcpufeatures.a
# lib/libwebp2.so
# lib/wp2/cmake/wp2Config.cmake
# lib/wp2/cmake/wp2ConfigVersion.cmake
# lib/wp2/cmake/wp2Targets-release.cmake
# lib/wp2/cmake/wp2Targets.cmake
# share/man/man1/dwp2.1
# share/man/man1/cwp2.1
# bin/dwp2
# bin/cwp2
