#!/bin/bash

lib='imlib2'
dsc='Image loading, rendering, saving library'
lic='GLP-2.0'
src='https://git.enlightenment.org/legacy/imlib2.git'
cfg='ag'
eta='0'
dep='freetype zlib bzip2 liblzma giflib libwebp libpng libjpeg libtiff'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING COPYING-PLAIN AUTHORS'
lst_pc=''

eta='20'

CFG='--with-x=no --without-x-shm-fd --without-svg --without-id3 --without-heif'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc