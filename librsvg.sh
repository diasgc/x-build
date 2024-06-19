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
    meson_config="-Dintrospection=disabled -Ddocs=disabled -Dtests=false -Dpixbuf-loader=disabled -Dtriplet=${arch}"
}

cargo_install(){
    sudo apt install cargo libssl-dev
    # sudo add-apt-repository ppa:savoury1/rust
    # 
    #cargo install cargo-c
}

# aa8 build:
# error: could not compile `rsvg_convert` (bin "rsvg-convert") due to 1 previous error
# command: ['cargo', 'build', '--locked', '--bin', 'rsvg-convert', '--manifest-path', 'sources/librsvg/Cargo.toml', '--target-dir', 'sources/librsvg/build_aarch64-linux-android/target', '--release', '--target', 'aarch64-linux-android', '--features', 'avif', '-p', 'rsvg_convert']
# error adding symbols: file in wrong format

. xbuild && start