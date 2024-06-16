#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='xorg-macros'
dsc='GNU autoconf macros shared across X.Org projects'
lic='GLP-2.0'
src='https://gitlab.freedesktop.org/xorg/util/macros.git'

cfg='ag'

dev_bra='master'
dev_vrs='1.20.1'
pkg_deb=''
eta='32'

lst_inc=''
lst_lib=''
lst_bin=''
lst_pc='xorg-macros.pc'

on_editpack(){
    ln -s ${dir_install}/share/pkgconfig/${pkg}.pc ${dir_install_pc}/${pkg}.pc
}

. xbuild && start

# Filelist
# --------
# share/pkgconfig/xorg-macros.pc
# share/util-macros/INSTALL
# share/aclocal/xorg-macros.m4
