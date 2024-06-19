#!/bin/bash

lib='librist'
dsc='A library that can be used to easily add the RIST protocol to your application.'
lic='BSD-2c'
src='https://code.videolan.org/rist/librist.git'

cfg='meson'
meson_bin='built_tools'

dev_bra='master'
dev_vrs='0.2.6'
pkg_deb='librist-dev'
eta='0'

lst_inc='librist/librist_srp.h
 librist/urlparam.h
 librist/udpsocket.h
 librist/stats.h
 librist/librist.h
 librist/receiver.h
 librist/peer.h
 librist/logging.h
 librist/opt.h
 librist/headers.h
 librist/version.h
 librist/oob.h
 librist/common.h
 librist/librist_config.h
 librist/sender.h'
lst_lib='librist'
lst_bin='ristreceiver
 ristsender
 rist2rist
 ristsrppasswd'
lst_lic='COPYING'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/librist/librist_srp.h
# include/librist/urlparam.h
# include/librist/udpsocket.h
# include/librist/stats.h
# include/librist/librist.h
# include/librist/receiver.h
# include/librist/peer.h
# include/librist/logging.h
# include/librist/opt.h
# include/librist/headers.h
# include/librist/version.h
# include/librist/oob.h
# include/librist/common.h
# include/librist/librist_config.h
# include/librist/sender.h
# share/doc/librist/COPYING
# lib/librist.so
# lib/librist.a
# lib/pkgconfig/librist.pc
# bin/ristreceiver
# bin/ristsender
# bin/rist2rist
# bin/ristsrppasswd
