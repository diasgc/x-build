#!/bin/bash

lib='lame'
dsc='LAME is a high quality MPEG Audio Layer III (MP3) encoder'
lic='LGPL'
url='http://www.mp3dev.org'
src="https://svn.code.sf.net/p/lame/svn/trunk/lame"
cfg='cmake'
dep='libiconv'
eta='180'

cmake_static='BUILD_STATIC_LIBS'
cmake_bin='INSTALL_PROGRAMS'
cmake_config='-DINSTALL_MANPAGES=OFF -DINSTALL_HTML=OFF'

dev_vrs='3.101'

lst_inc='lame/lame.h'
lst_lib='libmp3lame'
lst_bin='lame mp3rtp'
lst_lic='LICENSE COPYING'
lst_pc='lame.pc'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++ +++  .   .  gcc
# WIN +++ +++  .   .  clang/gcc

# Filelist
# --------
#
# bin/lame
# bin/mp3rtp
# include/lame/lame.h
# lib/cmake/mp3lameTargets-static.cmake
# lib/cmake/mp3lameTargets.cmake
# lib/libmp3lame.a
# lib/libmp3lame.so
# lib/pkgconfig/lame.pc
# share/doc/lame/COPYING
# share/doc/lame/LICENSE