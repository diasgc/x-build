#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU  .   .   .   .  gcc
# WIN +++ +++  .  +++ clang/gcc

lib='x264'
dsc='x264, the best and fastest H.264 encoder'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/x264.git'
cfg='ac'
eta='60'
ac_nopic=true
ac_nosysroot=true
cb0="disable-cli"
cb1=
lst_inc='x264.h x264_config.h'
lst_lib='libx264'
lst_bin='x264'
mkc='clean'
mki='install'

. xbuilder.sh

CFG="--enable-lto --enable-pic --enable-strip"
#$host_cross && CFG+=" --sysroot=${SYSROOT}" #--cross-prefix=${CROSS_PREFIX}"
$host_x64 && AS=nasm || CFG+=" --disable-asm"
build_strip=false

start

<<'XB64_PATCH'
LS0tIGNvbW1vbi9jcHUuY28JMjAyMi0wMS0xMSAxOTowMzo1NC4xNTkyNzU2MDAgKzAwMDAKKysr
IGNvbW1vbi9jcHUuYwkyMDIyLTAxLTExIDE5OjAzOjI3Ljk5OTI3NTYwMCArMDAwMApAQCAtNDM4
LDYgKzQzOCw3IEBACiAKICNlbGlmIFNZU19MSU5VWAogI2lmZGVmIF9fQU5EUk9JRF9fCisjaW5j
bHVkZSA8c3lzL3N5c2NvbmYuaD4KICAgICAvLyBBbmRyb2lkIE5ESyBkb2VzIG5vdCBleHBvc2Ug
c2NoZWRfZ2V0YWZmaW5pdHkKICAgICByZXR1cm4gc3lzY29uZiggX1NDX05QUk9DRVNTT1JTX0NP
TkYgKTsKICNlbHNlCg==
XB64_PATCH

# Filelist
# --------
# include/x264.h
# include/x264_config.h
# lib/pkgconfig/x264.pc
# lib/libx264.a
# lib/libx264.so.164
# bin/x264
