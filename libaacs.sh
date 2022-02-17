#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   F.. ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libaacs'
apt="${libaacs}-dev"
dsc='Open implementation of the AACS specification.'
lic='LGPL-2.1'
src='https://code.videolan.org/videolan/libaacs.git'
cfg='ar'
eta='10'
tls='flex'
dep='libgcrypt'
mki='install-strip'
mkc='distclean'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

CFG="--with-libgcrypt-prefix=${LIBSDIR} --with-libgpg-error-prefix=${LIBSDIR}"
export YACC='byacc' YFLAGS='--update'

start