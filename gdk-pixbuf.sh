#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lcv='2.42.7'
lib='gdk-pixbuf'
pkg='gdk-pixbuf-2.0'
dsc='GdkPixbuf: Image loading library'
lic='LGLP-2.1'
src='https://gitlab.gnome.org/GNOME/gdk-pixbuf.git'
cfg='meson'
eta='121'
tls='gobject-introspection'
dep='glib2 libiconv libpng libjpeg'
meson_cfg="-Dinstalled_tests=false -Dgtk_doc=false"

lst_inc='gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf*.h'
lst_lib='gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*.so libgdk_pixbuf-2.0'
lst_bin='gdk-pixbuf-pixdata gdk-pixbuf-query-loaders gdk-pixbuf-csource'
lst_lic='COPYING'
lst_pc='gdk-pixbuf-2.0.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# bin/gdk-pixbuf-pixdata
# bin/gdk-pixbuf-query-loaders
# bin/gdk-pixbuf-csource
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-io.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-animation.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixdata.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-autocleanups.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-marshal.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-macros.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-features.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-loader.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-enum-types.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-transform.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-core.h
# include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-simple-anim.h
# lib/pkgconfig/gdk-pixbuf-2.0.pc
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-bmp.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-gif.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ani.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-qtif.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ico.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-tiff.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-xpm.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-xbm.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-pnm.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-icns.so
# lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-tga.so
# lib/libgdk_pixbuf-2.0.so
# lib/libgdk_pixbuf-2.0.a
# share/doc/gdk-pixbuf/COPYING