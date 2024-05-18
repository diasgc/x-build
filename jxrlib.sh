#!/bin/bash

#vrs='v2019.10.9'
lib='jxrlib'
pkg='jpegxr'
dsc='JPEG XR Image Codec reference implementation library released by Microsoft'
lic='BSD-2c'
src='https://github.com/4creators/jxrlib.git'

cfg='cmake'
cmake_bin='BUILD_EXECUTABLES'
cmake_static='BUILD_STATIC_LIBS'
cmake_cmakelists='jxrlib.cmake'

lst_inc='libjxr/glue/*.h libjxr/image/*.h libjxr/common/*.h libjxr/test/*.h'
lst_lib='libjpegxr libjxrglue'
lst_bin='JxrEncApp JxrDecApp'
lst_lic='LICENSE AUTHORS'
lst_pc='jpegxr.pc jxrglue.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/jxrlib/JXRMeta.h
# include/jxrlib/JXRGlue.h
# include/jxrlib/wmspecstrings_undef.h
# include/jxrlib/JXRTest.h
# include/jxrlib/wmspecstring.h
# include/jxrlib/wmspecstrings_strict.h
# include/jxrlib/windowsmediaphoto.h
# include/jxrlib/guiddef.h
# include/jxrlib/wmspecstrings_adt.h
# include/jxrlib/wmsal.h
# lib/pkgconfig/-jxrglue.pc
# lib/pkgconfig/jpegxr.pc
# lib/libjpegxr.a
# lib/libjpegxr.so
# lib/libjxrglue.a
# lib/libjxrglue.so
# share/doc/jxrlib/LICENSE
# bin/JxrEncApp
# bin/JxrDecApp