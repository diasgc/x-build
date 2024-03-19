#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='zenity'
dsc='Zenity'
lic='LGPL2.1'
vrs=''
src="https://gitlab.gnome.org/GNOME/zenity"
cfg='meson'
eta='0'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

$host_cross && doErr "Unavailable"
dep='libadwaita-1-dev libwebkitgtk-6.0-dev gettext help2man itstool desktop-file-utils libglib2.0-dev-bin'

Program glib-mkenums found: YES (/usr/bin/glib-mkenums)
Program glib-mkenums found: YES (/usr/bin/glib-mkenums)
Configuring zenity.gresource.xml using configuration
Found pkg-config: /usr/bin/pkg-config (1.8.1)
Program glib-compile-resources found: YES (/usr/bin/glib-compile-resources)
Program msgfmt found: YES (/usr/bin/msgfmt)
Program desktop-file-validate found: YES (/usr/bin/desktop-file-validate)
Program help2man found: YES (/usr/bin/help2man)
Program msginit found: YES (/usr/bin/msginit)
Program msgmerge found: YES (/usr/bin/msgmerge)
Program xgettext found: YES (/usr/bin/xgettext)
Program itstool found: YES (/usr/bin/itstool)
Program msgmerge found: YES (/usr/bin/msgmerge)
Program msgfmt found: YES (/usr/bin/msgfmt)
Program gtk4-update-icon-cache found: YES (/usr/bin/gtk4-update-icon-cache)


#source_get(){ return 0; }
#patch_source(){ return 0; }
#on_config_arm(){ return 0; }
#on_config_x86x(){ return 0; }

start