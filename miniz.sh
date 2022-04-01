#!/bin/bash

lib='miniz'
dsc='Single C source file zlib-replacement library, originally from code.google.com/p/miniz'
lic='GPL2+'
src="https://github.com/richgel999/miniz.git"
cfg='cmake'
eta='10'
dev_bra='master'
dev_vrs=''


lst_inc='miniz/*.h'
lst_lib='libminiz'
lst_bin=''
lst_lic='LICENSE README'
lst_pc='miniz.pc'

. xbuild

start

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
