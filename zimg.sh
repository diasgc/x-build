#!/bin/bash

lib='zimg'
dsc='Scaling, colorspace conversion, and dithering library'
lic='WTFPL'
src='https://github.com/sekrit-twc/zimg.git'
sub='submodule update --init --recursive'
src_rel=false

cfg='ag'

dev_bra='main'
dev_vrs='3.0.5'
pkg_deb='libzimg-dev'
eta='480'

lst_inc='zimg.h zimg++.hpp'
lst_lib='libzimg'
lst_bin=''
lst_lic='COPYING'
lst_pc='zimg.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +F   .   .   .  clang/gcc


# Filelist
# --------
# include/zimg.h
# include/zimg++.hpp
# lib/pkgconfig/zimg.pc
# lib/libzimg.so
# lib/libzimg.a
# lib/libzimg.la
# share/doc/zimg/README.md
# share/doc/zimg/ChangeLog
# share/doc/zimg/COPYING
