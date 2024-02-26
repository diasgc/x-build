#!/bin/bash

lib='poppler'
apt='libpoppler-dev'
dsc='PDF rendering library'
lic='GPL-2.0'
src='https://github.com/freedesktop/poppler.git'
cfg='cmake'
eta='240'
dep='boost fontconfig libtiff libjpeg openjpeg lcms2'
cmake_bin="ENABLE_UTILS"
cmake_static='BUILD_STATIC_LIBS'

dev_bra=''
dev_vrs='22.02.0'
stb_bra=''
stb_vrs=''

lst_inc='poppler/cpp/poppler*.h'
lst_lib='libpoppler-cpp libpoppler'
lst_bin=''
lst_lic='COPYING COPYING3'
lst_pc='poppler-cpp.pc poppler.pc'

. xbuild

cmake_config="-DBUILD_GTK_TESTS=OFF -DBUILD_CPP_TESTS=OFF -DBUILD_MANUAL_TESTS=OFF -DBUILD_QT5_TESTS=OFF \
     -DBUILD_QT6_TESTS=OFF -DENABLE_QT5=OFF -DENABLE_QT6=OFF \
     -DENABLE_LIBCURL=OFF"
start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/poppler/cpp/poppler-version.h
# include/poppler/cpp/poppler_cpp_export.h
# include/poppler/cpp/poppler-toc.h
# include/poppler/cpp/poppler-rectangle.h
# include/poppler/cpp/poppler-page-transition.h
# include/poppler/cpp/poppler-page-renderer.h
# include/poppler/cpp/poppler-page.h
# include/poppler/cpp/poppler-image.h
# include/poppler/cpp/poppler-global.h
# include/poppler/cpp/poppler-font-private.h
# include/poppler/cpp/poppler-font.h
# include/poppler/cpp/poppler-embedded-file.h
# include/poppler/cpp/poppler-document.h
# include/poppler/cpp/poppler-destination.h
# lib/libpoppler-cpp.a
# lib/libpoppler-cpp.so
# lib/libpoppler.a
# lib/libpoppler.so
# lib/pkgconfig/poppler-cpp.pc
# lib/pkgconfig/poppler.pc
# bin/pdfunite
# bin/pdfseparate
# bin/pdftohtml
# bin/pdftotext
# bin/pdftops
# bin/pdfinfo
# bin/pdfimages
# bin/pdffonts
# bin/pdfdetach
# bin/pdftoppm
# bin/pdfattach
# share/man/man1/pdftoppm.1
# share/man/man1/pdfunite.1
# share/man/man1/pdfseparate.1
# share/man/man1/pdftohtml.1
# share/man/man1/pdftotext.1
# share/man/man1/pdftops.1
# share/man/man1/pdfinfo.1
# share/man/man1/pdfimages.1
# share/man/man1/pdffonts.1
# share/man/man1/pdfattach.1
# share/man/man1/pdfdetach.1
# share/doc/poppler/COPYING3
# share/doc/poppler/COPYING
