#!/bin/bash

lib='aom'
apt='libaom0'
dsc='Alliance for Open Media AV1 codec'
lic='BSD-2c'
src='https://aomedia.googlesource.com/aom.git'
cfg='cmake'
tls='perl'
eta='240'

dev_bra='main'
dev_vrs='3.2.0'
stb_bra='tags/v3.2.0'
stb_vrs='v3.2.0'

lst_inc='aom/*.h'
lst_lib='libaom'
lst_bin='aomdec aomenc'
lst_lic='LICENSE PATENTS AUTHORS'
lst_pc='aom.pc'

vremote(){
     git ls-remote -t "$src" | grep -o 'v.*' | tail -n1
}

. xbuilder.sh

cmake_static='CONFIG_STATIC=0|CONFIG_STATIC=1'
cmake_bin='ENABLE_EXAMPLES'
cmake_config='-DENABLE_TESTS=OFF
     -DENABLE_TOOLS=OFF
     -DENABLE_TESTDATA=OFF
     -DENABLE_DOCS=OFF'

$host_arm && cmake_config+=" -DCONFIG_RUNTIME_CPU_DETECT=0 -DAS_EXECUTABLE=${AS}"
$host_arm64 && cmake_config+=" -DAOM_NEON_INTRIN_FLAG="
$host_arm32 && cmake_config+=" -DAOM_NEON_INTRIN_FLAG=-mfpu=neon"
$host_x86 && cmake_config+=' -DCMAKE_C_COMPILER_ARG1=-m32 -DCMAKE_CXX_COMPILER_ARG1=-m32'
$host_mingw && cmake_config+=" -DCONFIG_PIC=1"

start

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
