#!/bin/bash

lib='shared-mime-info'
dsc='Shared MIME info spec'
lic='GLP-2.0'
src='https://gitlab.freedesktop.org/xdg/shared-mime-info.git'
src_opt='--recursive'
tls='itstool libxml2-utils'
dep='libxml2 glib2'

cfg='meson'
meson_bin="bool:build-tools"
meson_cfg='-Dbuild-tests=false'

dev_bra='master'
dev_vrs='2.4'
pkg_deb='shared-mime-info'
eta='0'

lst_inc=''
lst_lib=''
lst_bin='pdate-mime-database'
lst_pc='shared-mime-info.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/locale/ta/LC_MESSAGES/shared-mime-info.mo
# share/locale/nl/LC_MESSAGES/shared-mime-info.mo
# share/locale/wa/LC_MESSAGES/shared-mime-info.mo
# share/locale/fo/LC_MESSAGES/shared-mime-info.mo
# share/locale/lt/LC_MESSAGES/shared-mime-info.mo
# share/locale/mr/LC_MESSAGES/shared-mime-info.mo
# share/locale/vi/LC_MESSAGES/shared-mime-info.mo
# share/locale/lv/LC_MESSAGES/shared-mime-info.mo
# share/locale/ko/LC_MESSAGES/shared-mime-info.mo
# share/locale/eo/LC_MESSAGES/shared-mime-info.mo
# share/locale/ky/LC_MESSAGES/shared-mime-info.mo
# share/locale/tr/LC_MESSAGES/shared-mime-info.mo
# share/locale/hu/LC_MESSAGES/shared-mime-info.mo
# share/locale/hi/LC_MESSAGES/shared-mime-info.mo
# share/locale/zh_TW/LC_MESSAGES/shared-mime-info.mo
# share/locale/bn_IN/LC_MESSAGES/shared-mime-info.mo
# share/locale/nn/LC_MESSAGES/shared-mime-info.mo
# share/locale/th/LC_MESSAGES/shared-mime-info.mo
# share/locale/zh_CN/LC_MESSAGES/shared-mime-info.mo
# share/locale/ca@valencia/LC_MESSAGES/shared-mime-info.mo
# share/locale/be/LC_MESSAGES/shared-mime-info.mo
# share/locale/az/LC_MESSAGES/shared-mime-info.mo
# share/locale/ast/LC_MESSAGES/shared-mime-info.mo
# share/locale/el/LC_MESSAGES/shared-mime-info.mo
# share/locale/de/LC_MESSAGES/shared-mime-info.mo
# share/locale/fa/LC_MESSAGES/shared-mime-info.mo
# share/locale/pl/LC_MESSAGES/shared-mime-info.mo
# share/locale/fur/LC_MESSAGES/shared-mime-info.mo
# share/locale/sr/LC_MESSAGES/shared-mime-info.mo
# share/locale/kn/LC_MESSAGES/shared-mime-info.mo
# share/locale/ml/LC_MESSAGES/shared-mime-info.mo
# share/locale/es/LC_MESSAGES/shared-mime-info.mo
# share/locale/pt_BR/LC_MESSAGES/shared-mime-info.mo
# share/locale/et/LC_MESSAGES/shared-mime-info.mo
# share/locale/gl/LC_MESSAGES/shared-mime-info.mo
# share/locale/sk/LC_MESSAGES/shared-mime-info.mo
# share/locale/ka/LC_MESSAGES/shared-mime-info.mo
# share/locale/en_GB/LC_MESSAGES/shared-mime-info.mo
# share/locale/hr/LC_MESSAGES/shared-mime-info.mo
# share/locale/be@latin/LC_MESSAGES/shared-mime-info.mo
# share/locale/ca/LC_MESSAGES/shared-mime-info.mo
# share/locale/zh_HK/LC_MESSAGES/shared-mime-info.mo
# share/locale/nb/LC_MESSAGES/shared-mime-info.mo
# share/locale/gu/LC_MESSAGES/shared-mime-info.mo
# share/locale/oc/LC_MESSAGES/shared-mime-info.mo
# share/locale/ia/LC_MESSAGES/shared-mime-info.mo
# share/locale/sv/LC_MESSAGES/shared-mime-info.mo
# share/locale/id/LC_MESSAGES/shared-mime-info.mo
# share/locale/sq/LC_MESSAGES/shared-mime-info.mo
# share/locale/pt/LC_MESSAGES/shared-mime-info.mo
# share/locale/bg/LC_MESSAGES/shared-mime-info.mo
# share/locale/da/LC_MESSAGES/shared-mime-info.mo
# share/locale/af/LC_MESSAGES/shared-mime-info.mo
# share/locale/sr@latin/LC_MESSAGES/shared-mime-info.mo
# share/locale/ms/LC_MESSAGES/shared-mime-info.mo
# share/locale/kk/LC_MESSAGES/shared-mime-info.mo
# share/locale/fi/LC_MESSAGES/shared-mime-info.mo
# share/locale/ru/LC_MESSAGES/shared-mime-info.mo
# share/locale/sl/LC_MESSAGES/shared-mime-info.mo
# share/locale/rw/LC_MESSAGES/shared-mime-info.mo
# share/locale/te/LC_MESSAGES/shared-mime-info.mo
# share/locale/cs/LC_MESSAGES/shared-mime-info.mo
# share/locale/uk/LC_MESSAGES/shared-mime-info.mo
# share/locale/eu/LC_MESSAGES/shared-mime-info.mo
# share/locale/ja/LC_MESSAGES/shared-mime-info.mo
# share/locale/pa/LC_MESSAGES/shared-mime-info.mo
# share/locale/cy/LC_MESSAGES/shared-mime-info.mo
# share/locale/or/LC_MESSAGES/shared-mime-info.mo
# share/locale/ar/LC_MESSAGES/shared-mime-info.mo
# share/locale/ga/LC_MESSAGES/shared-mime-info.mo
# share/locale/fr/LC_MESSAGES/shared-mime-info.mo
# share/locale/it/LC_MESSAGES/shared-mime-info.mo
# share/locale/ro/LC_MESSAGES/shared-mime-info.mo
# share/locale/as/LC_MESSAGES/shared-mime-info.mo
# share/locale/he/LC_MESSAGES/shared-mime-info.mo
# share/mime/packages/freedesktop.org.xml
# share/man/man1/update-mime-database.1
# share/pkgconfig/shared-mime-info.pc
# share/gettext/its/shared-mime-info.loc
# share/gettext/its/shared-mime-info.its
# bin/update-mime-database
