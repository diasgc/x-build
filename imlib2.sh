#!/bin/bash

lib='imlib2'
dsc='Image loading, rendering, saving library'
lic='GLP-2.0'
vrs='1.12.2'
src='https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.2/imlib2-'${vrs}'.tar.gz'
dep='freetype zlib bzip2 liblzma giflib libwebp libpng libjpeg libtiff'

cfg='ac'
am_config='--with-x=no --without-x-shm-fd --without-svg --without-id3 --without-heif'

dev_bra='main'
dev_vrs='1.12.2'
eta='20'
pkg_deb="libimlib2-dev"

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING COPYING-PLAIN AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc