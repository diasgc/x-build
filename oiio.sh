#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='oiio'
dsc='Reading, writing, and processing images in a wide variety of file formats, using a format-agnostic API, aimed at VFX applications'
lic='BSD-3c'
src='https://github.com/OpenImageIO/oiio.git'
url='openimageio.readthedocs.org'
dep='boost'
cfg='cmake'
eta='0'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild

cmake_config="-DBoost_NO_WARN_NEW_VERSIONS=ON"
$host_arm32 || cmake_config+=' -DUSE_SIMD=ON'
start
