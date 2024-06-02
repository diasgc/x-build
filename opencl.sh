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

lst_inc='CL/cl_d3d11.h
    CL/cl_dx9_media_sharing.h
    CL/cl_ext_intel.h
    CL/cl_gl.h
    CL/opencl.h
    CL/cl_gl_ext.h
    CL/cl_half.h
    CL/cl.h
    CL/cl_version.h
    CL/cl_va_api_media_sharing_intel.h
    CL/cl_icd.h
    CL/cl_egl.h
    CL/cl_d3d10.h
    CL/cl_dx9_media_sharing_intel.h
    CL/cl_platform.h
    CL/cl_layer.h
    CL/cl_ext.h
    CL/cl_function_types.h
    CL/opencl.hpp
    CL/cl2.hpp
'
lst_lib='libOpenCL'
lst_bin='cllayerinfo'
lst_pc='OpenCL-Headers.pc OpenCL.pc OpenCL-CLHPP.pc'
lst_cmake_dir='share/cmake/OpenCL/ share/cmake/OpenCLHeadersCpp/ share/cmake/OpenCLHeaders/'

dev_vrs='3.0'

cmake_config='-DOPENCL_SDK_BUILD_UTILITY_LIBRARIES=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF'
#cmake_config+=" -DENABLE_OPENCL_LAYERINFO=ON -DENABLE_OPENCL_LAYERS=ON -DOPENCL_HEADERS_BUILD_CXX_TESTS=ON -DTHREADS_PREFER_PTHREAD_FLAG=ON"

on_end(){
    ln -sf "${dir_build}/share/pkgconfig/OpenCL-Headers.pc" "${dir_install_pc}/OpenCL-Headers.pc"
    ln -sf "${dir_build}/share/pkgconfig/OpenCL-CLHPP.pc" "${dir_install_pc}/OpenCL-CLHPP.pc"
}

. xbuild && start