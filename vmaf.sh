#!/bin/bash

lib='vmaf'
pkg='libvmaf'
dsc='Perceptual video quality assessment based on multi-method fusion'
lic='BSD-2c Patent'
src='https://github.com/Netflix/vmaf.git'

config_dir='libvmaf'
build_dir='libvmaf'

cfg='meson'
meson_config='-Denable_docs=false -Denable_tests=false'

on_config(){
    meson_config+=" -Denable_avx512=$(bool2str ${host_arm} 'false' 'true')"
}

dev_bra=''
dev_vrs='3.0.0'
pkg_deb=''
eta='52'

lst_inc='libvmaf/model.h
 libvmaf/feature.h
 libvmaf/picture.h
 libvmaf/libvmaf.h
 libvmaf/version.h
 libvmaf/compute_vmaf.h'
lst_lib='libvmaf'
lst_bin='vmaf'
lst_lic='LICENSE'
lst_pc='libvmaf.pc'

. xbuild && start

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
