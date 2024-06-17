#!/bin/bash

lib='openh264'
dsc='Open Source H.264 Codec'
lic='BSD-2c'
src='https://github.com/cisco/openh264.git'

cfg='meson'
meson_config='-Dcpp_rtti=false'

on_config_ndk(){
    ${build_static} && meson_config+=' -Dcpp_lib=-lc++_static'
}

dev_bra='master'
dev_vrs='2.4.1'
pkg_deb='libopenh264-dev'
eta='160'

lst_inc='wels/codec_api.h
 wels/codec_ver.h
 wels/codec_def.h
 wels/codec_app_def.h'
lst_lib='libopenh264'
lst_bin=''
lst_lic='LICENSE'
lst_pc='openh264.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/wels/codec_api.h
# include/wels/codec_ver.h
# include/wels/codec_def.h
# include/wels/codec_app_def.h
# lib/pkgconfig/openh264.pc
# lib/libopenh264.a
# lib/libopenh264.so
# share/doc/openh264/LICENSE
