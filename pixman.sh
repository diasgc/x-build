#!/bin/bash

lib='pixman'
apt='libpixman-1-dev'
pkg='pixman-1'
dsc='Pixel-manipulation library for X and cairo'
lic='GPL-2.0'
src='https://github.com/freedesktop/pixman.git'
cfg='ag'
dep='libpng'
eta='275'

. xbuild

dev_vrs='0.40.1'

lst_inc='pixman-1/*.h'
lst_lib='libpixman-1'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='pixman-1.pc'

$host_arm64 && ac_config='--disable-arm-a64-neon'
$host_arm32 && ac_config='--disable-arm-neon --disable-arm-simd'
$use_clang && WFLAGS='-Wunknown-attributes'

before_make(){
    sed -i 's/-g -O2/-O3 -flto/g;s/-Wall -W/-W/g' Makefile pixman/Makefile
}

start

<<'LZS_PATCH'
LQgEAcEsA8FsEMB2B6KcnHgJ1gOgMYD2AkAEwAMppw5AjDQKyi2kBcdrALAMy6cDs3csJGgA1CPIAoMbIgwEKNIsw4
CZStTqNmbcgA5Wtfrm4Ny3brU7DxkqQAEHoYAE4AbABpSr8R8+0tKBOUqChAMQApgA2kABmoAAmkXGQiJGJABQA+tk
AggByACIASgDyAJJFuQCUoAA+9UkpaRmZhaWVRXXIAFSgeYiJWISQiaC9yKFSwOFp+NEArsmgADz44IvAcZHwAC6LW
JEAzrgAFgB806DHe/uQ+KDYsNkbi9k7+4cn2XuhyXtIvg9q9Nh9dgcjsdQJkAG6jRI1UIAbxmoHRTxwoPen0hPz2oF
x32hAF5QOQANxojGDYYIgDCmwAYvBYJBogBPUBvD6s9kcqnADGgRZpPbuTi/blgolQwXU9E8uJ8zmgMlIOljbIAc0i
e0ZixZbM5mRqguFSohxLVTyGIy1uv1zKtUNN8qFGPiMKVKq5JLJHXKVWy9IACgBVbJMvIAWQqABkAJr5EoxpEe9Go4
DEL2ZS1fKGgABkA2KQeqYcjeVTUYAonkACrhkq1lMx2H8dPEYWyk4NAM1gBq/HdOYSeZlLr7JcDXRDEbbdcbzdbg6Z
odh3C7Pan0PqA5j2TXodHufzeOhM7Lc8ri6Z9abLeyBVrZQK24xvb3B+fr4K5oxABfGRhWebFwQLfFCV3G12iHfgGg
GId10Q6tDxfN8zWuYUjkhRBoMg44qVAYCgA=
LZS_PATCH

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/pixman-1/pixman-version.h
# include/pixman-1/pixman.h
# lib/pkgconfig/pixman-1.pc
# lib/libpixman-1.a
# lib/libpixman-1.la
# lib/libpixman-1.so
# share/doc/pixman/AUTHORS
# share/doc/pixman/COPYING


