#!/bin/bash

lib='avm'
pkg='aom'
dsc='AVM (AOM Video Model) is the reference software for next codec from Alliance for Open Media'
lic='BSD-3c'
src="https://gitlab.com/AOMediaCodec/avm.git"
cfg='cmake'

cmake_shared='CONFIG_SHARED'
cmake_bin='ENABLE_TOOLS'
cmake_config='-DENABLE_DOCS=OFF -DENABLE_EXAMPLES=OFF -DENABLE_TESTS=OFF -DENABLE_TESTDATA=OFF'

dev_bra='master'
dev_vrs='7.0.1'
pkg_deb=''
eta='40'

lst_inc='aom/aom.h
 aom/aom_codec.h
 aom/aom_frame_buffer.h
 aom/aom_image.h
 aom/aom_integer.h
 aom/aom.h
 aom/aom_decoder.h
 aom/aomdx.h
 aom/aomcx.h
 aom/aom_encoder.h'
lst_lib='libaom'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

on_config_ndk(){
    cmake_include_directories+=("${ANDROID_NDK_HOME}/sources/android/cpufeatures")
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  +   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc