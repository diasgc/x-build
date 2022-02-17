#!/bin/bash

lib='tesseract'
apt='libtesseract-dev'
dsc='An OCR Engine that was developed at HP Labs between 1985 and 1995... and now at Google'
lic='Apache-2.0'
src='https://github.com/tesseract-ocr/tesseract.git'
cfg='ag'
dep='leptonica'
pkg='tesseract'

. xbuilder.sh

cmake_config='-DBUILD_TRAINING_TOOLS=OFF -DGRAPHICS_DISABLED=ON -DCOMPILER_SUPPORTS_MARCH_NATIVE=OFF'
$host_mingw && cmake_config+=' -DSW_BUILD=OFF' || cmake_config+=' -DOPENMP_BUILD=ON -DENABLE_LTO=ON'
ac_config='--disable-debug --disable-graphics --disable-tessdata-prefix --disable-largefile'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU +++  .   .   .  gcc
# WIN  F   .   .   .  clang/gcc

# Filelist
# --------
# include/tesseract/ltrresultiterator.h
# include/tesseract/ocrclass.h
# include/tesseract/capi.h
# include/tesseract/unichar.h
# include/tesseract/renderer.h
# include/tesseract/export.h
# include/tesseract/pageiterator.h
# include/tesseract/version.h
# include/tesseract/resultiterator.h
# include/tesseract/publictypes.h
# include/tesseract/osdetect.h
# include/tesseract/baseapi.h
# lib/pkgconfig/tesseract.pc
# lib/cmake/tesseract/TesseractConfig.cmake
# lib/cmake/tesseract/TesseractTargets-release.cmake
# lib/cmake/tesseract/TesseractConfigVersion.cmake
# lib/cmake/tesseract/TesseractTargets.cmake
# lib/libtesseract.so
# bin/tesseract
