#!/bin/bash

lib='uavs3d'
dsc='AVS3 decoder which supports AVS3-P2 baseline profile.'
lic='Other'
src='https://github.com/uavs3/uavs3d.git'
patch="uavs3d-01"

cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'

dev_bra='master'
dev_vrs='1.1.71'
pkg_deb=''
eta='80'

lst_inc='uavs3d.h'
lst_lib='libuavs3d'
lst_bin=''
lst_lic='COPYING'
lst_pc='uavs3d.pc'

. xbuild && start

#!/bin/bash
# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/uavs3d.h
# lib/pkgconfig/uavs3d.pc
# lib/libuavs3d.a
# lib/libuavs3d.so
# share/doc/uavs3d/COPYING
