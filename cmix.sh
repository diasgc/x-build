#!/bin/bash

lib='cmix'
dsc='cmix is a lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage.'
lic='GPL-3.0'
url='http://www.byronknoll.com/cmix.html'
src='https://github.com/byronknoll/cmix.git'
cfg='cmake'
patch='cmix-01' # patch src/predictor.cpp and new CMakeLists.txt supports both static and shared libs
cmake_static="BUILD_STATIC_LIBS"
cmake_bin="BUILD_EXECUTABLES"

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING README'
lst_pc=''

dev_vrs='19'
pkg_deb=''
eta='20'

cmake_config='-DINSTALL_DOCS=OFF'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
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
