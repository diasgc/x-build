#!/bin/bash

lib='vmaf'
pkg='libvmaf'
dsc='Perceptual video quality assessment based on multi-method fusion'
lic='BSD-2c Patent'
src='https://github.com/Netflix/vmaf.git'
eta='52'
config_dir="libvmaf"
meson_cfg='-Denable_docs=false -Denable_tests=false'

lst_inc='libvmaf/*.h'
lst_lib='libvmaf'
lst_bin='vmaf'
lst_lic='LICENSE'
lst_pc='libvmaf.pc'

dev_bra='main'
dev_vrs='2.3.0'
stb_bra=''
stb_vrs=''

. xbuilder.sh

$host_arm || meson_cfg+=' -Denable_avx512=true'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/libvmaf/model.h
# include/libvmaf/feature.h
# include/libvmaf/picture.h
# include/libvmaf/libvmaf.h
# include/libvmaf/version.h
# include/libvmaf/compute_vmaf.h
# lib/pkgconfig/libvmaf.pc
# lib/libvmaf.a
# bin/vmaf
