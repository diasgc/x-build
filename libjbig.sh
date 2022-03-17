#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   +++ +++ +++ +++
# linux-gnu   +++ +++ ... ...
# mingw-llvm  +++ +++ ... +++

lib='libjbig'
dsc='JBIG1 data compression standard (ITU-T T.82) lossless image compression'
lic='GPL'

#src='https://www.cl.cam.ac.uk/~mgk25/git/cdjbigkit' sty='git'
vrs='2.1' src="https://www.cl.cam.ac.uk/~mgk25/jbigkit/download/jbigkit-${vrs}.tar.gz"
cfg='cmake'
eta='17'

cmake_bin="BUILD_EXECUTABLES"
cmake_static='BUILD_STATIC_LIBS'

pc_llib='-ljbig -ljbig85'

lst_inc='jbig_ar.h jbig85.h jbig.h'
lst_lib='libjbig85 libjbig'
lst_bin='pbmtojbg85 pbmtojbg jbgtopbm85 jbgtopbm'

. xbuild

start

<<'LZS_PATCH'
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
lJBdBkNofgTbHUaEAA==
LZS_PATCH


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
