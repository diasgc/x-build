#!/bin/bash

lib='libyuv'
dsc='Libyuv is an open source project that includes YUV scaling and conversion functionality'
lic='BSD-3c'
src='https://chromium.googlesource.com/libyuv/libyuv.git'
cfg='cmake'
dep='libjpeg'
eta='90'

dev_vrs='0.0.1812'
pc_llib='-lyuv'
pc_libsprivate='-lpthread -ljpeg'

lst_inc='libyuv.h libyuv/*.h'
lst_lib='libyuv'
lst_bin='yuvconvert'
lst_lic='LICENSE PATENTS OWNERS AUTHORS'
lst_pc='libyuv.pc'

. xbuild

LDFLAGS+=" -ljpeg"

before_make(){
    vrs=$(cat ${log_file} | grep 'Building ver.: .*' | sed 's|Building ver.: ||')
    return 0
}

start

# patch 01
# patch 02 add new line in include/libyuv/version.h
<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJABMADEQIzDknBEAco55AXBcwMwCsWA7AGw8SQ4aADUJaiQBQo2RBgIUGbHk
KkKVGvUYAWDnWacSWLgE5OOvqRJiJQqQAEHoYD04AaHmLefQTqaABAQDEoMgAdhjQADbRoOgAFvCgAMYA9uEAbvAAT
qjIGfFpadHuoFioaWVY0GXQ4QAmoDFxiclJ0A25oABmyNHwqFLAAJIAcgDKACoAgoiIoAAUoAAKAEoA8gDiazOQE6A
AJADeUDMA0gCiAPoAQuMzawCa1wAiI2sAvgD0AJ4Arpl0llcoQCARXpdpg8piMNmNQAAjCKgACUMnG0zmC2W622u32
R1OkAuN3uY0eL3eXz+gOB2Ry6BOZyu10uAA1LuAAKqzW6IG4TbkAMWFI3Zn3BEKhsIpsPhSJR6NAmNm8yWoFmay2ly
mBxO0V+12iyER1yi6GQKUlUvBkOhcrhCJNiLRAVV2I1Wp1eqJhuNpvNCWgOXgDU+oEQI1uu2etvtspm8udptAa25Y1
hkEuoATMKdivCbpVkzVONzHy5Uw2zyJeIAUlXrhMNty1uAbtSfhEUtF/l1vnaZfmFT2+103SBgGFwr3+/Bvi6AZlvg
z8hksAliGQiMASOw914iERDCRmDo6FgmOwyJwbzZxMIZHIx/PF6bl6vcuvwpvt8e9wPEgjxPIxDFMLBgJvIg7yEWwn
ycFxyHYdwdDEZDUL8BwglAYIuj6cJkijW4nm5AA1a4yMuNYJgLcg6HIIggmAYJ4EaZAelAUBvm+EtwEQblIWuYjSIo
qiaKda4AAlrikAAdUAxjSUBCIAdxNQjmnQUA2KaNJOL6AYZFY9jOO43jxn4wSbhE8jKOo2j4Wk2SgA
LZS_PATCH

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