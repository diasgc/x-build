#!/bin/bash

lib='cairo'
apt='libcairo2-dev'
dsc='Development files for the Cairo 2D graphics library'
lic='LGPL-2.1'
src='https://github.com/freedesktop/cairo.git'
cfg='meson'
dep='zlib lzo glib2 libpng fontconfig freetype pixman'
eta='86'

meson_cfg='-Dxcb=disabled -Dxlib=disabled -Dxlib-xcb=disabled -Dtests=disabled -Dquartz=disabled -Dsymbol-lookup=disabled -Dspectre=disabled'

dev_bra='master'
dev_vrs='1.17.5'
stb_bra='1.16'
stb_vrs='1.16'

lst_inc='cairo/*.h'
lst_lib='libcairo-gobject libcairo-script-interpreter libcairo libcairo-script-interpreter libcairo'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='cairo-gobject.pc
  cairo-pdf.pc
  cairo.pc
  cairo-fc.pc
  cairo-ps.pc
  cairo-ft.pc
  cairo-xml.pc
  cairo-png.pc
  cairo-script-interpreter.pc
  cairo-svg.pc
  cairo-script.pc'

. xbuilder.sh

WFLAGS=' -Wno-unused-function -Wno-parentheses-equality -Wno-implicit-const-int-float-conversion -Wno-sometimes-uninitialized -Wno-switch-enum'

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/cairo/cairo-gobject.h
# include/cairo/cairo-xml.h
# include/cairo/cairo-version.h
# include/cairo/cairo-svg.h
# include/cairo/cairo.h
# include/cairo/cairo-script.h
# include/cairo/cairo-features.h
# include/cairo/cairo-ft.h
# include/cairo/cairo-script-interpreter.h
# include/cairo/cairo-pdf.h
# include/cairo/cairo-deprecated.h
# include/cairo/cairo-ps.h
# lib/libcairo-gobject.so
# lib/pkgconfig/cairo-gobject.pc
# lib/pkgconfig/cairo-pdf.pc
# lib/pkgconfig/cairo.pc
# lib/pkgconfig/cairo-fc.pc
# lib/pkgconfig/cairo-ps.pc
# lib/pkgconfig/cairo-ft.pc
# lib/pkgconfig/cairo-xml.pc
# lib/pkgconfig/cairo-png.pc
# lib/pkgconfig/cairo-script-interpreter.pc
# lib/pkgconfig/cairo-svg.pc
# lib/pkgconfig/cairo-script.pc
# lib/libcairo-gobject.a
# lib/libcairo-script-interpreter.a
# lib/libcairo.so
# lib/libcairo-script-interpreter.so
# lib/libcairo.a
# share/doc/cairo/AUTHORS
# share/doc/cairo/COPYING
