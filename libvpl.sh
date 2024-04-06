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
cfg='cmake'
dep='libva'
eta='0'

cmake_config='-DBUILD_TOOLS=OFF -DTOOLS_ENABLE_X11=OFF 
    -DTOOLS_ENABLE_OPENCL=OFF -DTOOLS_ENABLE_SCREEN_CAPTURE=OFF 
    -DTOOLS_ENABLE_RENDER=OFF -DBUILD_PREVIEW=OFF
    -DBUILD_DISPATCHER_ONEVPL_EXPERIMENTAL=OFF
    -DBUILD_TOOLS_ONEVPL_EXPERIMENTAL=OFF -DINSTALL_EXAMPLE_CODE=OFF'

dev_bra='master'
dev_vrs='2.10'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start