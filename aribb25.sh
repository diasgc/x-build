#!/bin/bash

lib='aribb25'
dsc='Basic implementation of the ARIB STD-B25 public standard.'
lic='ISC'
src='https://code.videolan.org/videolan/aribb25.git'
dep='pscs'

cfg='ar'

dev_vrs=''
pkg_deb=''
eta='10'

lst_inc=''
lst_lib=''

# todo ndk: patch files (undeclared functions)
#  pthread_cancel (src/eventhandler.c:185:9),
#  issetugid (src/sys_unix.c:175:6)

. xbuild && start

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...