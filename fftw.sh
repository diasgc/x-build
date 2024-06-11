#!/bin/bash

lib='fftw'
pkg='fftw3'
pkg_deb='fftw-dev'
dsc='Library for computing Fourier transforms (version 3.x)'
lic='GPL-3.0'
vrs='3.3.10'
src="http://fftw.org/fftw-${vrs}.tar.gz"
cfg='cmake'
eta='120'
cmake_config="-DBUILD_TESTS=OFF -DENABLE_THREADS=ON -DWITH_COMBINED_THREADS=ON"

dev_vrs='3.3.9'

lst_inc='fftw3.h fftw3.f fftw3.f03 fftw3q.f03 ftw3l.f03'
lst_lib='libfftw3'
lst_bin=''
lst_lic='COPYING COPYRIGHT AUTHORS'
lst_pc='fftw3.pc'

extraOpts(){
  case $1 in
    -f|--float ) cmake_config+=" -DENABLE_FLOAT=ON" pkg='fftwf' pclib='-lfftwf';;
    -l|--long )  cmake_config+=" -DENABLE_LONG_DOUBLE=ON" pkg='fftwl' pclib='-lfftwl';;
    -q|--quad )  cmake_config+=" -DENABLE_QUAD_PRECISION=ON" pkg='fftwq' pclib=='-lfftwq';;
    *) pclib=
  esac
}

on_config(){
  $host_arm || cmake_config+=" -DENABLE_SSE=ON -DENABLE_SSE2=ON -DENABLE_AVX=ON -DENABLE_AVX2=ON"
}

on_create_pc(){
  build_pkgconfig --libs=${pclib}
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK PP   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/fftw3.f
# include/fftw3l.f03
# include/fftw3.f03
# include/fftw3q.f03
# include/fftw3.h
# share/doc/fftw/AUTHORS
# lib/cmake/fftw3/FFTW3Config.cmake
# lib/cmake/fftw3/FFTW3ConfigVersion.cmake
# lib/cmake/fftw3/FFTW3LibraryDepends-release.cmake
# lib/cmake/fftw3/FFTW3LibraryDepends.cmake
# lib/libfftw3.so
# lib/pkgconfig/fftw3.pc
