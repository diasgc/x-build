#!/bin/bash

lib='jq'
dsc='Lightweight and flexible command-line JSON processor'
lic='Other'
vrs='jq-1.6' # latest
src='https://github.com/stedolan/jq.git'
cfg='ar'
dep='oniguruma'

lst_inc='jv.h jq.h'
lst_lib='libjq'
lst_bin='jq'
lst_lic='COPYING AUTHORS'
lst_pc='jq.pc'

dev_bra='main'
dev_vrs='1.6'
eta='575'
pkg_deb="libjq-dev"

on_config(){
    am_config="--disable-maintainer-mode --disable-docs --with-oniguruma=${dir_install}"
    unset build_liblink build_link
}

on_create_pc(){
  build_pkgconfig --libs=-ljq
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# Filelist
# --------
# include/jv.h
# include/jq.h
# lib/libjq.so
# lib/libjq.la
# lib/libjq.a
# share/man/man1/jq.1
# share/doc/jq/AUTHORS
# share/doc/jq/README.md
# share/doc/jq/COPYING
# share/doc/jq/README
# bin/jq