#!/bin/bash

lib='lerc'
pkg='Lerc'
dsc='Limited Error Raster Compression'
lic='BSD/GPL-2.0'
src='https://github.com/Esri/lerc.git'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
eta='134'

lst_inc='Lerc_c_api.h Lerc_types.h'
lst_lib='libLerc'
lst_bin=''
lst_lic='LICENSE NOTICE'
lst_pc='Lerc.pc'

dev_vrs='4.0.0'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/Lerc_c_api.h
# include/Lerc_types.h
# lib/pkgconfig/Lerc.pc
# lib/libLerc.so
# lib/libLerc.a
# share/doc/lerc/LICENSE
# share/doc/lerc/NOTICE
