#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   +   .   .   .   .   .   .   .   .   .  static
#  +   +   .   .   .   .   .   .   .   .   .  shared

lib='libexif'
apt='libexif-dev'
dsc='A library for parsing, editing, and saving EXIF data'
lic='LGPL-2.1'
src='https://github.com/libexif/libexif.git'
sty='git'
dep='libiconv'
cfg='ar'
eta='33'

. xbuilder.sh

case $cfg in
  ac|ag|am|ar|automake) CFG="--with-sysroot=${SYSROOT} --with-pic=1 --disable-docs";;
esac

start

# Filelist
# --------
# include/libexif/exif-format.h
# include/libexif/exif-mnote-data.h
# include/libexif/exif-tag.h
# include/libexif/exif-data.h
# include/libexif/exif-ifd.h
# include/libexif/exif-utils.h
# include/libexif/exif-byte-order.h
# include/libexif/exif-mem.h
# include/libexif/exif-data-type.h
# include/libexif/exif-log.h
# include/libexif/exif-entry.h
# include/libexif/_stdint.h
# include/libexif/exif-loader.h
# include/libexif/exif-content.h
# lib/pkgconfig/libexif.pc
# lib/libexif.so
# lib/libexif.a
# lib/libexif.la
# share/doc/libexif/NEWS
# share/doc/libexif/AUTHORS
# share/doc/libexif/ABOUT-NLS
# share/doc/libexif/ChangeLog
# share/doc/libexif/SECURITY.md
# share/doc/libexif/COPYING
# share/doc/libexif/README
