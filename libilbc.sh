#!/bin/bash

lib='libilbc'
dsc='Internet Low Bitrate Codec (iLBC) library'
lic='BSD-3c'
src='https://github.com/TimothyGu/libilbc.git'
cfg='cmake'
patch="libilbc-01"
eta='64'
cmake_bin="examples"

cmake_static='BUILD_STATIC_LIBS'
#cfg_bin=''

dev_bra='main'
dev_vrs='3.0.4'
stb_bra='tags/3.0.4'
stb_vrs='3.0.4'

lst_inc='ilbc.h ilbc_export.h'
lst_lib='libilbc'
lst_bin='ilbc_test'
lst_lic='COPYING AUTHORS'
lst_pc='libilbc.pc'

source_get(){
    do_progress 'git' git clone --depth=1 $src $lib
    cd $lib
    do_log 'sub' git submodule update --init
    cd ..
}

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
