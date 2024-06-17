#!/bin/bash

lib='libffi'
dsc='A portable foreign-function interface library'
lic='Free'
src='https://github.com/libffi/libffi.git'
url='https://sourceware.org/libffi/'

cfg='ar'
am_config='--enable-portable-binary --disable-docs'

dev_bra=''
dev_vrs=''
pkg_deb='libffi-dev'
eta='15'

lst_inc='ffitarget.h ffi.h'
lst_lib='libffi'
lst_bin=''
lst_lic='LICENSE LICENSE-BUILDTOOLS'
lst_pc='libffi.pc'



. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/ffitarget.h
# include/ffi.h
# lib/pkgconfig/libffi.pc
# lib/libffi.a
# lib/libffi.la
# lib/libffi.so
# share/man/man3/ffi_prep_cif_var.3
# share/man/man3/ffi.3
# share/man/man3/ffi_call.3
# share/man/man3/ffi_prep_cif.3
# share/doc/libffi/LICENSE
# share/doc/libffi/LICENSE-BUILDTOOLS
