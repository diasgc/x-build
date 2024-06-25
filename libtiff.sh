#!/bin/bash

lib='libtiff'
pkg='libtiff-4'
dsc='TIFF Library and Utilities'
lic='GPL?'
src='https://gitlab.com/libtiff/libtiff.git'

cfg='cmake'
cmake_config='-Dtiff-tests=OFF -Dtiff-docs=OFF -Dtiff-contrib=OFF'
cmake_deps='OFF'
cmake_bin="tiff-tools"
mingw_posix=true

dev_vrs='4.6.0'
pkg_deb="libtiff-dev"
eta='12'

extra_options(){
    case "${1}" in
        --all) dep='liblzma libjpeg libzstd libdeflate lerc' cmake_deps='ON';;
        --min) dep='' cmake_deps='OFF';;
    esac
}

on_build_static(){
    cmake_config+=" -DBUILD_SHARED_LIBS=OFF"
    LDFLAGS+=' -static'
}

on_config(){
    cmake_config+=" -Dlzma=${cmake_deps} -Djpeg=${cmake_deps} -Dzstd=${cmake_deps} -Dlerc=${cmake_deps} -Dlibdeflate=${cmake_deps} -Dwebp=${cmake_deps}"
    cmake_config+=" -Dcxx=$(bool2str ${host_arm} OFF ON)"
}

lst_inc='tiffconf.h tiffvers.h tiff.h tiffio.hxx tiffio.h'
lst_lib='libtiffxx libtiff'
lst_bin='tiffmedian tiffset fax2ps tiff2bw tiffdither raw2tiff tiffsplit tiff2pdf fax2tiff tiff2rgba pal2rgb tiff2ps tiffcrop tiffcmp tiffinfo tiffcp tiffdump ppm2tiff'
lst_lic='COPYRIGHT'
lst_pc='libtiff-4.pc'

. xbuild && start

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
