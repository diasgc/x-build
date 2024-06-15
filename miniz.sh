#!/bin/bash

lib='miniz'
dsc='Single C source file zlib-replacement library, originally from code.google.com/p/miniz'
lic='GPL2+'
src="https://github.com/richgel999/miniz.git"

cfg='cmake'
cmake_config='-DBUILD_FUZZERS=OFF -DBUILD_TESTS=OFF'
# other opts '-DAMALGAMATE_SOURCES=OFF -DBUILD_HEADER_ONLY=OFF'
cmake_bin='BUILD_EXAMPLES'

dev_bra='master'
dev_vrs='3.0.2'
pkg_deb='libminizip-dev'
eta='10'

lst_inc='miniz/miniz.h
 miniz/miniz_common.h
 miniz/miniz_export.h
 miniz/miniz_tdef.h
 miniz/miniz_tinfl.h
 miniz/miniz_zip.h'
lst_lib='libminiz'
lst_bin=''
lst_lic='LICENSE README'
lst_pc='miniz.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
#
# include/miniz/miniz.h
# include/miniz/miniz_common.h
# include/miniz/miniz_export.h
# include/miniz/miniz_tdef.h
# include/miniz/miniz_tinfl.h
# include/miniz/miniz_zip.h
# lib/cmake/miniz/minizConfig.cmake
# lib/cmake/miniz/minizConfigVersion.cmake
# lib/cmake/miniz/minizTargets-release.cmake
# lib/cmake/miniz/minizTargets.cmake
# lib/libminiz.so
# share/doc/miniz/LICENSE
# share/doc/miniz/README
# share/pkgconfig/miniz.pc
