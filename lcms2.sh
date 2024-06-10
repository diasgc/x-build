#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='lcms2'
pkg_deb='liblcms2-dev'
dsc='A free, open source, CMM engine. It provides fast transforms between ICC profiles'
lic='BSD-2c'
src='https://github.com/mm2/Little-CMS.git'
cfg='meson'
#
eta='90'

lst_inc='lcms2_plugin.h lcms2.h'
lst_lib='liblcms2'
lst_bin='linkicc psicc tificc jpgicc transicc'
lst_lic='COPYING AUTHORS'
lst_pc='lcms2.pc'

dev_bra='master'
dev_vrs='2.13.1'

meson_cfg='-Djpeg=disabled -Dtiff=disabled'

extraOpts(){
    case $1 in
        --full)
            dep='libjpeg libtiff'
            meson_cfg='-Djpeg=enabled -Dtiff=enabled'
            ;;
        --gpl3)
            meson_cfg+=' -Dfastfloat=true -Dthreaded=true'
            ;;
    esac
}

on_build_bin(){
    meson_cfg+=' -Dutils=true'
}

. xbuild && start

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
