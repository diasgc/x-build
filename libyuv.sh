#!/bin/bash

lib='libyuv'
dsc='Libyuv is an open source project that includes YUV scaling and conversion functionality'
lic='BSD-3c'
src='https://chromium.googlesource.com/libyuv/libyuv.git'
cfg='cmake'
dep='libjpeg'
eta='90'

dev_vrs='1887'
pc_llib='-lyuv'
pc_libsprivate='-lpthread -ljpeg'

lst_inc='libyuv.h libyuv/*.h'
lst_lib='libyuv'
lst_bin='yuvconvert'
lst_lic='LICENSE PATENTS OWNERS AUTHORS'
lst_pc='libyuv.pc'

. xbuild

LDFLAGS+=" -ljpeg"

get_version(){
    echo $(cat ${dir_src}/include/libyuv/version.h | grep -oP 'LIBYUV_VERSION \K[0-9]+')
}

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/libyuv.h
# include/libyuv/loongson_intrinsics.h
# include/libyuv/rotate_argb.h
# include/libyuv/macros_msa.h
# include/libyuv/scale.h
# include/libyuv/scale_argb.h
# include/libyuv/convert_argb.h
# include/libyuv/compare_row.h
# include/libyuv/row.h
# include/libyuv/planar_functions.h
# include/libyuv/scale_uv.h
# include/libyuv/scale_row.h
# include/libyuv/convert_from.h
# include/libyuv/version.h
# include/libyuv/convert.h
# include/libyuv/cpu_id.h
# include/libyuv/convert_from_argb.h
# include/libyuv/mjpeg_decoder.h
# include/libyuv/compare.h
# include/libyuv/rotate_row.h
# include/libyuv/rotate.h
# include/libyuv/basic_types.h
# include/libyuv/video_common.h
# lib/pkgconfig/libyuv.pc
# lib/libyuv.so
# lib/libyuv.a
# share/doc/libyuv/PATENTS
# share/doc/libyuv/LICENSE
# share/doc/libyuv/AUTHORS
# share/doc/libyuv/OWNERS
# bin/yuvconvert