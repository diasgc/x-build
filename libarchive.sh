#!/bin/bash

lib='libarchive'
apt='libarchive-dev'
dsc='Multi-format archive and compression library'
lic='Other'
src='https://github.com/libarchive/libarchive.git'
url='http://www.libarchive.org/'
cfg='ar'
dep='libiconv bzip2 libb2 liblzma libzstd lz4 lzo zlib'
eta='100'

lst_inc='archive.h archive_entry.h'
lst_lib='libarchive'
lst_bin='bsdcat bsdtar bsdcpio'
lst_lic='COPYING'
lst_pc='libarchive.pc'

dev_vrs='3.7.4dev'

ac_nosysroot=true

. xbuild

$host_ndk && CPPFLAGS+=" -I${dir_src}/contrib/android/include"

on_editpack(){
    if $host_ndk; then
        cp "${dir_src}/contrib/android/include/android_lf.h" include
        cp include/android_lf.h ${dir_install_include}
    fi
}

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/archive.h
# include/archive_entry.h
# lib/pkgconfig/libarchive.pc
# lib/libarchive.a
# lib/libarchive.la
# lib/libarchive.so
# share/doc/libarchive/COPYING
# bin/bsdcat
# bin/bsdtar
# bin/bsdcpio
