#!/bin/bash

lib='libplacebo'
dsc='Reusable library for GPU-accelerated image/video processing primitives and shaders'
lic='LGLP-2.1'
src='https://code.videolan.org/videolan/libplacebo.git'
sub='submodule update --init'
tls='python3-mako'

cfg='meson'
meson_cfg="-Ddemos=false"

dev_bra='main'
dev_vrs='7.349.0'
pkg_deb='libplacebo-dev'
eta='60'

on_config_ndk(){
    dep='glslang vulkan'
    meson_cfg+=" -Dvulkan-registry=${dir_install}/share/vulkan/registry/vk.xml";;
}

on_config(){
    $use_clang || LD="bfd"
}

lst_inc='libplacebo/*.h libplacebo/utils/*.h'
lst_lib='libplacebo'
lst_bin=''
lst_lic='LICENSE'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU ++   .   .  ++  gcc
# WIN ++   .   .  ++  clang/gcc

# Filelist
# --------
# include/libplacebo/config.h
# include/libplacebo/swapchain.h
# include/libplacebo/dither.h
# include/libplacebo/filters.h
# include/libplacebo/shaders.h
# include/libplacebo/log.h
# include/libplacebo/dispatch.h
# include/libplacebo/shaders/custom.h
# include/libplacebo/shaders/film_grain.h
# include/libplacebo/shaders/colorspace.h
# include/libplacebo/shaders/lut.h
# include/libplacebo/shaders/sampling.h
# include/libplacebo/vulkan.h
# include/libplacebo/gpu.h
# include/libplacebo/renderer.h
# include/libplacebo/common.h
# include/libplacebo/dummy.h
# include/libplacebo/context.h
# include/libplacebo/utils/libav_internal.h
# include/libplacebo/utils/dav1d.h
# include/libplacebo/utils/libav.h
# include/libplacebo/utils/upload.h
# include/libplacebo/utils/frame_queue.h
# include/libplacebo/utils/dav1d_internal.h
# include/libplacebo/colorspace.h
# lib/pkgconfig/libplacebo.pc
# lib/libplacebo.so
# lib/libplacebo.a
# share/doc/libplacebo/LICENSE