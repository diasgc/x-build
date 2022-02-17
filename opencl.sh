#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='opencl'
dsc='Khronos OpenCL-Headers'
lic='Apache-2.0'
src='https://github.com/KhronosGroup/OpenCL-Headers.git'
cfg='cmake'
eta='0'
#pc_llib='-lOpenCL'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# include/CL/cl_gl_ext.h
# include/CL/cl_ext.h
# include/CL/cl_d3d10.h
# include/CL/cl_half.h
# include/CL/cl_platform.h
# include/CL/cl_ext_intel.h
# include/CL/cl_version.h
# include/CL/cl_egl.h
# include/CL/cl_layer.h
# include/CL/cl.h
# include/CL/cl_dx9_media_sharing_intel.h
# include/CL/cl_va_api_media_sharing_intel.h
# include/CL/cl_icd.h
# include/CL/cl_dx9_media_sharing.h
# include/CL/cl_gl.h
# include/CL/opencl.h
# include/CL/cl_d3d11.h
# share/cmake/OpenCLHeaders/OpenCLHeadersConfig.cmake
# share/cmake/OpenCLHeaders/OpenCLHeadersConfigVersion.cmake
# share/cmake/OpenCLHeaders/OpenCLHeadersTargets.cmake
