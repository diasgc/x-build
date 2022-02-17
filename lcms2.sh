#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='lcms2'
apt='liblcms2-dev'
dsc='A free, open source, CMM engine. It provides fast transforms between ICC profiles'
lic='BSD-2c'
src='https://github.com/mm2/Little-CMS.git'
cfg='ac'
dep='libjpeg libtiff'
eta='90'

lst_inc='lcms2_plugin.h lcms2.h'
lst_lib='liblcms2'
lst_bin='linkicc psicc tificc jpgicc transicc'
lst_lic='COPYING AUTHORS'
lst_pc='lcms2.pc'

. xbuilder.sh

start

# Filelist
# --------
# include/lcms2_plugin.h
# include/lcms2.h
# lib/pkgconfig/lcms2.pc
# lib/liblcms2.la
# lib/liblcms2.a
# lib/liblcms2.so
# share/man/man1/jpgicc.1
# share/man/man1/transicc.1
# share/man/man1/psicc.1
# share/man/man1/linkicc.1
# share/man/man1/tificc.1
# share/doc/lcms2/AUTHORS
# share/doc/lcms2/COPYING
# bin/linkicc
# bin/psicc
# bin/tificc
# bin/jpgicc
# bin/transicc
