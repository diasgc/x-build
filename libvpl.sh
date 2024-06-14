#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libvpl'
pkg='vpl'
dsc='Intel® Video Processing Library (Intel® VPL) dispatcher, tools, and examples'
lic='MIT License'
src="https://github.com/intel/libvpl.git"
dep='libva'

cfg='cmake'
cmake_config='-DBUILD_TOOLS=OFF -DTOOLS_ENABLE_X11=OFF 
    -DTOOLS_ENABLE_OPENCL=OFF -DTOOLS_ENABLE_SCREEN_CAPTURE=OFF 
    -DTOOLS_ENABLE_RENDER=OFF -DBUILD_PREVIEW=OFF
    -DBUILD_DISPATCHER_ONEVPL_EXPERIMENTAL=OFF
    -DBUILD_TOOLS_ONEVPL_EXPERIMENTAL=OFF -DINSTALL_EXAMPLE_CODE=OFF'

dev_bra='master'
dev_vrs='2.10'
pkg_deb='libvpl-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start