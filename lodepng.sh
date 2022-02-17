#!/bin/bash

lib='lodepng'
dsc='PNG encoder and decoder in C and C++'
lic='ZLib'
src='https://github.com/lvandeve/lodepng.git'
cfg='mk'
dep='sdl2'
eta='10'

. xbuilder.sh

pushvar_f CXXFLAGS $(./sdl2.sh --get cflags)
pushvar_f LDFLAGS $(./sdl2.sh --get ldstatic)
start

# cpu av8 av7 x86 x64
# NDK ... ... ... ... CLANG
# GNU ... ... ... ... GCC
# WIN ... ... ... ... CLANG/GCC