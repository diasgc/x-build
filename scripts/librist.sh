#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='librist'
dsc='A library that can be used to easily add the RIST protocol to your application.'
lic='BSD-2c'
src='https://code.videolan.org/rist/librist.git'
cfg='meson'
eta='0'

cfg_bin='built_tools'

dev_bra='master'
dev_vrs=''
stb_bra='tags/0.2.6'
stb_vrs='0.2.6'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

. xbuilder.sh

start


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
