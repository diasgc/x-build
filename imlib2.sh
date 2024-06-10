#!/bin/bash

lib='imlib2'
dsc='Image loading, rendering, saving library'
lic='GLP-2.0'
vrs='1.12.2'
src='https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.2/imlib2-'${vrs}'.tar.gz'
cfg='ac'
eta='0'
pkg_deb="libimlib2-dev"

dep='freetype zlib bzip2 liblzma giflib libwebp libpng libjpeg libtiff'

dev_bra='main'
dev_vrs='1.12.2'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING COPYING-PLAIN AUTHORS'
lst_pc=''

eta='20'
pkg_deb="libimlib2-dev"


ac_config='--with-x=no --without-x-shm-fd --without-svg --without-id3 --without-heif'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc