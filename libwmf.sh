#!/bin/bash

lvr='0.2.12'
lib='libwmf'
apt='libwmf-dev'
dsc='Library for Converting Metafile Images'
lic='GPL-2.0'
src='https://github.com/caolanm/libwmf.git'
cfg='ar'
dep='freetype expat libpng libjpeg'
eta='60'
mki='install'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

WFLAGS='-Wno-macro-redefined'
CFLAGS=' -O3 -flto'

. xbuilder.sh

CSH="--disable-shared" # error in make install with --enable-shared

start

# cpu av8 av7 x86 x64
# NDK +F+   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/libwmf/foreign.h
# include/libwmf/macro.h
# include/libwmf/defs.h
# include/libwmf/svg.h
# include/libwmf/fund.h
# include/libwmf/types.h
# include/libwmf/font.h
# include/libwmf/canvas.h
# include/libwmf/x.h
# include/libwmf/color.h
# include/libwmf/ipa.h
# include/libwmf/gd/gdfontg.h
# include/libwmf/gd/gdfonts.h
# include/libwmf/gd/gd_io.h
# include/libwmf/gd/gdcache.h
# include/libwmf/gd/gd_clip.h
# include/libwmf/gd/gdfontmb.h
# include/libwmf/gd/gdfontl.h
# include/libwmf/gd/gdfontt.h
# include/libwmf/gd/gd.h
# include/libwmf/fig.h
# include/libwmf/eps.h
# include/libwmf/api.h
# include/libwmf/gd.h
# lib/libwmf.a
# lib/pkgconfig/libwmf.pc
# lib/gdk-pixbuf-2.0/2.10.0/loaders/io-wmf.la
# lib/gdk-pixbuf-2.0/2.10.0/loaders/io-wmf.a
# lib/libwmf.la
# lib/libwmflite.la
# lib/libwmflite.a
# share/doc/libwmf/AUTHORS
# share/doc/libwmf/COPYING
# share/libwmf/fonts/NimbusMonoPS-BoldItalic.t1
# share/libwmf/fonts/NimbusSans-Regular.afm
# share/libwmf/fonts/NimbusMonoPS-BoldItalic.afm
# share/libwmf/fonts/NimbusRoman-Bold.t1
# share/libwmf/fonts/StandardSymbolsPS.t1
# share/libwmf/fonts/NimbusSans-BoldItalic.afm
# share/libwmf/fonts/NimbusSans-Regular.t1
# share/libwmf/fonts/fontmap
# share/libwmf/fonts/NimbusSans-Italic.afm
# share/libwmf/fonts/NimbusRoman-Italic.afm
# share/libwmf/fonts/NimbusSans-Bold.afm
# share/libwmf/fonts/NimbusMonoPS-Regular.t1
# share/libwmf/fonts/NimbusSans-BoldItalic.t1
# share/libwmf/fonts/NimbusRoman-Regular.t1
# share/libwmf/fonts/NimbusRoman-Bold.afm
# share/libwmf/fonts/NimbusMonoPS-Italic.t1
# share/libwmf/fonts/NimbusRoman-BoldItalic.afm
# share/libwmf/fonts/NimbusRoman-Regular.afm
# share/libwmf/fonts/NimbusMonoPS-Regular.afm
# share/libwmf/fonts/NimbusMonoPS-Bold.afm
# share/libwmf/fonts/NimbusRoman-Italic.t1
# share/libwmf/fonts/NimbusSans-Italic.t1
# share/libwmf/fonts/NimbusMonoPS-Bold.t1
# share/libwmf/fonts/NimbusSans-Bold.t1
# share/libwmf/fonts/NimbusRoman-BoldItalic.t1
# share/libwmf/fonts/NimbusMonoPS-Italic.afm
# share/libwmf/fonts/StandardSymbolsPS.afm
# bin/wmf2gd
# bin/libwmf-fontmap
# bin/wmf2fig
# bin/wmf2svg
# bin/wmf2eps
# bin/libwmf-config
