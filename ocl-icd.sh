#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='ocl-icd'
dsc='OpenCL ICD Loader'
lic='BSD-2c'
src="https://github.com/OCL-dev/ocl-icd.git"
cfg='ab'

dev_bra='master'
dev_vrs='2.3.2'
pkg_deb='ocl-icd-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start