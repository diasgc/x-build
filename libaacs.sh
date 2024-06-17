#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   F.. ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libaacs'
pkg_deb="${lib}-dev"
dsc='Cross-platform open-source implementation of the AACS specification'
lic='LGPL-2.1'
src='https://code.videolan.org/videolan/libaacs.git'
cfg='ar'

tls='flex'
dep='libgcrypt'
mki='install-strip'
mkc='distclean'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING README.md'
lst_pc='libaacs.pc'
eta='10'

on_config(){
    am_config="--with-libgcrypt-prefix=${dir_install} --with-libgpg-error-prefix=${dir_install}"
    export YACC='byacc' YFLAGS='--update'
}

. xbuild && start