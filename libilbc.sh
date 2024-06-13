#!/bin/bash

lib='libilbc'
dsc='Internet Low Bitrate Codec (iLBC) library'
lic='BSD-3c'
src='https://github.com/TimothyGu/libilbc.git'
src_opt='--depth=1'
sub='submodule update --init'
patch="libilbc-01"

cfg='cmake'
cmake_bin="examples"
cmake_static='BUILD_STATIC_LIBS'

dev_bra='main'
dev_vrs='3.0.4'
pkg_dev=''
eta='144'

lst_inc='ilbc.h ilbc_export.h'
lst_lib='libilbc'
lst_bin='ilbc_test'
lst_lic='COPYING AUTHORS'
lst_pc='libilbc.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ilbc.h
# include/ilbc_export.h
# lib/pkgconfig/libilbc.pc
# lib/libilbc.a
# lib/libilbc.so
# share/doc/libilbc/AUTHORS
# share/doc/libilbc/README.md
# share/doc/libilbc/NEWS.md
# share/doc/libilbc/CONTRIBUTING.md
# share/doc/libilbc/COPYING
# bin/ilbc_test
