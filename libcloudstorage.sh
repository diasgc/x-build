#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libcloudstorage'
dsc='A C++  library providing access to files located in various cloud services licensed under GNU LGPLv2.1'
lic='LGPL-2.1'
src='https://code.videolan.org/videolan/libcloudstorage.git'
dep='jsoncpp tinyxml2 libmega libcrypto++ libcurl'

cfg='ac'
cfg_cmd="./bootstrap"
make_install='install-strip'
make_clean='distclean'

dev_bra='master'
dev_vrs=''
pkg_deb="libcloudstorage-dev"
eta='60'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild && start