#!/bin/bash

#vrs='2.13.94'
lib='fontconfig'
dsc='Font customization and configuration library'
lic='Other'
src='https://gitlab.freedesktop.org/fontconfig/fontconfig.git'
cfg='ac'
tls='gperf gettext autopoint'
dep='libiconv freetype expat json-c libpng'
eta='231'

lst_inc='fontconfig/*.h'
lst_lib='libfontconfig'
lst_bin='fc-match fc-cat fc-list fc-conflist fc-query fc-scan fc-pattern fc-validate fc-cache'
lst_lic='COPYING AUTHORS'
lst_pc='fontconfig.pc'

dev_bra='master'
dev_vrs='2.13.96'
stb_bra=''
stb_vrs=''

. xbuilder.sh

ac_config='--disable-docs'
exec_config="autogen.sh"

#not recomended
meson_cfg='-Db_pie=true -Db_lto=true -Ddoc=disabled -Dtests=disabled'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/fontconfig/fcfreetype.h
# include/fontconfig/fcprivate.h
# include/fontconfig/fontconfig.h
# etc/fonts/fonts.conf
# etc/fonts/conf.d/README
# lib/pkgconfig/fontconfig.pc
# lib/libfontconfig.so
# lib/libfontconfig.la
# lib/libfontconfig.a
# share/gettext/its/fontconfig.loc
# share/gettext/its/fontconfig.its
# share/doc/fontconfig/AUTHORS
# share/doc/fontconfig/COPYING
# share/xml/fontconfig/fonts.dtd
# share/fontconfig/conf.avail/20-unhint-small-vera.conf
# share/fontconfig/conf.avail/70-no-bitmaps.conf
# share/fontconfig/conf.avail/10-no-sub-pixel.conf
# share/fontconfig/conf.avail/51-local.conf
# share/fontconfig/conf.avail/05-reset-dirs-sample.conf
# share/fontconfig/conf.avail/70-yes-bitmaps.conf
# share/fontconfig/conf.avail/11-lcdfilter-light.conf
# share/fontconfig/conf.avail/10-sub-pixel-vbgr.conf
# share/fontconfig/conf.avail/11-lcdfilter-default.conf
# share/fontconfig/conf.avail/10-scale-bitmap-fonts.conf
# share/fontconfig/conf.avail/90-synthetic.conf
# share/fontconfig/conf.avail/45-generic.conf
# share/fontconfig/conf.avail/30-metric-aliases.conf
# share/fontconfig/conf.avail/25-unhint-nonlatin.conf
# share/fontconfig/conf.avail/10-hinting-none.conf
# share/fontconfig/conf.avail/11-lcdfilter-legacy.conf
# share/fontconfig/conf.avail/65-fonts-persian.conf
# share/fontconfig/conf.avail/10-autohint.conf
# share/fontconfig/conf.avail/80-delicious.conf
# share/fontconfig/conf.avail/69-unifont.conf
# share/fontconfig/conf.avail/10-hinting-medium.conf
# share/fontconfig/conf.avail/10-sub-pixel-bgr.conf
# share/fontconfig/conf.avail/49-sansserif.conf
# share/fontconfig/conf.avail/65-khmer.conf
# share/fontconfig/conf.avail/60-generic.conf
# share/fontconfig/conf.avail/35-lang-normalize.conf
# share/fontconfig/conf.avail/10-hinting-full.conf
# share/fontconfig/conf.avail/10-sub-pixel-vrgb.conf
# share/fontconfig/conf.avail/10-unhinted.conf
# share/fontconfig/conf.avail/10-hinting-slight.conf
# share/fontconfig/conf.avail/09-autohint-if-no-hinting.conf
# share/fontconfig/conf.avail/40-nonlatin.conf
# share/fontconfig/conf.avail/50-user.conf
# share/fontconfig/conf.avail/45-latin.conf
# share/fontconfig/conf.avail/10-sub-pixel-rgb.conf
# share/fontconfig/conf.avail/60-latin.conf
# share/fontconfig/conf.avail/65-nonlatin.conf
# bin/fc-match
# bin/fc-cat
# bin/fc-list
# bin/fc-conflist
# bin/fc-query
# bin/fc-scan
# bin/fc-pattern
# bin/fc-validate
# bin/fc-cache
