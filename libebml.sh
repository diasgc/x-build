#!/bin/bash

lib='libebml'
dsc='a C++ library to parse EBML files'
lic='LGPL-2.1'
src="https://github.com/Matroska-Org/libebml.git"
cfg='cmake'
eta='10'
cmake_static='BUILD_STATIC_LIBS'

dev_bra='master'
dev_vrs='1.4.2'
sta_rel='release-1.4.2'

lst_inc='ebml/*.h ebml/c/*.h'
lst_lib='libebml'
lst_bin=''
lst_lic='LICENSE.LGPL README'
lst_pc=''

. xbuild

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# include/ebml/Debug.h
# include/ebml/EbmlBinary.h
# include/ebml/EbmlConfig.h
# include/ebml/EbmlContexts.h
# include/ebml/EbmlCrc32.h
# include/ebml/EbmlDate.h
# include/ebml/EbmlDummy.h
# include/ebml/EbmlElement.h
# include/ebml/EbmlEndian.h
# include/ebml/EbmlFloat.h
# include/ebml/EbmlHead.h
# include/ebml/EbmlId.h
# include/ebml/EbmlMaster.h
# include/ebml/EbmlSInteger.h
# include/ebml/EbmlStream.h
# include/ebml/EbmlString.h
# include/ebml/EbmlSubHead.h
# include/ebml/EbmlTypes.h
# include/ebml/EbmlUInteger.h
# include/ebml/EbmlUnicodeString.h
# include/ebml/EbmlVersion.h
# include/ebml/EbmlVoid.h
# include/ebml/IOCallback.h
# include/ebml/MemIOCallback.h
# include/ebml/MemReadIOCallback.h
# include/ebml/SafeReadIOCallback.h
# include/ebml/StdIOCallback.h
# include/ebml/c/libebml_t.h
# include/ebml/ebml_export.h
# lib/cmake/EBML/EBMLConfig.cmake
# lib/cmake/EBML/EBMLConfigVersion.cmake
# lib/cmake/EBML/EBMLTargets-release.cmake
# lib/cmake/EBML/EBMLTargets.cmake
# lib/libebml.a
# lib/libebml.so
# lib/pkgconfig/libebml.pc
# share/doc/libebml/LICENSE.LGPL
# share/doc/libebml/README
