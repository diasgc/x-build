#!/bin/bash

lib='libssh2'
dsc='the SSH library'
lic='GLP-2.0'
src='https://github.com/libssh2/libssh2.git'
dep='openssl' # or Libgcrypt or mbedTLS
cfg='ar' # cmake unsupported dual static shared build
eta='72'
mki='install'

cmake_config='-DBUILD_TESTING=OFF -DINSTALL_DOCS=OFF'
cmake_bin='BUILD_EXAMPLES'

dev_bra='main'
dev_vrs='1.10.1_DEV'
stb_bra=''
stb_vrs=''

lst_inc='libssh2*.h'
lst_lib='libssh2'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='libssh2.pc'

. xbuilder.sh

on_editpack(){
    $build_man || rm -rf share/man
}

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/libssh2_sftp.h
# include/libssh2.h
# include/libssh2_publickey.h
# lib/pkgconfig/libssh2.pc
# lib/libssh2.a
# lib/libssh2.la
# lib/libssh2.so
# share/doc/libssh2/COPYING
