#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   +++ ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

# note: check include/jasper/jas_log.h variable name class
lib='libraw'
dsc='Raw image decoder library (non-thread-safe)'
lic='LGPL-2.1 CDDL'
src='https://github.com/LibRaw/LibRaw.git'
cfg='ar'
dep='libjpeg lcms2 jasper'
eta='60'

cbk="able-examples"

lst_inc='libraw/*.h'
lst_lib='libraw_r libraw'
lst_bin='dcraw_half
	postprocessing_benchmark
	dcraw_emu
	half_mt
	multirender_test
	4channels
	raw-identify
	unprocessed_raw
	rawtextdump
	mem_image
	simple_dcraw'

. xbuilder.sh

WFLAGS=" -Wno-deprecated-register"

start

# Filelist
# --------
# include/libraw/libraw_alloc.h
# include/libraw/libraw_version.h
# include/libraw/libraw_internal.h
# include/libraw/libraw_datastream.h
# include/libraw/libraw_const.h
# include/libraw/libraw_types.h
# include/libraw/libraw.h
# lib/pkgconfig/libraw.pc
# lib/pkgconfig/libraw_r.pc
# lib/libraw_r.a
# lib/libraw.so
# lib/libraw_r.la
# lib/libraw.la
# lib/libraw_r.so
# lib/libraw.a
# share/doc/libraw/LICENSE.CDDL
# share/doc/libraw/COPYRIGHT
# share/doc/libraw/LICENSE.LGPL
# share/doc/libraw/Changelog.txt
# bin/dcraw_half
# bin/postprocessing_benchmark
# bin/dcraw_emu
# bin/half_mt
# bin/multirender_test
# bin/4channels
# bin/raw-identify
# bin/unprocessed_raw
# bin/rawtextdump
# bin/mem_image
# bin/simple_dcraw
