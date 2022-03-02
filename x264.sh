#!/bin/bash

lib='x264'
dsc='x264, the best and fastest H.264 encoder'
lic='GPL-2.0'
src='https://code.videolan.org/videolan/x264.git'
cfg='ac'

build_strip=false
ac_nopic=true
ac_nosysroot=true
ac_bin="--disable-cli| "
ac_config="--enable-lto --enable-pic --enable-strip"
mkc='clean'
mki='install'

dev_vrs='0.164.3094M'
lst_inc='x264.h x264_config.h'
lst_lib='libx264'
lst_bin='x264'
lst_lic='COPYING AUTHORS'
lst_pc='x264.pc'

eta='60'

. xbuild

$host_x64 && AS=nasm || ac_config+=" --disable-asm"

start

<<'XB64_PATCH'
LS0tIGNvbW1vbi9jcHUuY28JMjAyMi0wMS0xMSAxOTowMzo1NC4xNTkyNzU2MDAgKzAwMDAKKysr
IGNvbW1vbi9jcHUuYwkyMDIyLTAxLTExIDE5OjAzOjI3Ljk5OTI3NTYwMCArMDAwMApAQCAtNDM4
LDYgKzQzOCw3IEBACiAKICNlbGlmIFNZU19MSU5VWAogI2lmZGVmIF9fQU5EUk9JRF9fCisjaW5j
bHVkZSA8c3lzL3N5c2NvbmYuaD4KICAgICAvLyBBbmRyb2lkIE5ESyBkb2VzIG5vdCBleHBvc2Ug
c2NoZWRfZ2V0YWZmaW5pdHkKICAgICByZXR1cm4gc3lzY29uZiggX1NDX05QUk9DRVNTT1JTX0NP
TkYgKTsKICNlbHNlCg==
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU  .   .   .   .  gcc
# WIN +++ +++  .  +++ clang/gcc

# Filelist
# --------
# include/x264.h
# include/x264_config.h
# lib/pkgconfig/x264.pc
# lib/libx264.a
# lib/libx264.so.164
# bin/x264
