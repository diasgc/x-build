#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='pango'
dsc='Pango is a library for layout and rendering of text, with an emphasis on internationalization'
lic='GLP-2.0'
src='https://gitlab.gnome.org/GNOME/pango.git'
cfg='meson'
dep='cairo expat fontconfig pixman freetype2 fribidi harfbuzz'
eta='0'
CFG='-Dintrospection=disabled'

dev_bra='master'
dev_vrs='1.50.3'

lst_inc='pango-1.0/pango/*.h'
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/expat.h
# include/fribidi/fribidi-types.h
# include/fribidi/fribidi-flags.h
# include/fribidi/fribidi-bidi-types-list.h
# include/fribidi/fribidi-brackets.h
# include/fribidi/fribidi-bidi-types.h
# include/fribidi/fribidi-common.h
# include/fribidi/fribidi-enddecls.h
# include/fribidi/fribidi-char-sets-list.h
# include/fribidi/fribidi-config.h
# include/fribidi/fribidi-bidi.h
# include/fribidi/fribidi-shape.h
# include/fribidi/fribidi-begindecls.h
# include/fribidi/fribidi-mirroring.h
# include/fribidi/fribidi-unicode-version.h
# include/fribidi/fribidi-char-sets.h
# include/fribidi/fribidi-joining-types.h
# include/fribidi/fribidi-joining-types-list.h
# include/fribidi/fribidi-deprecated.h
# include/fribidi/fribidi-unicode.h
# include/fribidi/fribidi-arabic.h
# include/fribidi/fribidi-joining.h
# include/fribidi/fribidi.h
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
# include/freetype2/ft2build.h
# include/freetype2/freetype/ftmoderr.h
# include/freetype2/freetype/ftwinfnt.h
# include/freetype2/freetype/ftbbox.h
# include/freetype2/freetype/ftcolor.h
# include/freetype2/freetype/ftfntfmt.h
# include/freetype2/freetype/ftmm.h
# include/freetype2/freetype/fterrors.h
# include/freetype2/freetype/ftlcdfil.h
# include/freetype2/freetype/ftgzip.h
# include/freetype2/freetype/freetype.h
# include/freetype2/freetype/tttables.h
# include/freetype2/freetype/ftimage.h
# include/freetype2/freetype/ftincrem.h
# include/freetype2/freetype/ftgasp.h
# include/freetype2/freetype/ftadvanc.h
# include/freetype2/freetype/tttags.h
# include/freetype2/freetype/ftmodapi.h
# include/freetype2/freetype/ftrender.h
# include/freetype2/freetype/ftcache.h
# include/freetype2/freetype/config/ftoption.h
# include/freetype2/freetype/config/ftconfig.h
# include/freetype2/freetype/config/ftheader.h
# include/freetype2/freetype/config/ftstdlib.h
# include/freetype2/freetype/config/ftmodule.h
# include/freetype2/freetype/ftoutln.h
# include/freetype2/freetype/fttrigon.h
# include/freetype2/freetype/ftdriver.h
# include/freetype2/freetype/ftsizes.h
# include/freetype2/freetype/ftsynth.h
# include/freetype2/freetype/ftbzip2.h
# include/freetype2/freetype/ftlist.h
# include/freetype2/freetype/ftmac.h
# include/freetype2/freetype/ftsnames.h
# include/freetype2/freetype/ftglyph.h
# include/freetype2/freetype/ftstroke.h
# include/freetype2/freetype/ttnameid.h
# include/freetype2/freetype/ftbdf.h
# include/freetype2/freetype/t1tables.h
# include/freetype2/freetype/fterrdef.h
# include/freetype2/freetype/ftgxval.h
# include/freetype2/freetype/ftbitmap.h
# include/freetype2/freetype/ftpfr.h
# include/freetype2/freetype/ftlzw.h
# include/freetype2/freetype/ftchapters.h
# include/freetype2/freetype/ftcid.h
# include/freetype2/freetype/ftotval.h
# include/freetype2/freetype/fttypes.h
# include/freetype2/freetype/ftsystem.h
# include/freetype2/freetype/ftparams.h
# include/expat_config.h
# include/fontconfig/fcfreetype.h
# include/fontconfig/fcprivate.h
# include/fontconfig/fontconfig.h
# include/expat_external.h
# include/pango-1.0/pango/pango.h
# include/pango-1.0/pango/pango-color.h
# include/pango-1.0/pango/pango-glyph.h
# include/pango-1.0/pango/pango-ot.h
# include/pango-1.0/pango/pango-features.h
# include/pango-1.0/pango/pango-types.h
# include/pango-1.0/pango/pango-direction.h
# include/pango-1.0/pango/pangofc-decoder.h
# include/pango-1.0/pango/pango-item.h
# include/pango-1.0/pango/pango-fontset-simple.h
# include/pango-1.0/pango/pango-script.h
# include/pango-1.0/pango/pango-fontmap.h
# include/pango-1.0/pango/pangofc-fontmap.h
# include/pango-1.0/pango/pango-enum-types.h
# include/pango-1.0/pango/pango-tabs.h
# include/pango-1.0/pango/pango-version-macros.h
# include/pango-1.0/pango/pango-font.h
# include/pango-1.0/pango/pango-coverage.h
# include/pango-1.0/pango/pango-gravity.h
# include/pango-1.0/pango/pango-utils.h
# include/pango-1.0/pango/pango-glyph-item.h
# include/pango-1.0/pango/pangocairo.h
# include/pango-1.0/pango/pango-language.h
# include/pango-1.0/pango/pango-break.h
# include/pango-1.0/pango/pango-context.h
# include/pango-1.0/pango/pango-attributes.h
# include/pango-1.0/pango/pango-layout.h
# include/pango-1.0/pango/pangoft2.h
# include/pango-1.0/pango/pango-modules.h
# include/pango-1.0/pango/pango-fontset.h
# include/pango-1.0/pango/pango-engine.h
# include/pango-1.0/pango/pangofc-font.h
# include/pango-1.0/pango/pango-markup.h
# include/pango-1.0/pango/pango-bidi-type.h
# include/pango-1.0/pango/pango-matrix.h
# include/pango-1.0/pango/pango-renderer.h
# include/harfbuzz/hb-subset.h
# include/harfbuzz/hb-ot-color.h
# include/harfbuzz/hb-gobject-enums.h
# include/harfbuzz/hb-ot-deprecated.h
# include/harfbuzz/hb-blob.h
# include/harfbuzz/hb-gobject-structs.h
# include/harfbuzz/hb-set.h
# include/harfbuzz/hb-icu.h
# include/harfbuzz/hb-aat-layout.h
# include/harfbuzz/hb-aat.h
# include/harfbuzz/hb-ft.h
# include/harfbuzz/hb-font.h
# include/harfbuzz/hb-gobject.h
# include/harfbuzz/hb-shape-plan.h
# include/harfbuzz/hb.h
# include/harfbuzz/hb-glib.h
# include/harfbuzz/hb-ot.h
# include/harfbuzz/hb-face.h
# include/harfbuzz/hb-ot-layout.h
# include/harfbuzz/hb-unicode.h
# include/harfbuzz/hb-ot-shape.h
# include/harfbuzz/hb-version.h
# include/harfbuzz/hb-shape.h
# include/harfbuzz/hb-ot-name.h
# include/harfbuzz/hb-map.h
# include/harfbuzz/hb-ot-font.h
# include/harfbuzz/hb-ot-math.h
# include/harfbuzz/hb-ot-meta.h
# include/harfbuzz/hb-ot-metrics.h
# include/harfbuzz/hb-common.h
# include/harfbuzz/hb-buffer.h
# include/harfbuzz/hb-ot-var.h
# include/harfbuzz/hb-style.h
# include/harfbuzz/hb-draw.h
# include/harfbuzz/hb-deprecated.h
# etc/fonts/fonts.conf
# etc/fonts/conf.d/README
# lib/libcairo-gobject.so
# lib/pkgconfig/pangofc.pc
# lib/pkgconfig/cairo-gobject.pc
# lib/pkgconfig/fontconfig.pc
# lib/pkgconfig/harfbuzz.pc
# lib/pkgconfig/fribidi.pc
# lib/pkgconfig/cairo-pdf.pc
# lib/pkgconfig/pango.pc
# lib/pkgconfig/cairo.pc
# lib/pkgconfig/harfbuzz-gobject.pc
# lib/pkgconfig/cairo-fc.pc
# lib/pkgconfig/pangoft2.pc
# lib/pkgconfig/cairo-ps.pc
# lib/pkgconfig/cairo-ft.pc
# lib/pkgconfig/harfbuzz-subset.pc
# lib/pkgconfig/pangoot.pc
# lib/pkgconfig/expat.pc
# lib/pkgconfig/cairo-xml.pc
# lib/pkgconfig/freetype2.pc
# lib/pkgconfig/cairo-png.pc
# lib/pkgconfig/cairo-script-interpreter.pc
# lib/pkgconfig/pangocairo.pc
# lib/pkgconfig/harfbuzz-icu.pc
# lib/pkgconfig/cairo-svg.pc
# lib/pkgconfig/cairo-script.pc
# lib/libharfbuzz-gobject.so
# lib/libcairo-gobject.a
# lib/libfontconfig.so
# lib/libharfbuzz.so
# lib/libharfbuzz-icu.so
# lib/cmake/harfbuzz/harfbuzz-config.cmake
# lib/libpango-1.0.so
# lib/libfribidi.a
# lib/libcairo-script-interpreter.a
# lib/libharfbuzz-icu.a
# lib/libpangoft2-1.0.so
# lib/libcairo.so
# lib/libpangocairo-1.0.a
# lib/libexpat.a
# lib/libharfbuzz-subset.so
# lib/libharfbuzz-gobject.a
# lib/libpangoft2-1.0.a
# lib/libfontconfig.a
# lib/libfreetype.a
# lib/libfribidi.so
# lib/libharfbuzz.a
# lib/libfreetype.so
# lib/libexpat.so
# lib/libcairo-script-interpreter.so
# lib/libpangocairo-1.0.so
# lib/libcairo.a
# lib/libpango-1.0.a
# lib/libharfbuzz-subset.a
# share/gettext/its/fontconfig.loc
# share/gettext/its/fontconfig.its
# share/locale/zh_CN/LC_MESSAGES/fontconfig-conf.mo
# share/locale/zh_CN/LC_MESSAGES/fontconfig.mo
# share/xml/fontconfig/fonts.dtd
# share/fontconfig/conf.avail/20-unhint-small-vera.conf
# share/fontconfig/conf.avail/70-no-bitmaps.conf
# share/fontconfig/conf.avail/10-no-sub-pixel.conf
# share/fontconfig/conf.avail/51-local.conf
# share/fontconfig/conf.avail/05-reset-dirs-sample.conf
# share/fontconfig/conf.avail/70-yes-bitmaps.conf
# share/fontconfig/conf.avail/11-lcdfilter-light.conf
# share/fontconfig/conf.avail/10-sub-pixel-vbgr.conf
# share/fontconfig/conf.avail/11-lcdfilter-default.conf
# share/fontconfig/conf.avail/10-scale-bitmap-fonts.conf
# share/fontconfig/conf.avail/90-synthetic.conf
# share/fontconfig/conf.avail/45-generic.conf
# share/fontconfig/conf.avail/30-metric-aliases.conf
# share/fontconfig/conf.avail/25-unhint-nonlatin.conf
# share/fontconfig/conf.avail/10-hinting-none.conf
# share/fontconfig/conf.avail/11-lcdfilter-legacy.conf
# share/fontconfig/conf.avail/65-fonts-persian.conf
# share/fontconfig/conf.avail/10-autohint.conf
# share/fontconfig/conf.avail/80-delicious.conf
# share/fontconfig/conf.avail/69-unifont.conf
# share/fontconfig/conf.avail/10-hinting-medium.conf
# share/fontconfig/conf.avail/10-sub-pixel-bgr.conf
# share/fontconfig/conf.avail/49-sansserif.conf
# share/fontconfig/conf.avail/65-khmer.conf
# share/fontconfig/conf.avail/60-generic.conf
# share/fontconfig/conf.avail/35-lang-normalize.conf
# share/fontconfig/conf.avail/10-hinting-full.conf
# share/fontconfig/conf.avail/10-sub-pixel-vrgb.conf
# share/fontconfig/conf.avail/10-unhinted.conf
# share/fontconfig/conf.avail/10-hinting-slight.conf
# share/fontconfig/conf.avail/09-autohint-if-no-hinting.conf
# share/fontconfig/conf.avail/40-nonlatin.conf
# share/fontconfig/conf.avail/50-user.conf
# share/fontconfig/conf.avail/45-latin.conf
# share/fontconfig/conf.avail/10-sub-pixel-rgb.conf
# share/fontconfig/conf.avail/60-latin.conf
# share/fontconfig/conf.avail/65-nonlatin.conf
# share/gtk-doc/html/harfbuzz/fonts-and-faces.html
# share/gtk-doc/html/harfbuzz/setting-buffer-properties.html
# share/gtk-doc/html/harfbuzz/reference-manual.html
# share/gtk-doc/html/harfbuzz/home.png
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-coretext.html
# share/gtk-doc/html/harfbuzz/HarfBuzz.png
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-gdi.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-font.html
# share/gtk-doc/html/harfbuzz/object-model-lifecycle.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-layout.html
# share/gtk-doc/html/harfbuzz/right-insensitive.png
# share/gtk-doc/html/harfbuzz/right.png
# share/gtk-doc/html/harfbuzz/why-is-it-called-harfbuzz.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-blob.html
# share/gtk-doc/html/harfbuzz/adding-text-to-the-buffer.html
# share/gtk-doc/html/harfbuzz/apple-advanced-typography-api.html
# share/gtk-doc/html/harfbuzz/utilities-common-types-apis.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-glib.html
# share/gtk-doc/html/harfbuzz/shaping-opentype-features.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-uniscribe.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-graphite2.html
# share/gtk-doc/html/harfbuzz/fonts-and-faces-custom-functions.html
# share/gtk-doc/html/harfbuzz/buffers-language-script-and-direction.html
# share/gtk-doc/html/harfbuzz/up-insensitive.png
# share/gtk-doc/html/harfbuzz/why-do-i-need-a-shaping-engine.html
# share/gtk-doc/html/harfbuzz/working-with-harfbuzz-clusters.html
# share/gtk-doc/html/harfbuzz/a-simple-shaping-example.html
# share/gtk-doc/html/harfbuzz/integration.html
# share/gtk-doc/html/harfbuzz/opentype-api.html
# share/gtk-doc/html/harfbuzz/left-insensitive.png
# share/gtk-doc/html/harfbuzz/a-clustering-example-for-levels-0-and-1.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-face.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-shape-plan.html
# share/gtk-doc/html/harfbuzz/what-does-harfbuzz-do.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ft.html
# share/gtk-doc/html/harfbuzz/shaping-concepts.html
# share/gtk-doc/html/harfbuzz/integration-api.html
# share/gtk-doc/html/harfbuzz/customizing-unicode-functions.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-buffer.html
# share/gtk-doc/html/harfbuzz/aat-shaping.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-icu.html
# share/gtk-doc/html/harfbuzz/what-harfbuzz-doesnt-do.html
# share/gtk-doc/html/harfbuzz/integration-coretext.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-unicode.html
# share/gtk-doc/html/harfbuzz/object-model-blobs.html
# share/gtk-doc/html/harfbuzz/text-runs.html
# share/gtk-doc/html/harfbuzz/harfbuzz.devhelp2
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-set.html
# share/gtk-doc/html/harfbuzz/left.png
# share/gtk-doc/html/harfbuzz/integration-uniscribe.html
# share/gtk-doc/html/harfbuzz/complex-scripts.html
# share/gtk-doc/html/harfbuzz/shaping-operations.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-aat-layout.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-var.html
# share/gtk-doc/html/harfbuzz/user-manual.html
# share/gtk-doc/html/harfbuzz/shaping-and-shape-plans.html
# share/gtk-doc/html/harfbuzz/integration-icu.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-metrics.html
# share/gtk-doc/html/harfbuzz/terminology.html
# share/gtk-doc/html/harfbuzz/utilities.html
# share/gtk-doc/html/harfbuzz/fonts-and-faces-variable.html
# share/gtk-doc/html/harfbuzz/opentype-shaping-models.html
# share/gtk-doc/html/harfbuzz/shaping-plans-and-caching.html
# share/gtk-doc/html/harfbuzz/style.css
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-shape.html
# share/gtk-doc/html/harfbuzz/subset-api.html
# share/gtk-doc/html/harfbuzz/install-harfbuzz.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-deprecated.html
# share/gtk-doc/html/harfbuzz/fonts-and-faces-native-opentype.html
# share/gtk-doc/html/harfbuzz/integration-python.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-subset.html
# share/gtk-doc/html/harfbuzz/api-index-full.html
# share/gtk-doc/html/harfbuzz/graphite-shaping.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-name.html
# share/gtk-doc/html/harfbuzz/getting-started.html
# share/gtk-doc/html/harfbuzz/up.png
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-color.html
# share/gtk-doc/html/harfbuzz/style-api.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-shape.html
# share/gtk-doc/html/harfbuzz/shaping-shaper-selection.html
# share/gtk-doc/html/harfbuzz/building.html
# share/gtk-doc/html/harfbuzz/reordering-in-levels-0-and-1.html
# share/gtk-doc/html/harfbuzz/clusters.html
# share/gtk-doc/html/harfbuzz/unicode-character-categories.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-map.html
# share/gtk-doc/html/harfbuzz/what-is-harfbuzz.html
# share/gtk-doc/html/harfbuzz/the-distinction-between-levels-0-and-1.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-version.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-common.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-math.html
# share/gtk-doc/html/harfbuzz/annotation-glossary.html
# share/gtk-doc/html/harfbuzz/object-model-user-data.html
# share/gtk-doc/html/harfbuzz/index.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-meta.html
# share/gtk-doc/html/harfbuzz/object-model-object-types.html
# share/gtk-doc/html/harfbuzz/integration-freetype.html
# share/gtk-doc/html/harfbuzz/core-api.html
# share/gtk-doc/html/harfbuzz/object-model.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-ot-font.html
# share/gtk-doc/html/harfbuzz/HarfBuzz.svg
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-directwrite.html
# share/gtk-doc/html/harfbuzz/harfbuzz-hb-style.html
# share/gtk-doc/html/harfbuzz/level-2.html
# bin/fc-match
# bin/fc-cat
# bin/pango-view
# bin/fribidi
# bin/fc-list
# bin/fc-conflist
# bin/fc-query
# bin/hb-ot-shape-closure
# bin/hb-shape
# bin/fc-scan
# bin/fc-pattern
# bin/pango-list
# bin/fc-validate
# bin/pango-segmentation
# bin/hb-subset
# bin/fc-cache
# bin/hb-view
