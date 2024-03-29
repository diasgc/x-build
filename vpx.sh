#!/bin/bash

lib='vpx'
dsc='WebM Project VPx codec implementation'
lic='BSD-3c'
src='https://chromium.googlesource.com/webm/libvpx.git'
cfg='ac'
eta='240'
mki='install'

#ac_bin='--disable-examples|--enable-examples'
ac_opts='--no-host --no-pic --no-sysroot'
ac_config='--disable-docs --disable-install-srcs --disable-install-docs --disable-tools --disable-unit-tests'
  #--enable-vp8 --enable-vp9 --enable-vp9-highbitdepth --enable-vp9-temporal-denoising --enable-vp9-postproc \
  #--enable-postproc --enable-onthefly-bitpacking --enable-multi-res-encoding --enable-better-hw-compatibility \
  #--enable-webm-io --enable-libyuv --enable-experimental --enable-pic "

lst_inc='vpx/*.h'
lst_lib='libvpx'
lst_bin='vpxenc vpxdec'
lst_lic='LICENSE PATENTS AUTHORS'
lst_pc='vpx.pc'

dev_vrs='1.14.0'

. xbuild

$build_shared && unset CSH #--enable-shared only supported on ELF, OS/2, and Darwin for now

t2=$(arch_fromid arm64 armv7 x86 x86_64)
$host_x86 && t3=$(os_fromid android linux win32) || t3=$(os_fromid android linux win64)
ac_config+=" --target=${t2}-${t3}-gcc"

$host_arm && ac_config+=" --enable-neon"
$host_arm32 && ac_config+=" --disable-neon-asm"
AS=${YASM}

start

# cpu av8 av7 x86 x64
# NDK +X+  .   .   .  clang
# GNU +..  .   .   .  gcc
# WIN +..  .   .   .  clang/gcc

# Filelist
# --------
# share/doc/vpx/LICENSE
# share/doc/vpx/PATENTS
# share/doc/vpx/AUTHORS
# include/vpx/vpx_ext_ratectrl.h
# include/vpx/vpx_codec.h
# include/vpx/vp8dx.h
# include/vpx/vpx_encoder.h
# include/vpx/vpx_decoder.h
# include/vpx/vp8.h
# include/vpx/vpx_integer.h
# include/vpx/vp8cx.h
# include/vpx/vpx_frame_buffer.h
# include/vpx/vpx_image.h
# bin/vpxdec
# bin/vpxenc
# lib/pkgconfig/vpx.pc
# lib/libvpx.a
