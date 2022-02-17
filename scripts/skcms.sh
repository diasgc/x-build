#!/bin/bash

lib='skcms'
dsc='PNG encoder and decoder in C and C++'
lic='BSD-3c'
src='(https://skia.googlesource.com/skcms'
cfg='bazel'
eta='10'

. xbuilder.sh

build_all(){

}

start

# cpu av8 av7 x86 x64
# NDK ... ... ... ... CLANG
# GNU ... ... ... ... GCC
# WIN ... ... ... ... CLANG/GCC