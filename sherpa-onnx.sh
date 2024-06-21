#!/bin/bash

lib='sherpa-onnx'
dsc='Speech-to-text, text-to-speech, and speaker recognition using next-gen Kaldi with onnxruntime without Internet connection'
lic='Apache License 2.0'
src="https://github.com/k2-fsa/sherpa-onnx.git"
#sub=''
#src_opt=''
#src_rel=true|false

cfg='cmake'
cmake_bin='SHERPA_ONNX_ENABLE_BINARY'
cmake_config='-DSHERPA_ONNX_ENABLE_TTS=ON
 -DBUILD_PIPER_PHONMIZE_EXE=OFF
 -DBUILD_PIPER_PHONMIZE_TESTS=OFF
 -DBUILD_ESPEAK_NG_EXE=OFF
 -DBUILD_ESPEAK_NG_TESTS=OFF
 -DSHERPA_ONNX_ENABLE_PYTHON=OFF
 -DSHERPA_ONNX_ENABLE_TESTS=OFF
 -DSHERPA_ONNX_ENABLE_CHECK=OFF
 -DSHERPA_ONNX_ENABLE_PORTAUDIO=OFF'

on_config_ndk(){
    cmake_config+=' -DSHERPA_ONNX_ENABLE_JNI=ON -DSHERPA_ONNX_ENABLE_C_API=OFF'
}

dev_bra='master'
dev_vrs='1.10.0'
pkg_deb=''
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc
