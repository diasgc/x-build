#!/bin/bash

lib='ogg'
apt='libogg0'
dsc='Ogg media container'
lic='BSD'
src='https://github.com/xiph/ogg.git'
cfg='cmake'
eta='45'
mki='install'

ac_bin="--disable-extra-programs|--enable-extra-programs"

lst_inc='ogg/*.h'
lst_lib='libogg'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='ogg.pc'

. xbuilder.sh

cmake_config='-DBUILD_TESTING=OFF -DINSTALL_DOCS=OFF'

before_make(){
  # Patch to remove docs (automake)
  [ -n "${ac_bin}" ] && sed -i "s|SUBDIRS = src include doc|SUBDIRS = src include|g" Makefile
  return 0
}

start

# cpu av8 av7 x86 x64
# NDK ++  ++  ++  ++  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc



# Filelist
# --------
# include/ogg/config_types.h
# include/ogg/ogg.h
# include/ogg/os_types.h
# lib/pkgconfig/ogg.pc
# lib/libogg.la
# lib/libogg.a
# lib/libogg.so
# share/doc/ogg/AUTHORS
# share/doc/ogg/COPYING
# share/aclocal/ogg.m4
