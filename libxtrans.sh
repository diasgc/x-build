#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libxtrans'
dsc='Abstract network code for X'
lic='GLP-2.0'
src='https://gitlab.freedesktop.org/xorg/lib/libxtrans.git'
cfg='ag'
eta='0'
pkg='xtrans'

dev_bra='master'
dev_vrs=''
stb_bra='xtrans-1.4.0'
stb_vrs='1.4.0'

lst_inc='X11/xtrans/*.h'
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='xtrans.pc'

. xbuilder.sh

on_editpack(){
    ln -s share/pkgconfig/xtrans.pc lib/pkgconfig/xtrans.pc
    ln -s ${dir_install}/share/pkgconfig/xtrans.pc ${dir_install}/lib/pkgconfig/xtrans.pc
}

start

# Filelist
# --------
# include/X11/Xtrans/Xtrans.h
# include/X11/Xtrans/Xtranslcl.c
# include/X11/Xtrans/Xtransutil.c
# include/X11/Xtrans/transport.c
# include/X11/Xtrans/Xtransint.h
# include/X11/Xtrans/Xtrans.c
# include/X11/Xtrans/Xtranssock.c
# share/pkgconfig/xtrans.pc
# share/doc/libxtrans/AUTHORS
# share/doc/libxtrans/COPYING
# share/doc/xtrans/xtrans.xml
# share/aclocal/xtrans.m4
