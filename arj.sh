#!/bin/bash

lib='arj'
dsc='Open Source ARJ archiver'
lic='GLP-2.0'
src='http://deb.debian.org/debian/pool/main/a/arj/arj_3.10.22.orig.tar.gz'
#src='https://git.code.sf.net/p/arj/git'
cfg='cmake'
eta='60'
cmake_cmakelists='arj.cmake'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc