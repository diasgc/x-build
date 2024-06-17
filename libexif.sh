#!/bin/bash

lib='libexif'
pkg_deb='libexif-dev'
dsc='A library for parsing, editing, and saving EXIF data'
lic='LGPL-2.1'
src='https://github.com/libexif/libexif.git'
dep='libiconv'
cfg='ar'
eta='33'

lst_inc='libexif/*.h'
lst_lib='libexif'
lst_bin=''
lst_lic='COPYING AUTHORS README SECURITY.md'
lst_pc='libavif.pc'
dev_vrs='0.6.24.1'

am_config='--disable-docs'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/libexif/SECURITY.md
# share/doc/libexif/ABOUT-NLS
# share/doc/libexif/COPYING
# share/doc/libexif/ChangeLog
# share/doc/libexif/README
# share/doc/libexif/AUTHORS
# share/doc/libexif/NEWS
# include/libexif/exif-log.h
# include/libexif/exif-format.h
# include/libexif/exif-utils.h
# include/libexif/exif-mnote-data.h
# include/libexif/exif-content.h
# include/libexif/exif-entry.h
# include/libexif/exif-data-type.h
# include/libexif/exif-loader.h
# include/libexif/exif-mem.h
# include/libexif/exif-ifd.h
# include/libexif/exif-byte-order.h
# include/libexif/_stdint.h
# include/libexif/exif-tag.h
# include/libexif/exif-data.h
# lib/libexif.so
# lib/pkgconfig/libexif.pc
# lib/libexif.a
# lib/libexif.la
