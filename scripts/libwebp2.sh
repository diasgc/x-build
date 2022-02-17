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
cmake_path='lib/wp2/cmake'
. xbuilder.sh
CFG="-DWP2_BUILD_TESTS=OFF"

# Default CMake Options:
# -DAOM_BUILD_PATH
# -DAOM_SRC_PATH
# -DAVIF_BUILD_PATH
# -DAVIF_SRC_PATH
# -DLIBGAV1_BUILD_PATH
# -DLIBGAV1_SRC_PATH
# -DSJPEG_INSTALL_PATH
# -DWP2_BUILD_EXAMPLES               ON
# -DWP2_BUILD_EXTRAS                 ON
# -DWP2_BUILD_SWIG_PY                OFF
# -DWP2_BUILD_TESTS                  ON
# -DWP2_BUILD_WITH_CLANG_TIDY        OFF
# -DWP2_BUILD_WP2_JS                 OFF
# -DWP2_ENABLE_ANS_CHECK             OFF
# -DWP2_ENABLE_ANS_DEEP_CHECK        OFF
# -DWP2_ENABLE_BITTRACE              OFF
# -DWP2_ENABLE_CONTEXT_SWITCH        AUTO
# -DWP2_ENABLE_SIMD                  ON
# -DWP2_ENABLE_TESTS                 ON
# -DWP2_ENABLE_TEST_HTTP_SERVER      OFF
# -DWP2_ENABLE_TRACE                 OFF
# -DWP2_HAVE_AOM_DBG                 OFF
# -DWP2_REDUCED                      OFF
export WFLAGS='-Wno-error,-Wunused-but-set-variable'
unset CSH
$host_ndk && CFG="-DWP2_ANDROID_NDK_PATH=${ANDROID_NDK_HOME}"

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
