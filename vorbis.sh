#!/bin/bash

lib='vorbis'
apt='libvorbis0a'
dsc='Ogg Vorbis audio format'
lic='BSD'
src='https://github.com/xiph/vorbis.git'
cfg='cmake'
dep='ogg'
eta='77'

dev_vrs='1.3.7'

lst_inc='vorbis/*.h'
lst_lib='libvorbisfile libvorbisenc libvorbis'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='vorbisfile.pc vorbisenc.pc vorbis.pc'

. xbuild

cmake_config='-DBUILD_TESTING=OFF'
cmake_static='BUILD_STATIC_LIBS'
ac_config='--disable-docs --disable-examples --disable-oggtest'

start

# cpu av8 av7 x86 x64
# NDK ++  ++   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# share/doc/vorbis/AUTHORS
# share/doc/vorbis/COPYING
# lib/cmake/Vorbis/VorbisConfigVersion.cmake
# lib/cmake/Vorbis/VorbisConfig.cmake
# lib/cmake/Vorbis/VorbisTargets-release.cmake
# lib/cmake/Vorbis/VorbisTargets.cmake
# lib/libvorbisfile.a
# lib/libvorbisenc.a
# lib/libvorbis.a
# lib/libvorbisfile.so
# lib/libvorbisenc.so
# lib/libvorbis.so
# include/vorbis/vorbisfile.h
# include/vorbis/vorbisenc.h
# include/vorbis/codec.h
# lib/pkgconfig/vorbisfile.pc
# lib/pkgconfig/vorbisenc.pc
# lib/pkgconfig/vorbis.pc

# patch 01 on lib/CMakeLists.txt to support dual static/shared builds
<<'LZS_PATCH'
LQgEBsEsCMHoGECyBDA1gUwDKQM4BccA6PADzwEgAmABksuFuEoGZQBGATgC4BWZrtm0IAWAOzC2w4R2rVQAalmyAU
PLUQYCFBmz4ipCjToN6LUDS4telEZMnTZCpdWUABV6GCjmAGgBsCt4+bHLuyqAREcgAJtEA+tHoAGaQAHaQeJAA9qk
4ABTAACJx8ABKACpxAHIA8lUAyuWF8NU1cYUAogAKpR3wAILlHQCU4eip0ZBJeaOgqkkArqkAxpk5eTHxUNAaO1Cpq
KPykXPy49GLK2upG7Fx27saB0fhU6B5teWgAEIAqgCSmGKADFSv1EB0AOo1UoAaVmJ029xgACdkCiAJ55ABuWRR0Fw
oAAJABvABqMO+/3qcQAEh1+p1SvUAL7E8mU6lxeo1X6leAdVkIyJI7ZozE4vEEnDjZbsimlKn1DpVFo8vkCoVuDzAN
iUHj+BR6jg+HiUUBhE5W/r82n/MkdUCdRr/KqDf51dlIfqwjpxV2NfqYTBxTD/b6Ff6lFnhK2RUHgqEw2FOwXlV3uz
2k72+/0NcpBkNhiNRmNWl7HSJTPJ/QHFeq0m0dYrF+qgfpVQo/AFA7kF9MtVtHONRO5i9FY3H43DAfDITJywMD+Wcm
n0xkdZls0kKpXc3n8wUs4cj0WoieS6cylazvDzyCL/v/eArxXUlVqg+a4+qEegM/QOKk5SrgKTgOgt73o+7ovjuq7A
oCfrqoeWryL+I4yngcR3iiADm6BYQADiiWSEegKKZOg+RTtKkELqAPQ1F0m7poKoA8g6zIelUr57px9TcXmwI1GyvL
lF0vyVG6EKgDRuAnnGmHYei+FESRZEUZAVGXtKsp0Q+DGlExLH/GxHGbgJWYcm+yqqnE/GCa6wmiZJElSYmskgdeyw
KVaSk4apcTEaR5GUdRXlgRBc70YxzEVKZbbmVxVm7tSCGYH6Dl1EJImgGJbnVB5ck4JFFZ/gFBFxGkyzgAsiQJJAKL
oKseJaeFV76cs6F/hEEnfGG8DdT1JxEgAPLWvaukMpTAv0ApcKSjEAFJ9JUyECu0pawNVtWJAAfENw0RGNAYFsGebT
bN83ZogPp+qdhZ5vAmC/J0kbRgdlZxj09qDB0h1HTdd0lHyvRVGtX5+u9MZfeWAMRBVWE7XV6ANU1LUom1Om4Hp0UP
vDVp9QNBN/mNE3FFNm5XR0C0kstq37hqUNbcj+0kyOJ35o9lMzXNNNA7mD3na6z2vc2pafUdhm/UM7NxgLfrwKDKoQ
0zm3RgTvknIjVUrLtqOTOjeCtdpxWRZ1csMb8/XPpbI3jT2FPg1TfO0/T8Cq4e6sstteso5LUuRJzgbC87vPXSSOb3
Vzoei29Eua6oBM6/sqDIoB6JY8VFuw3+RPPnluG4VwXBZEXls/WSf3EqNZM1DUmC042DqhuGiAsntXAALYB3GWuRCn
aRp+OmOm15uN3jF1sDZ5HV4z5ycqZVqfp+KWcRZA4GdVbNsvtn89lSOaRzuA4B5AWpQAOIdOUbb75PBnFRPUGz9K5v
z5bHQABpdDCXxkl5coS8CCW1KL8cG/wZLOnTG6dMVko55hDiGKknZSyW2LGCUoABNVMLpYHcS9LdQWMcizhmhpbG08
A7QOlwTAzMPEFaILOqQksGtc4jgTBCaEcJaEZjgQwyORDo5INbqwmGf5fLnGrC8K06ASCETxHgPI39f4VFAAAq8QC8
IERwKAaSgouh83UV5EuoB0qOg0dKLRqkiDLC7mgdAsxYxVmmELEMCDDHwFhP0a+cREA1EKL8DKowgA
LZS_PATCH
