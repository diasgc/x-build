#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='openjph'
dsc='Open-source implementation of JPEG2000 Part-15 (or JPH or HTJ2K)'
lic='BSD 2-Clause Simplified"'
src="https://github.com/aous72/OpenJPH.git"

cfg='cmake'
cmake_bin='OJPH_BUILD_EXECUTABLES'
cmake_config='-DOJPH_BUILD_TESTS=OFF -DOJPH_ENABLE_TIFF_SUPPORT=OFF -DUSE_TIFF=OFFs'

on_config_arm(){
    do_err 'Not available for arm' && exit 1
}

dev_bra='master'
dev_vrs=''
pkg_deb='libopenjph-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start