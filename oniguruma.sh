#!/bin/bash

lib='oniguruma'
dsc='Regular expression library'
lic='BSD-2c'
src='https://github.com/kkos/oniguruma.git'
cfg='cmake'
patch="oniguruma-01"


dev_bra='master'
dev_vrs='6.9.7'
pkg_deb=''
eta='30'

lst_inc='oniggnu.h oniguruma.h'
lst_lib='libonig'
lst_bin='onig-config'
lst_lic='COPYING AUTHORS'
lst_pc='oniguruma.pc'

cmake_config='-DINSTALL_DOCUMENTATION=OFF'
cmake_static='BUILD_STATIC_LIBS'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/oniggnu.h
# include/oniguruma.h
# lib/pkgconfig/oniguruma.pc
# lib/libonig.a
# lib/cmake/oniguruma/onigurumaConfig.cmake
# lib/cmake/oniguruma/onigurumaTargets-release.cmake
# lib/cmake/oniguruma/onigurumaConfigVersion.cmake
# lib/cmake/oniguruma/onigurumaTargets.cmake
# lib/libonig.so
# share/doc/oniguruma/AUTHORS
# share/doc/oniguruma/COPYING
# bin/onig-config
