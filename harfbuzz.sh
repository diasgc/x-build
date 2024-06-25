#!/bin/bash

lib='harfbuzz'
dsc='HarfBuzz text shaping engine'
lic='MIT'
src='https://github.com/harfbuzz/harfbuzz.git'
tls='ragel'
dep='freetype'

cfg='cmake'
cmake_config='-DHB_HAVE_FREETYPE=ON'
cmake_bin='HB_BUILD_UTILS'
cmake_definitions+=('-Wno-double-promotion')

extra_options(){
	case "${1}" in
		--all) dep='freetype fontconfig glib2 cairo libicu';;
	esac
}

dev_bra='main'
dev_vrs='8.5.0'
pkg_deb='libharfbuzz-dev'
eta='400'

lst_inc='harfbuzz/*.h'
lst_lib='libharfbuzz libharfbuzz-subset'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='libharfbuzz.pc libharfbuzz-subset.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/harfbuzz/hb-subset.h
# include/harfbuzz/hb-ot-color.h
# include/harfbuzz/hb-ot-deprecated.h
# include/harfbuzz/hb-blob.h
# include/harfbuzz/hb-set.h
# include/harfbuzz/hb-aat-layout.h
# include/harfbuzz/hb-aat.h
# include/harfbuzz/hb-font.h
# include/harfbuzz/hb-shape-plan.h
# include/harfbuzz/hb.h
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
# lib/pkgconfig/harfbuzz.pc
# lib/pkgconfig/harfbuzz-subset.pc
# lib/libharfbuzz.so
# lib/cmake/harfbuzz/harfbuzz-config.cmake
# lib/libharfbuzz-subset.la
# lib/libharfbuzz-subset.so
# lib/libharfbuzz.a
# lib/libharfbuzz.la
# lib/libharfbuzz-subset.a
