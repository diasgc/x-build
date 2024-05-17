#!/bin/bash

lib='pango'
dsc='Pango is a library for layout and rendering of text, with an emphasis on internationalization'
lic='GLP-2.0'
src='https://gitlab.gnome.org/GNOME/pango.git'
cfg='meson'
dep='cairo expat fontconfig pixman freetype fribidi harfbuzz'
tls='libglib2.0-dev-bin python3 python3-toml python3-typogrify'
eta='0'
CFG='-Dintrospection=disabled'

dev_bra='master'
dev_vrs='1.50.5'

lst_inc='pango-1.0/pango/*.h'
lst_lib='libpango-1.0 libpangocairo-1.0 libpangoft2-1.0'
lst_bin='pango-view pango-segmentation pango-list'
lst_lic='LICENSE AUTHORS'
lst_pc='pango.pc pangoft2.pc pangocairo.pc pangofc.pc pangoot.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/pango-1.0/pango/pango-item.h
# include/pango-1.0/pango/pango-utils.h
# include/pango-1.0/pango/pango-ot.h
# include/pango-1.0/pango/pango-coverage.h
# include/pango-1.0/pango/pango-layout.h
# include/pango-1.0/pango/pango-version-macros.h
# include/pango-1.0/pango/pango-font.h
# include/pango-1.0/pango/pango-fontset-simple.h
# include/pango-1.0/pango/pango-context.h
# include/pango-1.0/pango/pangocairo.h
# include/pango-1.0/pango/pango-enum-types.h
# include/pango-1.0/pango/pango-engine.h
# include/pango-1.0/pango/pango-markup.h
# include/pango-1.0/pango/pango-tabs.h
# include/pango-1.0/pango/pangofc-decoder.h
# include/pango-1.0/pango/pangofc-fontmap.h
# include/pango-1.0/pango/pango-fontmap.h
# include/pango-1.0/pango/pango-language.h
# include/pango-1.0/pango/pango-bidi-type.h
# include/pango-1.0/pango/pango-glyph-item.h
# include/pango-1.0/pango/pango-break.h
# include/pango-1.0/pango/pangoft2.h
# include/pango-1.0/pango/pango-fontset.h
# include/pango-1.0/pango/pango-modules.h
# include/pango-1.0/pango/pango-types.h
# include/pango-1.0/pango/pango-color.h
# include/pango-1.0/pango/pango-matrix.h
# include/pango-1.0/pango/pango-direction.h
# include/pango-1.0/pango/pango-attributes.h
# include/pango-1.0/pango/pango-script.h
# include/pango-1.0/pango/pango-renderer.h
# include/pango-1.0/pango/pango.h
# include/pango-1.0/pango/pango-features.h
# include/pango-1.0/pango/pango-gravity.h
# include/pango-1.0/pango/pangofc-font.h
# include/pango-1.0/pango/pango-glyph.h
# bin/pango-view
# bin/pango-segmentation
# bin/pango-list
# lib/libpango-1.0.so
# lib/libpangocairo-1.0.so
# lib/libpangocairo-1.0.a
# lib/pkgconfig/pango.pc
# lib/pkgconfig/pangoft2.pc
# lib/pkgconfig/pangocairo.pc
# lib/pkgconfig/pangofc.pc
# lib/pkgconfig/pangoot.pc
# lib/libpangoft2-1.0.a
# lib/libpango-1.0.a
# lib/libpangoft2-1.0.so
