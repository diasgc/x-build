#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   .   .   .   .   .   .   .   +   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='leptonica'
pkg='lept'
apt='libleptonica-dev'
dsc='An open source C library for efficient image processing and image analysis operations'
lic='copyleft'
src='https://github.com/DanBloomberg/leptonica.git'
cfg='am'
dep='zlib libjpeg libpng libwebp libtiff giflib openjpeg'
mki='install'
eta='180'
ac_nosysroot=true

lst_inc='leptonica/*.h'
lst_lib='liblept'
lst_bin='converttops converttopdf convertsegfilestops convertfilestops \
         convertsegfilestopdf imagetops xtractprotos fileinfo \
         convertformat convertfilestopdf'
lst_oth='lib/cmake/LeptonicaConfig-version.cmake \
         lib/cmake/LeptonicaConfig.cmake'

dev_bra='master'
dev_vrs='1.83.0'
stb_bra=''
stb_vrs=''

case $cfg in
    cm|ccm|cmake|ccmake)  cbk="BUILD_PROG";;
    ac|ag|am|ar|automake) cbk="programs";;
esac

extraOpts(){
      case $1 in
            --min) unset dep;;
      esac
}

WFLAGS="-Wno-address-of-packed-member"

. xbuild


case $build_tool in
    automake) CFG="--disable-fast-install";;
    cmake) CFG="-DSW_BUILD=OFF";;
esac

start

# Filelist
# --------
# include/leptonica/bmf.h
# include/leptonica/bilateral.h
# include/leptonica/allheaders.h
# include/leptonica/readbarcode.h
# include/leptonica/pix.h
# include/leptonica/environ.h
# include/leptonica/watershed.h
# include/leptonica/rbtree.h
# include/leptonica/arrayaccess.h
# include/leptonica/alltypes.h
# include/leptonica/bmfdata.h
# include/leptonica/list.h
# include/leptonica/stringcode.h
# include/leptonica/hashmap.h
# include/leptonica/jbclass.h
# include/leptonica/colorfill.h
# include/leptonica/sudoku.h
# include/leptonica/gplot.h
# include/leptonica/heap.h
# include/leptonica/ccbord.h
# include/leptonica/leptwin.h
# include/leptonica/array.h
# include/leptonica/bbuffer.h
# include/leptonica/ptra.h
# include/leptonica/endianness.h
# include/leptonica/queue.h
# include/leptonica/imageio.h
# include/leptonica/morph.h
# include/leptonica/dewarp.h
# include/leptonica/recog.h
# include/leptonica/stack.h
# include/leptonica/bmp.h
# include/leptonica/regutils.h
# lib/pkgconfig/lept.pc
# lib/liblept.so
# lib/liblept.la
# lib/cmake/LeptonicaConfig-version.cmake
# lib/cmake/LeptonicaConfig.cmake
# lib/liblept.a
# bin/converttops
# bin/converttopdf
# bin/convertsegfilestops
# bin/convertfilestops
# bin/convertsegfilestopdf
# bin/imagetops
# bin/xtractprotos
# bin/fileinfo
# bin/convertformat
# bin/convertfilestopdf
