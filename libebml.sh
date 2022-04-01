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

# patch 01 on CMakeLists.txt: support dual static/shared build
<<'LZS_PATCH'
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
LZS_PATCH


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
