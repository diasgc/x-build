#!/bin/bash

lib='tesseract'
apt='libtesseract-dev'
dsc='An OCR Engine that was developed at HP Labs between 1985 and 1995... and now at Google'
lic='Apache-2.0'
src='https://github.com/tesseract-ocr/tesseract.git'
cfg='ag'
dep='leptonica'
pkg='tesseract'

lst_inc='tesseract/*.h'
lst_lib='libtesseract'
lst_bin='tesseract'
lst_lic='LICENSE'
lst_pc='tesseract.pc'

dev_vrs='5.1.0'

cmake_config='-DBUILD_TRAINING_TOOLS=OFF 
    -DGRAPHICS_DISABLED=ON
    -DCOMPILER_SUPPORTS_MARCH_NATIVE=OFF'

ac_config='--disable-debug
    --disable-graphics
    --disable-tessdata-prefix
    --disable-largefile'

. xbuild

$host_mingw && cmake_config+=' -DSW_BUILD=OFF' || cmake_config+=' -DOPENMP_BUILD=ON -DENABLE_LTO=ON'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU +++  .   .   .  gcc
# WIN  F   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/tesseract/LICENSE
# share/tessdata/tessconfigs/batch
# share/tessdata/tessconfigs/msdemo
# share/tessdata/tessconfigs/nobatch
# share/tessdata/tessconfigs/batch.nochop
# share/tessdata/tessconfigs/segdemo
# share/tessdata/tessconfigs/matdemo
# share/tessdata/pdf.ttf
# share/tessdata/configs/alto
# share/tessdata/configs/tsv
# share/tessdata/configs/api_config
# share/tessdata/configs/strokewidth
# share/tessdata/configs/unlv
# share/tessdata/configs/pdf
# share/tessdata/configs/kannada
# share/tessdata/configs/inter
# share/tessdata/configs/hocr
# share/tessdata/configs/quiet
# share/tessdata/configs/box.train.stderr
# share/tessdata/configs/txt
# share/tessdata/configs/rebox
# share/tessdata/configs/get.images
# share/tessdata/configs/bigram
# share/tessdata/configs/logfile
# share/tessdata/configs/lstmdebug
# share/tessdata/configs/digits
# share/tessdata/configs/lstm.train
# share/tessdata/configs/lstmbox
# share/tessdata/configs/linebox
# share/tessdata/configs/makebox
# share/tessdata/configs/box.train
# share/tessdata/configs/wordstrbox
# share/tessdata/configs/ambigs.train
# include/tesseract/ltrresultiterator.h
# include/tesseract/osdetect.h
# include/tesseract/pageiterator.h
# include/tesseract/resultiterator.h
# include/tesseract/ocrclass.h
# include/tesseract/capi.h
# include/tesseract/renderer.h
# include/tesseract/baseapi.h
# include/tesseract/export.h
# include/tesseract/unichar.h
# include/tesseract/version.h
# include/tesseract/publictypes.h
# bin/tesseract
# lib/pkgconfig/tesseract.pc
# lib/libtesseract.so
# lib/libtesseract.la
# lib/libtesseract.a
