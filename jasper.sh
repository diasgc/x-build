#!/bin/bash

# TODO patch src/libjasper/CMakeLists.txt to support dual static-shared build

lib='jasper'
apt='jasper'
dsc='Image Processing/Coding Tool Kit'
lic='JasPer'
src='https://github.com/mdadams/jasper.git'
cfg='cmake'
eta='26'

cmake_static="BUILD_STATIC_LIBS"
cmake_bin="JAS_ENABLE_PROGRAMS"
cmake_config="-DBUILD_TESTING=OFF -DJAS_ENABLE_DOC=OFF -DJAS_STDC_VERSION=20220220"

dev_bra='master'
dev_vrs='3.0.3'

lst_inc='jasper/*.h'
lst_lib='libjasper'
lst_bin='jasper multithread imgcmp imginfo'
lst_lic='COPYRIGHT.txt LICENSE.txt'
lst_pc='jasper.pc'

on_config_mingw(){
    cmake_config="-DWITH_STACK_PROTECTOR=OFF"
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# bin/imgcmp
# bin/imginfo
# bin/jasper
# include/jasper/jas_cm.h
# include/jasper/jas_compiler.h
# include/jasper/jas_config.h
# include/jasper/jas_debug.h
# include/jasper/jas_dll.h
# include/jasper/jas_export_cmake.h
# include/jasper/jas_fix.h
# include/jasper/jas_getopt.h
# include/jasper/jas_icc.h
# include/jasper/jas_image.h
# include/jasper/jas_init.h
# include/jasper/jas_log.h
# include/jasper/jas_malloc.h
# include/jasper/jas_math.h
# include/jasper/jas_seq.h
# include/jasper/jas_stream.h
# include/jasper/jas_string.h
# include/jasper/jas_thread.h
# include/jasper/jas_tmr.h
# include/jasper/jas_tvp.h
# include/jasper/jas_types.h
# include/jasper/jas_version.h
# include/jasper/jasper.h
# lib/libjasper.a
# lib/libjasper.so
# lib/pkgconfig/jasper.pc
# share/doc/JasPer/README.md
# share/doc/jasper/COPYRIGHT.txt
# share/doc/jasper/LICENSE.txt
# share/man/man1/imgcmp.1
# share/man/man1/imginfo.1
# share/man/man1/jasper.1
