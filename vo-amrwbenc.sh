#!/bin/bash

lib='vo-amrwbenc'
apt='libvo-amrwbenc-dev'
dsc='VisualOn Adaptive Multi-Rate Wideband speech codec library'
lic='Apache-2.0'
src='https://github.com/mstorsjo/vo-amrwbenc.git'
cfg='ar'

ac_bin='--disable-example|--enable-example'
ac_config='--disable-maintainer-mode'

lst_inc='vo-amrwbenc/enc_if.h'
lst_lib='libvo-amrwbenc'
lst_bin='amrwb-enc'
lst_lic='COPYING NOTICE'
lst_pc='vo-amrwbenc.pc'

dev_vrs='0.1.3'

eta='17'

. xbuild

[ "$arch" == "arm-linux-androideabi" ] && ac_config+=" --enable-armv7neon=yes"

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# Filelist
# --------
# include/vo-amrwbenc/enc_if.h
# lib/pkgconfig/vo-amrwbenc.pc
# lib/libvo-amrwbenc.so
# lib/libvo-amrwbenc.a
# lib/libvo-amrwbenc.la
# share/doc/vo-amrwbenc/NOTICE
# share/doc/vo-amrwbenc/COPYING
# bin/amrwb-enc

<<'CMakeLists.txt'

file(GLOB src_enc wrapper.c common/cmnMemory.c amrwbenc/src/*.c)
set(hdr_public enc_if.h)
include_directories(common/include amrwbenc/inc)

if (ARMV7NEON)
    add_definitions(-DARM -DARMV7 -DASM_OPT)
    file(GLOB src_enc_armv7neon amrwbenc/src/asm/ARMV7/*.s)
    list(APPEND src_enc ${src_enc_armv7neon})
elseif(ARMV5E)
    add_definitions(-DARM -DASM_OPT)
    file(GLOB src_enc_armv5e amrwbenc/src/asm/ARMV5E/*.s)
endif()

set(ldflags -version-info @VO_AMRWBENC_VERSION@ -no-undefined -export-symbols $(top_srcdir)/vo-amrwbenc.sym)

add_library(amrwb-enc OBJECT ${src_enc})

if(EXAMPLE)
    add_executable(amrwb-enc amrwb-enc.c wavreader.c wavreader.h)
    target_link_libraries(amrwb-enc )
endif()
CMakeLists.txt