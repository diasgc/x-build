#!/bin/bash

lib='aom'
dsc='Alliance for Open Media AV1 codec'
lic='BSD-2c'
src='https://aomedia.googlesource.com/aom.git'
tls='perl'

cfg='cmake'
cmake_static='CONFIG_STATIC'
cmake_bin='ENABLE_EXAMPLES'
cmake_config='-DENABLE_TESTS=OFF
 -DENABLE_TOOLS=OFF
 -DENABLE_TESTDATA=OFF
 -DENABLE_DOCS=OFF'

dev_bra='main'
dev_vrs='3.9.0'
pkg_deb='libaom-dev'
eta='240'

lst_inc='aom/aom_decoder.h aom/aom_integer.h
 aom/aom_external_partition.h
 aom/aom_frame_buffer.h aom/aom_image.h
 aom/aom.h aom/aom_encoder.h aom/aomcx.h
 aom/aom_codec.h aom/aomdx.h'
lst_lib='libaom'
lst_pc='aom.pc'
lst_bin='aomdec aomenc'
lst_lic='LICENSE PATENTS AUTHORS'

. xbuild && start

# v3.2.0      a8  a7  x86 x64
# ndk-clang   +++ +++ +++ +++
# linux-gnu   +++ +++ ... +.+
# mingw-llvm  +.+ ... ... +.++


# Filelist
# --------
# include/aom/aom_decoder.h
# include/aom/aom_integer.h
# include/aom/aom_external_partition.h
# include/aom/aom_frame_buffer.h
# include/aom/aom_image.h
# include/aom/aom.h
# include/aom/aom_encoder.h
# include/aom/aomcx.h
# include/aom/aom_codec.h
# include/aom/aomdx.h
# lib/libaom.a
# lib/pkgconfig/aom.pc
# lib/libaom.so
# share/doc/aom/PATENTS
# share/doc/aom/LICENSE
# share/doc/aom/AUTHORS
# bin/aomdec
# bin/aomenc
