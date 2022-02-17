#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='poppler'
apt='libpoppler-dev'
dsc='PDF rendering library'
lic='GPL-2.0'
src='https://github.com/freedesktop/poppler.git'
sty='git'
cfg='cm'
eta='240'
dep='fontconfig libtiff libjpeg openjpeg'
cb0="-DENABLE_UTILS=OFF"
cb1="-DENABLE_UTILS=ON"

. xbuilder.sh

CFG="-DENABLE_BOOST=OFF -DBUILD_GTK_TESTS=OFF -DBUILD_QT5_TESTS=OFF \
     -DBUILD_QT6_TESTS=OFF -DENABLE_QT5=OFF -DENABLE_QT6=OFF \
     -DENABLE_CMS=none -DENABLE_LIBCURL=OFF"

start