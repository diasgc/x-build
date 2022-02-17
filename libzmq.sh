#!/bin/bash

lib='libzmq'
dsc='ZeroMQ core engine in C++, implements ZMTP/3.1'
lic='GLP-2.0'
src='https://github.com/zeromq/libzmq.git'
cfg='ar'
eta='411'
dep='libsodium'

lst_inc='zmq.h zmq_utils.h'
lst_lib='libzmq'
lst_bin='curve_keyge'
lst_lic='COPYING COPYING.LESSER AUTHORS'
lst_pc='libzmq.pc'

dev_bra='master'
dev_vrs='4.3.5'
stb_bra=''
stb_vrs=''

. xbuilder.sh

CFG='--disable-Werror --with-libsodium'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  F   .   .   F  clang/gcc

# Filelist
# --------
# include/zmq.h
# include/zmq_utils.h
# lib/pkgconfig/libzmq.pc
# lib/libzmq.la
# lib/libzmq.a
# lib/libzmq.so
# bin/curve_keyge
# share/doc/libzmq/AUTHORS
# share/doc/libzmq/COPYING.LESSER
# share/doc/libzmq/COPYING