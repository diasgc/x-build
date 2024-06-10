#!/bin/bash

lib='fdk-aac'
pkg_deb='fdkaac'
dsc='A standalone library of the Fraunhofer FDK AAC code from Android'
lic='Other'
src='https://github.com/mstorsjo/fdk-aac.git'
cfg='cmake'
patch='fdk-aac-01' # patch on libSBRdec/include/log/log.h to support android build
eta='180'

cmake_bin='BUILD_PROGRAMS'

lst_inc='fdk-aac/*.h'
lst_lib='libfdk-aac'
lst_bin='aac-enc'
lst_lic='MODULE_LICENSE_FRAUNHOFER OWNERS NOTICE'
lst_pc='fdk-aac.pc'

dev_vrs='2.0.3'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU  .  +++  .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# share/doc/fdk-aac/OWNERS
# share/doc/fdk-aac/NOTICE
# share/doc/fdk-aac/MODULE_LICENSE_FRAUNHOFER
# include/fdk-aac/FDK_audio.h
# include/fdk-aac/aacdecoder_lib.h
# include/fdk-aac/genericStds.h
# include/fdk-aac/syslib_channelMapDescr.h
# include/fdk-aac/aacenc_lib.h
# include/fdk-aac/machine_type.h
# lib/pkgconfig/fdk-aac.pc
# lib/libfdk-aac.a
# lib/libfdk-aac.la
# lib/libfdk-aac.so
