#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libpng'
dsc='Portable Network Graphics support'
lic='As Is'
src='https://git.code.sf.net/p/libpng/code' sty='git'
cfg='cmake'
dep='zlib'

mki='install/strip'
cmake_static="PNG_STATIC"
cmake_shared="PNG_SHARED"
cmake_bin="PNG_EXECUTABLES"

lst_inc='pnglibconf.h png.h pngconf.h libpng16/*.h'
lst_lib='libpng libpng16'
lst_bin='png-fix-itxt libpng16-config pngfix'
lst_lic='LICENSE AUTHORS'
lst_pc='libpng16.pc'

eta='20'

. xbuilder.sh

cmake_config="-DPNG_TESTS=OFF -DPNG_HARDWARE_OPTIMIZATIONS=OFF -DHAVE_LD_VERSION_SCRIPT=OFF"

start

# Filelist
# --------
# include/pnglibconf.h
# include/png.h
# include/libpng16/pnglibconf.h
# include/libpng16/png.h
# include/libpng16/pngconf.h
# include/pngconf.h
# lib/libpng.so
# lib/pkgconfig/libpng16.pc
# lib/libpng/libpng16-release.cmake
# lib/libpng/libpng16.cmake
# lib/libpng16.a
# lib/libpng.a
# lib/libpng16.so
# share/man/man5/png.5
# share/man/man3/libpng.3
# share/man/man3/libpngpf.3
# share/doc/libpng/LICENSE
# share/doc/libpng/AUTHORS
# bin/png-fix-itxt
# bin/libpng16-config
# bin/pngfix
