#!/bin/bash

#vrs='2.1.1'
lib='openh264'
dsc='Open Source H.264 Codec'
lic='BSD-2c'
src='https://github.com/cisco/openh264.git'
cfg='meson'
eta='160'

lst_inc='wels/*.'
lst_lib='libopenh264'
lst_bin=''
lst_lic='LICENSE'
lst_pc='openh264.pc'

meson_cfg='-Dcpp_rtti=false -Dcpp_lib=-lc++_static'

_build_prepare(){
    $host_ndk && $build_static && sed -i 's/-lc++/-lc++_static/g' "${dir_src}/meson.build"
}

. xbuild

start

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
