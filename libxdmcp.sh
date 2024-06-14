#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libxdmcp'
dsc='X Display Manager Control Protocol routines'
lic='Other'
src='https://github.com/freedesktop/libXdmcp.git'

cfg='ag'
#ac_config='--enable-devel-docs'

dev_bra='master'
dev_vrs=''
pkg_deb='libxdmcp-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

. xbuild && start

# Filelist
# --------
# include/X11/Xdmcp.h
# lib/pkgconfig/xdmcp.pc
# lib/libXdmcp.la
# lib/libXdmcp.a
# lib/libXdmcp.so
# share/doc/libxdmcp/AUTHORS
# share/doc/libxdmcp/COPYING
# share/doc/libXdmcp/xdmcp.xml
