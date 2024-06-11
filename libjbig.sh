#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   +++ +++ +++ +++
# linux-gnu   +++ +++ ... ...
# mingw-llvm  +++ +++ ... +++

lib='libjbig'
dsc='JBIG1 data compression standard (ITU-T T.82) lossless image compression'
lic='GPL'
src='https://www.cl.cam.ac.uk/~mgk25/git/jbigkit'
patch='libjbig-01'
cfg='cmake'
cmake_bin="BUILD_EXECUTABLES"
cmake_static='BUILD_STATIC_LIBS'

lst_inc='jbig_ar.h jbig85.h jbig.h'
lst_lib='libjbig85 libjbig'
lst_bin='pbmtojbg85 pbmtojbg jbgtopbm85 jbgtopbm'

dev_vrs='v2.1'
eta='17'

on_create_pc(){
    build_pkgconfig --name=libjbig --libs=-ljbig
    build_pkgconfig --name=libjbig85 --libs=--ljbig85
}
. xbuild && start

# Filelist
# --------
#
# bin/jbgtopbm
# bin/jbgtopbm85
# bin/pbmtojbg
# bin/pbmtojbg85
# include/jbig.h
# include/jbig85.h
# include/jbig_ar.h
# lib/libjbig.a
# lib/libjbig.so
# lib/libjbig85.a
# lib/libjbig85.so
# lib/pkgconfig/libjbig.pc
# share/docs/libjbig/COPYING
# share/docs/libjbig/INSTALL
# share/docs/libjbig/TODO
