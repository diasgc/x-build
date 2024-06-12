#!/bin/bash
# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU ++  ++   .  ++  gcc
# WIN  F   .   .   .  clang/gcc

lib='editline'
pkg='libeditline'
dsc='Port of the NetBSD Editline library (libedit)'
lic='GLP-2.0'
src='https://github.com/troglobit/editline.git'
cfg='ar'

lst_inc='editline.h'
lst_lib='libeditline'
lst_bin=''

dev_bra='master'
dev_vrs=''
pkg_deb=''
eta='90'

on_config_mingw(){
    exit_err 'MINGW not supported'
    svn='https://svn.code.sf.net/p/mingweditline/code/'
    cfg='cmake'
}

. xbuild && start

# Filelist
# --------
# include/editline.h
# lib/pkgconfig/libeditline.pc
# lib/libeditline.a
# lib/libeditline.so
# lib/libeditline.la
# share/man/man3/editline.3
# share/doc/editline/LICENSE
# share/doc/editline/README.md