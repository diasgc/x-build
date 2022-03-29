#!/bin/bash

lib='cmix'
dsc='cmix is a lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage.'
lic='GPL-3.0'
url='http://www.byronknoll.com/cmix.html'
src='https://github.com/byronknoll/cmix.git'
cfg='cmake'
eta='20'

cmake_static="BUILD_STATIC_LIBS"
cmake_bin="BUILD_EXECUTABLES"

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING README'
lst_pc=''

dev_vrs='19'

. xbuild

start

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

# patch 01 create CMakeLists.txt supporting dual static/shared build and pkgconfig file
# patch 02 create cmix.pc.in
# todo: REVIEW headers filelist
<<'LZS_PATCH'
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
LZS_PATCH


# Filelist
# --------
#
# bin/enwik9-preproc
# include/cmix/bit-context.h
# include/cmix/bracket-context.h
# include/cmix/bracket.h
# include/cmix/byte-mixer.h
# include/cmix/byte-model.h
# include/cmix/combined-context.h
# include/cmix/context-hash.h
# include/cmix/context-manager.h
# include/cmix/context.h
# include/cmix/decoder.h
# include/cmix/dictionary.h
# include/cmix/direct-hash.h
# include/cmix/direct.h
# include/cmix/encoder.h
# include/cmix/indirect-hash.h
# include/cmix/indirect.h
# include/cmix/interval-hash.h
# include/cmix/interval.h
# include/cmix/lstm-layer.h
# include/cmix/lstm.h
# include/cmix/match.h
# include/cmix/mixer-input.h
# include/cmix/mixer.h
# include/cmix/model.h
# include/cmix/nonstationary.h
# include/cmix/paq8.h
# include/cmix/paq8hp.h
# include/cmix/ppmd.h
# include/cmix/predictor.h
# include/cmix/preprocessor.h
# include/cmix/run-map.h
# include/cmix/sigmoid.h
# include/cmix/sparse.h
# include/cmix/sse.h
# include/cmix/state.h
# lib/libcmix.a
# lib/libcmix.so
# lib/pkgconfig/cmix.pc
# share/doc/cmix/COPYING
# share/doc/cmix/COPYING
# share/doc/cmix/README
# share/doc/cmix/README
