#!/bin/bash

lib='density'
dsc='Small & portable byte-aligned LZ77 compression'
lic='BSD-3c'
sub='submodule update --init --recursive'
#vrs='0.14.2'
src='https://github.com/k0dai/density.git'
cfg='cmake'
eta='30'
pc_llib='-ldensity'
pc_url='https://github.com/k0dai/density'

dev_bra='main'
dev_vrs='0.14.2'
stb_bra=''
stb_vrs=''

lst_inc='density/*.h'
lst_lib='libdensity'
lst_bin='benchmark'
lst_lic='LICENSE.md'
lst_pc='density.pc'

cmake_static='BUILD_STATIC_LIBS'
cmake_config="-DBUILD_BENCHMARK=ON"

_source_config(){
  git submodule update --init --recursive
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++ .   .  clang
# GNU +++ +++ .  +++ gcc
# WIN +++ .   .  +++ clang/gcc



# Filelist
# --------
# include/density/lion_encode.h
# include/density/globals.h
# include/density/algorithms.h
# include/density/buffer.h
# include/density/dictionaries.h
# include/density/lion_decode.h
# include/density/cheetah_encode.h
# include/density/lion.h
# include/density/lion_form_model.h
# include/density/chameleon_dictionary.h
# include/density/chameleon_encode.h
# include/density/cheetah.h
# include/density/cheetah_decode.h
# include/density/cheetah_dictionary.h
# include/density/lion_dictionary.h
# include/density/header.h
# include/density/chameleon_decode.h
# include/density/chameleon.h
# include/density/density_api.h
# lib/pkgconfig/density.pc
# lib/libdensity.a
# lib/libdensity.so
# share/doc/density/LICENSE.md
# bin/benchmark
