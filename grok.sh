#!/bin/bash

lib='grok'
dsc='Worlds Leading Open Source JPEG 2000 Codec'
lic='Other'
src='https://github.com/GrokImageCompression/grok.git'
cfg='cmake'
eta='35'
pkg_deb="libsigrokdecode-dev"

cmake_config='-DBUILD_TESTING=OFF -DGRK_BUILD_DOC=OFF -DGRK_BUILD_CODEC=OFF' # -Dtiff-docs=OFF -Dtiff-contrib=OFF -Dtiff-tests=OFF -Dtiff-tools=OFF'
#cmake_config+='-DGRK_BUILD_JPEG=OFF -DGRK_BUILD_LCMS2=OFF -DGRK_BUILD_LIBPNG=OFF -DGRK_BUILD_LIBTIFF=OFF'
# (ndk-)clang is not able to compile a simple test program. (libjpeg-turbo)

dev_bra='main'
dev_vrs='3.1.1'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENCE'
lst_pc=''

on_config_ndk(){
    exit_err 'Android not supported'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK F  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# pthread_setaffinity_np fail on ndk builds