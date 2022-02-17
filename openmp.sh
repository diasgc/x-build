#!/bin/bash
# todo patch to support dual static-shared build and pc config

lib='openmp'
dsc='LLVM-OpenMP library'
lic='Apache-2.0'
src='https://github.com/llvm-mirror/openmp.git'
cfg='cmake'
eta='0'
API=26 # min ndk api required

lst_inc='ompt.h omp.h omp-tools.h'
lst_lib='libomp libomptarget'
lst_bin=''
lst_lic='LICENSE.txt'
lst_pc=''
pc_llibs="-lomp -lomptarget"

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ompt.h
# include/omp.h
# include/omp-tools.h
# lib/libomp.so
# lib/libomptarget.so
# share/doc/openmp/LICENSE.txt
