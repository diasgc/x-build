#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   +   +   .   .   .   .   .  static
#  +   .   .   .   +   .   .   .   .   .   .  shared
#  -   .   .   .   f   .   .   .   .   .   .  bin

lib='daala'
pkg='daalaenc'
dsc='Research video codec'
lic='BSD-2c'
src='https://gitlab.xiph.org/xiph/daala.git'
dep='ogg libpng'

cfg='ag'
am_bin="tools"
am_config='--disable-doc
 --disable-examples
 --disable-player
 --disable-unit-tests
 --disable-encoder-check'
WFLAGS='-Wno-null-pointer-subtraction -Wno-strict-prototypes -Wno-empty-body'

dev_bra='main'
dev_vrs='0.0-1731-g694d4ce'
pkg_deb=''
eta='208'

lst_inc='daala/*.h'
lst_lib='libdaalaenc libdaaladec libdaalabase'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='daaladec.pc daalaenc.pc'

on_build_bin(){
     dep+=" libjpeg"
}

. xbuild && start


# Filelist
# --------
# include/daala/daalaenc.h
# include/daala/daaladec.h
# include/daala/daala_integer.h
# include/daala/codec.h
# lib/pkgconfig/daaladec.pc
# lib/pkgconfig/daalaenc.pc
# lib/libdaalaenc.la
# lib/libdaaladec.a
# lib/libdaalabase.la
# lib/libdaaladec.so
# lib/libdaalabase.a
# lib/libdaalaenc.so
# lib/libdaalaenc.a
# lib/libdaaladec.la
# lib/libdaalabase.so
# share/doc/daala/AUTHORS
# share/doc/daala/COPYING
