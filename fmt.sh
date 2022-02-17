#!/bin/bash

lib='fmt'
dsc='A modern formatting library.'
lic='Other'
url='https://fmt.dev/'
src='https://github.com/fmtlib/fmt.git'
cfg='cmake'
eta='0'

lst_inc='fmt/*.h'
lst_lib='libfmt'
lst_bin=''
lst_lic='LICENSE.rst'
lst_pc='fmt.pc'

dev_bra='master'
dev_vrs='8.1.1'
stb_bra=''
stb_vrs=''

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# todo dual static-shared

# Filelist
# --------
# include/fmt/args.h
# include/fmt/printf.h
# include/fmt/core.h
# include/fmt/xchar.h
# include/fmt/format.h
# include/fmt/color.h
# include/fmt/format-inl.h
# include/fmt/locale.h
# include/fmt/chrono.h
# include/fmt/ostream.h
# include/fmt/os.h
# include/fmt/ranges.h
# include/fmt/compile.h
# lib/pkgconfig/fmt.pc
# lib/cmake/fmt/fmt-config-version.cmake
# lib/cmake/fmt/fmt-targets-release.cmake
# lib/cmake/fmt/fmt-config.cmake
# lib/cmake/fmt/fmt-targets.cmake
# lib/libfmt.so
# share/doc/fmt/LICENSE.rst
