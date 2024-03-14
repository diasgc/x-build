#!/bin/bash

lib='libtiff'
apt="${lib}-dev"
dsc='TIFF Library and Utilities'
#vrs='v4.3.0'
lic='GPL?'
src='https://gitlab.com/libtiff/libtiff.git'
cfg='cmake'
pkg='libtiff-4'
eta='150'
mingw_posix=true
bin="tiff-tools"
dep=
cmake_static='BUILD_STATIC_LIBS'
#mkc='distclean'
#mki='install/strip'

cmake_config="-Dtiff-tests=OFF -Dtiff-tools=OFF -Dtiff-docs=OFF -Dtiff-contrib=OFF"

dev_vrs='4.6.0'

lst_inc='tiffconf.h tiffvers.h tiff.h tiffio.hxx tiffio.h'
lst_lib='libtiffxx libtiff'
lst_bin='tiffmedian tiffset fax2ps tiff2bw tiffdither raw2tiff tiffsplit tiff2pdf fax2tiff tiff2rgba pal2rgb tiff2ps tiffcrop tiffcmp tiffinfo tiffcp tiffdump ppm2tiff'
lst_lic='COPYRIGHT'
lst_pc='libtiff-4.pc'

extraOpts(){
    case $1 in
        --full)
            dep='liblzma libjpeg libzstd libdeflate lerc'
            cmake_config+=" -Dlzma=ON -Djpeg=ON -Dzstd=ON -Dlerc=ON -Dlibdeflate=ON -Dwebp=ON"
            ;;
    esac
}

. xbuild

$host_arm && cmake_config+=" -Dcxx=OFF"

start

# Filelist
# --------
# include/tiffconf.h
# include/tiffvers.h
# include/tiff.h
# include/tiffio.hxx
# include/tiffio.h
# lib/pkgconfig/libtiff-4.pc
# lib/libtiffxx.a
# lib/libtiffxx.so
# lib/libtiff.so
# lib/libtiff.a
# share/doc/libtiff/COPYRIGHT
# bin/tiffmedian
# bin/tiffset
# bin/fax2ps
# bin/tiff2bw
# bin/tiffdither
# bin/raw2tiff
# bin/tiffsplit
# bin/tiff2pdf
# bin/fax2tiff
# bin/tiff2rgba
# bin/pal2rgb
# bin/tiff2ps
# bin/tiffcrop
# bin/tiffcmp
# bin/tiffinfo
# bin/tiffcp
# bin/tiffdump
# bin/ppm2tiff
