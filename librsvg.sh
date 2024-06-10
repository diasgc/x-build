#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='librsvg'
pkg_deb='librsvg2-dev'
dsc='A small library to render Scalable Vector Graphics (SVG)'
lic='LGPL-2.1'
src='https://gitlab.gnome.org/GNOME/librsvg.git'
cfg='meson'
dep='cairo freetype gdk-pixbuf glib2 libxml2 pango'
#tls='cargo'
eta='110'

on_config(){
    meson_cfg="-Dintrospection=disabled -Ddocs=disabled -Dtests=false -Dpixbuf-loader=disabled -Dtriplet=${arch}"
}

cargo_install(){
    sudo apt install cargo libssl-dev
    # sudo add-apt-repository ppa:savoury1/rust
    # 
    #cargo install cargo-c
}

. xbuild && start