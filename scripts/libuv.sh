#!/bin/bash

lib='libuv'
apt='libuv1-dev'
dsc='Cross-platform asynchronous I/O'
lic='Other'
src='https://github.com/libuv/libuv.git'
cfg='cmake'
eta='40'

lst_inc='uv.h uv/*.h'
lst_lib='libuv'
lst_bin=''
lst_lic='LICENSE LICENSE-docs'
lst_pc='libuv.pc libuv-static.pc'

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
# include/uv/stdint-msvc2008.h
# include/uv/android-ifaddrs.h
# include/uv/tree.h
# include/uv/sunos.h
# include/uv/aix.h
# include/uv/os390.h
# include/uv/win.h
# include/uv/errno.h
# include/uv/bsd.h
# include/uv/version.h
# include/uv/threadpool.h
# include/uv/posix.h
# include/uv/linux.h
# include/uv/unix.h
# include/uv/darwin.h
# include/uv.h
# lib/pkgconfig/libuv-static.pc
# lib/pkgconfig/libuv.pc
# lib/libuv.so
# lib/libuv_a.a
# share/doc/libuv/LICENSE
