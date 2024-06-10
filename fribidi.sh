#!/bin/bash

lib='fribidi'
pkg_deb='libfribidi0'
dsc='Unicode Bidirectional Algorithm Library'
lic='LGPL-2.1'
src='https://github.com/fribidi/fribidi.git'
cfg='meson'
eta='60'
meson_bin='bin'
meson_cfg="-Db_lto=true -Ddocs=false -Dtests=false"

dev_vrs='1.0.15'

lst_inc='fribidi/*.h'
lst_lib='libfribidi'
lst_bin='fribidi'
lst_lic='COPYING AUTHORS'
lst_pc='fribidi.pc'

on_config(){
    $host_mingw || meson_cfg+=' -Db_pie=true'
    $use_clang && meson_cfg+=' --warnlevel=0'
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .  +++ clang/gcc


# Filelist
# --------
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
# lib/pkgconfig/fribidi.pc
# lib/libfribidi.a
# lib/libfribidi.so
# share/doc/fribidi/AUTHORS
# share/doc/fribidi/COPYING
# bin/fribidi
