#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .   clang
# GNU  .   .   .   .   clang/gcc
# WIN  +   .   .   .   clang

lib='svtav1'
pkg='SvtAv1Enc'
dsc='Scalable Video Technology for AV1 (SVT-AV1 Encoder and Decoder)'
lic='BSD-3c AOM-Patent'
src='https://gitlab.com/AOMediaCodec/SVT-AV1.git'

cfg='cmake'
cmake_bin="BUILD_APPS"
cmake_config="-DBUILD_TESTING=OFF"
cmake_definitions=( -Wno-unused-command-line-argument -Wno-implicit-function-declaration )

on_config_ndk() {
    LDFLAGS+=" -llog"
}

dev_bra='master'
dev_vrs='2.1.0'
pkg_deb='libsvtav1-dev'
eta='145'

lst_inc='svt-av1/*.h'
lst_lib='libSvtAv1Dec libSvtAv1Enc'
lst_bin='SvtAv1DecApp SvtAv1EncApp'
lst_lic='LICENSE.md LICENSE-BSD2.md PATENTS.md'
lst_pc='SvtAv1Enc.pc SvtAv1Dec.pc'

. xbuild && start

# Filelist
# --------
# include/svt-av1/EbDebugMacros.h
# include/svt-av1/EbSvtAv1Formats.h
# include/svt-av1/EbSvtAv1ExtFrameBuf.h
# include/svt-av1/EbSvtAv1Enc.h
# include/svt-av1/EbSvtAv1ErrorCodes.h
# include/svt-av1/EbSvtAv1Metadata.h
# include/svt-av1/EbSvtAv1.h
# include/svt-av1/EbSvtAv1Dec.h
# lib/pkgconfig/SvtAv1Enc.pc
# lib/pkgconfig/SvtAv1Dec.pc
# lib/libSvtAv1Dec.so
# lib/libSvtAv1Enc.a
# lib/libSvtAv1Enc.so
# lib/libSvtAv1Dec.a
# share/docs/SvtAv1/README.md
# share/docs/SvtAv1/LICENSE-BSD2.md
# share/docs/SvtAv1/PATENTS.md
# share/docs/SvtAv1/LICENSE.md
# bin/SvtAv1DecApp
# bin/SvtAv1EncApp
