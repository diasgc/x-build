#!/bin/bash

lib='harfbuzz'
apt='libharfbuzz-dev'
dsc='HarfBuzz text shaping engine'
lic='MIT'
src='https://github.com/harfbuzz/harfbuzz.git'
cfg='cmake'
tls='ragel'
dep='freetype fontconfig glib2 cairo libicu'
eta='400'

dev_bra='main'
dev_vrs='4.0.0'
stb_bra=''
stb_vrs=''

lst_inc='harfbuzz/*.h'
lst_lib='libharfbuzz libharfbuzz-subset'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='libharfbuzz.pc libharfbuzz-subset.pc'

ac_config='--with-libstdc++=yes'
cmake_bin='HB_BUILD_UTILS'

extraOpts(){
	case $1 in
		--min)  unset dep; ac_config+=' --with-glib=no --with-gobject=no --with-cairo=no --with-fontconfig=no --with-icu=no --with-freetype=no';;
		--max) dep='freetype fontconfig glib2 cairo libicu';;
	esac
}

. xbuild

CPPFLAGS+=" -I${dir_install_include}/freetype2"

start

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
