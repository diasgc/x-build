#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libcamera'
dsc='libcamera - Making complex cameras easy'
lic='Other'
src="https://git.libcamera.org/libcamera/libcamera.git"
patch='libcamera-0.3.0'
tls='python3 python-jinja2 python3-ply'

cfg='meson'
meson_cfg='-Dcam=disabled -Ddocumentation=disabled -Dgstreamer=disabled -Dqcam=disabled -Dtracing=disabled'

dev_bra='master'
dev_vrs='0.2.0'
pkg_deb='libcamera-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

on_config_ndk(){
    meson_cfg='-Dandroid=enabled -Dudev=disabled'
    CFLAGS+=' -Wno-vla-cxx-extension'
}

. xbuild && start