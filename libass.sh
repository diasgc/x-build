#!/bin/bash

lib='libass'
dsc='LibASS is an SSA/ASS subtitles rendering library'
lic='ISC'
src='https://github.com/libass/libass.git'
dep='fribidi'
pkg='libass'

lst_inc='ass/*.h'
lst_lib='libass'
lst_bin=''
lst_lic='COPYING README.md'
lst_pc='libass.pc'

dev_bra='master'
dev_vrs='0.17.1'
pkg_deb='libass-dev'
eta='4'

#cfg='ag'
#ac_nosysroot=true
#dep='freetype fontconfig fribidi libpng harfbuzz'

cfg='meson'
meson_fontconfig=disabled
meson_config='-Dtest=false -Dprofile=false -Ddirectwrite=disabled -Dcoretext=disabled'

extraOpts(){
    case $1 in --all)
        dep+=' fontconfig'
        meson_fontconfig=enabled
        ;;
    esac
}

on_config(){
    meson_config+=" -Dfontconfig=${meson_fontconfig}"
    $host_cross && meson_config+=' -Drequire-system-font-provider=false'
    #CPPFLAGS+=" -I${dir_install_include}/fribidi -I${dir_install_include}/freetype2"
}

. xbuild && start

# Filelist
# --------
# share/doc/libass/README.md
# share/doc/libass/COPYING
# include/ass/ass.h
# include/ass/ass_types.h
# lib/libass.so
# lib/pkgconfig/libass.pc
# lib/libass.a
# lib/libass.la
