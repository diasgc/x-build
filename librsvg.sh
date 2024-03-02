#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='librsvg'
apt='librsvg2-dev'
dsc='A small library to render Scalable Vector Graphics (SVG)'
lic='LGPL-2.1'
src='https://gitlab.gnome.org/GNOME/librsvg.git'
cfg='meson'
tls='cargo cargo-c'
eta='110'
#vrs='2.48.8'
#src="http://ftp.gnome.org/pub/gnome/sources/librsvg/2.48/librsvg-${vrs}.tar.xz"
#sty='txz'
#tls='gi-docgen python3-docutils rustc cargo'
#dep='cairo freetype gdk-pixbuf glib2 libxml2 pango'
#mki='install'
#ac_bin="--disable-tools|--enable-tools"
#ac_config='--enable-introspection=no'
meson_cfg="-Ddocs=disabled -Dtests=disabled -Dpixbuf-loader=disabled -Dtriplet=${arch}"

cargo_install(){
    sudo apt install cargo libssl-dev
    cargo install cargo-c
}

. xbuild

start