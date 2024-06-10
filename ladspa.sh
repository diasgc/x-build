#!/bin/bash
# fail to build plugins
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   .   .   .   .   .   .   .  static
#  F   .   .   .   .   .   .   .   .   .   .  shared
#  F   .   .   .   .   .   .   .   .   .   .  bin

lib='ladspa'
pkg_deb='ladspa-sdk'
dsc='Linux Audio Developers Simple Plugin API'
lic='LGPL'
vrs='1.17'
src="http://www.ladspa.org/download/ladspa_sdk_${vrs}.tgz"
cfg='cmake'
patch='ladspa-01'
cmake_static='BUILD_STATIC_LIBS'
build_strip=false

# just install header
cmake_bin='BUILD_PROGRAMS'
cmake_config='-DBUILD_PLUGINS=OFF'

dev_bra='master'
dev_vrs='1.17'
eta='60'

on_create_pc(){
    build_pkgconfig --libs=-lladspa
}

. xbuild && start

# Filelist
# --------
# libs/ladspa_plugins/libamp.a
# libs/ladspa_plugins/libdelay.a
# libs/ladspa_plugins/libamp.so
# libs/ladspa_plugins/libsine.a
# libs/ladspa_plugins/libsine.so
# libs/ladspa_plugins/libfilter.so
# libs/ladspa_plugins/libnoise.so
# libs/ladspa_plugins/libdelay.so
# libs/ladspa_plugins/libnoise.a
# libs/ladspa_plugins/libfilter.a
# include/ladspa.h
# lib/pkgconfig/ladspa.pc
# bin/listplugins
# bin/applyplugin
# bin/analyseplugin
