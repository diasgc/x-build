#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
# -/+  .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='lensfun'
dsc='An open source database of photographic lenses and their characteristics'
lic='LGPL-3.0'
src='https://github.com/lensfun/lensfun.git'
cfg='cmake'
dep='libpng glib2'
eta='60'

cmake_bin='BUILD_LENSTOOL'
cmake_config="-DBUILD_TESTS=OFF -DBUILD_DOC=OFF -DINSTALL_HELPER_SCRIPTS=OFF -DINSTALL_PYTHON_MODULE=OFF -DBUILD_AUXFUN=ON" # -DGLIB2_BASE_DIR=$SOURCES/glib2"

. xbuilder.sh



start

# Filelist
# --------

# include/lensfun/lensfun.h
# lib/pkgconfig/lensfun.pc
# lib/liblensfun.so
# share/lensfun/version_2/compact-leica.xml
# share/lensfun/version_2/mil-sony.xml
# share/lensfun/version_2/slr-tokina.xml
# share/lensfun/version_2/compact-panasonic.xml
# share/lensfun/version_2/mil-pentax.xml
# share/lensfun/version_2/misc.xml
# share/lensfun/version_2/compact-sony.xml
# share/lensfun/version_2/compact-sigma.xml
# share/lensfun/version_2/compact-samsung.xml
# share/lensfun/version_2/slr-leica.xml
# share/lensfun/version_2/mil-sigma.xml
# share/lensfun/version_2/slr-hasselblad.xml
# share/lensfun/version_2/slr-ussr.xml
# share/lensfun/version_2/slr-konica-minolta.xml
# share/lensfun/version_2/compact-canon.xml
# share/lensfun/version_2/slr-samyang.xml
# share/lensfun/version_2/mil-fujifilm.xml
# share/lensfun/version_2/slr-zeiss.xml
# share/lensfun/version_2/slr-tamron.xml
# share/lensfun/version_2/mil-tamron.xml
# share/lensfun/version_2/compact-kodak.xml
# share/lensfun/version_2/slr-panasonic.xml
# share/lensfun/version_2/slr-schneider.xml
# share/lensfun/version_2/timestamp.txt
# share/lensfun/version_2/slr-pentax.xml
# share/lensfun/version_2/mil-leica.xml
# share/lensfun/version_2/mil-panasonic.xml
# share/lensfun/version_2/slr-ricoh.xml
# share/lensfun/version_2/contax.xml
# share/lensfun/version_2/slr-sigma.xml
# share/lensfun/version_2/mil-samsung.xml
# share/lensfun/version_2/mil-nikon.xml
# share/lensfun/version_2/slr-soligor.xml
# share/lensfun/version_2/compact-pentax.xml
# share/lensfun/version_2/compact-casio.xml
# share/lensfun/version_2/mil-olympus.xml
# share/lensfun/version_2/compact-konica-minolta.xml
# share/lensfun/version_2/mil-zeiss.xml
# share/lensfun/version_2/mil-tokina.xml
# share/lensfun/version_2/slr-canon.xml
# share/lensfun/version_2/slr-olympus.xml
# share/lensfun/version_2/6x6.xml
# share/lensfun/version_2/slr-vivitar.xml
# share/lensfun/version_2/rf-leica.xml
# share/lensfun/version_2/compact-fujifilm.xml
# share/lensfun/version_2/mil-canon.xml
# share/lensfun/version_2/compact-ricoh.xml
# share/lensfun/version_2/lensfun-database.xsd
# share/lensfun/version_2/compact-nikon.xml
# share/lensfun/version_2/mil-samyang.xml
# share/lensfun/version_2/compact-olympus.xml
# share/lensfun/version_2/lensfun-database.dtd
# share/lensfun/version_2/actioncams.xml
# share/lensfun/version_2/slr-samsung.xml
# share/lensfun/version_2/slr-nikon.xml
# share/lensfun/version_2/generic.xml
# share/lensfun/version_2/slr-sony.xml
# bin/lenstool
