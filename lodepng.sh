#!/bin/bash

lib='lodepng'
dsc='PNG encoder and decoder in C and C++'
lic='ZLib'
src='https://github.com/lvandeve/lodepng.git'
url='http://lodev.org/lodepng/'
dep='sdl2'

cfg='make'

dev_bra='master'
dev_vrs='0.0'
pkg_deb='liblodepng-dev'
eta='10'

. xbuild && start

#pushvar_f CXXFLAGS $(./sdl2.sh --get cflags)
#pushvar_f LDFLAGS $(./sdl2.sh --get ldstatic)


# cpu av8 av7 x86 x64
# NDK ... ... ... ... CLANG
# GNU ... ... ... ... GCC
# WIN ... ... ... ... CLANG/GCC