#!/bin/bash

lib='jq'
dsc='Lightweight and flexible command-line JSON processor'
lic='Other'
vrs='jq-1.6' # latest
src='https://github.com/stedolan/jq.git'
cfg='ar'
dep='oniguruma'
eta='575'
pc_llib='-ljq'

lst_inc='jv.h jq.h'
lst_lib='libjq'
lst_bin='jq'
lst_lic='COPYING AUTHORS'
lst_pc='jq.pc'

. xbuilder.sh

ac_config="--disable-maintainer-mode --disable-docs --with-oniguruma=${dir_install}"
unset CSH

start

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