#!/bin/bash

lib='libnuma'
apt="${lib}-dev"
dsc='Library for tuning for Non Uniform Memory Access machines (linux)'
lic='GPL-2.0'
src='https://github.com/numactl/numactl.git'
cfg='ac'
eta='90'
pkg='numa'
eta='30'
mki=install
API=26 # min api necessary for declaration of functions like 'shmget'

lst_inc='numa.h numaif.h numacompat1.h'
lst_lib='libnuma'
lst_bin='numademo memhog migspeed numastat numactl migratepages'
lst_lic='LICENSE.GPL2 LICENSE.LGPL2.1'
lst_pc='numa.pc'

. xbuilder.sh

$host_mingw && doErr "Non-posix OS cannot use LUMA. Exiting...\n"

source_config(){
  NOCONFIGURE=1 ./autogen.sh
  autoconf -i
}

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN -not available- clang/gcc

# Filelist
# --------
# include/numa.h
# include/numaif.h
# include/numacompat1.h
# lib/pkgconfig/numa.pc
# lib/libnuma.a
# lib/libnuma.la
# lib/libnuma.so
# share/man/man3/numa.3
# share/man/man8/numastat.8
# share/man/man8/migspeed.8
# share/man/man8/migratepages.8
# share/man/man8/numactl.8
# share/man/man8/memhog.8
# share/man/man2/move_pages.2
# share/doc/libnuma/LICENSE.LGPL2.1
# share/doc/libnuma/LICENSE.GPL2
# bin/numademo
# bin/memhog
# bin/migspeed
# bin/numastat
# bin/numactl
# bin/migratepages
