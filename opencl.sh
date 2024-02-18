#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='opencl'
dsc='Khronos OpenCL-SDK'
pkg='OpenCL'
lic='Apache-2.0'
src='https://github.com/KhronosGroup/OpenCL-SDK.git'
src_opt='--recursive'
cfg='cmake'
eta='0'

lst_inc='CL/*.h CL/*.hpp'
lst_lib='libOpenC'
lst_bin=''
lst_pc='OpenCL.pc OpenCL-Headers.pc OpenCL-CLHPP.pc'

dev_vrs='3.0'

cmake_config='-DOPENCL_SDK_BUILD_UTILITY_LIBRARIES=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF \
              -DENABLE_OPENCL_LAYERINFO=ON -DENABLE_OPENCL_LAYERS=ON -DOPENCL_HEADERS_BUILD_CXX_TESTS=ON \
              -DTHREADS_PREFER_PTHREAD_FLAG=ON'

. xbuild

start