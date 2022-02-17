#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='shared-mime-info'
dsc='Shared MIME info spec'
lic='GLP-2.0'
src='https://github.com/freedesktop/xdg-shared-mime-info.git'
sub='submodule update --init --recursive'
tls='itstool'
dep='libxml2 glib2'
cfg='meson'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start