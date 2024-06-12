#!/bin/bash

lib='cpu_features'
dsc='A cross platform C99 library to get cpu features at runtime'
lic='Apache-2.0'
src='https://github.com/google/cpu_features.git'
cfg='cmake'
pkg='cpu_features'

patch='cpu_feature-01' # patch on CMakeLists.txt and ndk_compat/CMakeLists.txt
cmake_bin='BUILD_STATIC_LIBS'
cmake_config='-DBUILD_GMOCK=OFF -DBUILD_TESTING=OFF -DINSTALL_GTEST=OFF'

lst_inc='ndk_compat/cpu-features.h cpu_features/*.h'
lst_lib='libcpu_features libndk_compat'
lst_bin='list_cpu_features'
lst_lic='LICENSE'
lst_pc='cpu_features.pc'

dev_bra='master'
dev_vrs='0.6.0'
pkg_deb='libcpu-features-dev'
eta='0'

on_create_pc(){
    build_pkgconfig --libs=-lcpufeatures
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ndk_compat/cpu-features.h
# include/cpu_features/cpuinfo_aarch64.h
# include/cpu_features/cpu_features_cache_info.h
# include/cpu_features/cpu_features_macros.h
# lib/pkgconfig/cpu_features.pc
# lib/libcpu_features.so
# lib/libcpu_features.a
# lib/cmake/CpuFeaturesNdkCompat/CpuFeaturesNdkCompatTargets.cmake
# lib/cmake/CpuFeaturesNdkCompat/CpuFeaturesNdkCompatConfig.cmake
# lib/cmake/CpuFeaturesNdkCompat/CpuFeaturesNdkCompatTargets-release.cmake
# lib/cmake/CpuFeaturesNdkCompat/CpuFeaturesNdkCompatConfigVersion.cmake
# lib/cmake/CpuFeatures/CpuFeaturesConfigVersion.cmake
# lib/cmake/CpuFeatures/CpuFeaturesTargets.cmake
# lib/cmake/CpuFeatures/CpuFeaturesConfig.cmake
# lib/cmake/CpuFeatures/CpuFeaturesTargets-release.cmake
# lib/libndk_compat.a
# lib/libndk_compat.so
# share/doc/cpu_features/LICENSE
# bin/list_cpu_features
