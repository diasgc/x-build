#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libxcb'
apt='libxcb1-dev'
dsc='C interface to the X Window System protocol, which replaces the traditional Xlib interface.'
lic='GLP-2.0'
vrs='1.12'
src='https://github.com/freedesktop/xcb-libxcb.git'
cfg='ag'
eta='0'
dep='libxau xcb-proto xcb-pthread-stubs libxdmcp'
#CFG='--enable-devel-docs'

# XCBPROTO_LIBS XCBPROTO_CFLAGS NEEDED_CFLAGS NEEDED_LIBS XDMCP_CFLAGS XDMCP_LIBS CHECK_CFLAGS CHECK_LIBS
dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh

start