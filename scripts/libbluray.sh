#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='libbluray'
dsc='Library to access Blu-Ray disks'
lic='LGPL-2.1'
src='https://code.videolan.org/videolan/libbluray.git'
sty='git'
cfg='ar'
dep='libxml2 freetype fontconfig libudfread'
pkg='libbluray'
eta='60'

. xbuilder.sh
CFG="--with-sysroot=${SYSROOT} --disable-bdjava-jar --disable-examples --with-pic=1"

#export FT2_CFLAGS="-I$LIBSDIR/freetype/include/freetype2" \
#  FT2_LIBS="-L$LIBSDIR/freetype/lib -lfreetype" \
#  FONTCONFIG_CFLAGS="-I$LIBSDIR/fontconfig/include" \
#  FONTCONFIG_LIBS="-I$LIBSDIR/fontconfig/lib -lfontconfig"

start