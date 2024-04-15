#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='openjph'
dsc='Open-source implementation of JPEG2000 Part-15 (or JPH or HTJ2K)'
lic='BSD 2-Clause Simplified"'
vrs=''
src="https://github.com/aous72/OpenJPH.git"
cfg='cmake'
eta='0'
cmake_bin='OJPH_BUILD_EXECUTABLES'
cmake_config='-DOJPH_BUILD_TESTS=OFF -DOJPH_ENABLE_TIFF_SUPPORT=OFF -DUSE_TIFF=OFFs'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

$host_arm && do_err 'Not available for arm' && exit 1

#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start