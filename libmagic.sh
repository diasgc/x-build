#!/bin/bash

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='libmagic'
dsc='Image metadata library and tools'
lic=''
url='http://ftp.debian.org/debian/pool/main/f/file'
cfg='ac'
eta='60'

on_config(){
    vrs="$(curl -s "${url}/" | grep -oP '(?<=file_)([0-9\.]+)(?=.orig.tar.gz)' | tail -n 1)"
    src="${url}/file_${vrs}.orig.tar.gz"
}

. xbuild && start

# Filelist
# --------
# include/magic.h
# share/man/man4/magic.4
# share/man/man3/libmagic.3
# share/man/man1/file.1
# share/misc/magic.mgc
# lib/libmagic.la
# lib/pkgconfig/libmagic.pc
# lib/libmagic.so
# lib/libmagic.a
# bin/file
