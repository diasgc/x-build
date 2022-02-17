#!/bin/bash

lib='brunsli'
pkg='brunslienc-c'
dsc='Practical JPEG Repacker'
lic='MIT'
src='https://github.com/google/brunsli.git'
cfg='cmake'
eta='30'

lst_inc='brunsli/*.h'
lst_lib='libbrunslidec-c libbrunslienc-c'
lst_bin='dbrunsli cbrunsli'
lst_lic='LICENSE'
lst_pc='brunslienc-c.pc brunslidec-c.pc'

pc_llibs='libbrunslidec-c libbrunslienc-c'

cmake_config="-DBUILD_TESTING=OFF -DINSTALL_GTEST=OFF"

. xbuilder.sh

source_patch(){
    git submodule update --init
}

start
<<'XB64_PATCH'
LS0tIGJydW5zbGkuY21ha2UJMjAyMS0xMC0wNiAyMjoxMzowNS42MjgxNTIwMDAgKzAxMDAKKysr
IGJydW5zbGkuY21ha2UJMjAyMS0xMC0wNiAyMjoxMzowOS4yNTgxNTIwMDAgKzAxMDAKQEAgLTc0
LDcgKzc0LDggQEAKICkKIAogc2V0KEJSVU5TTElfTElCUkFSSUVTIGJydW5zbGljb21tb24tc3Rh
dGljIGJydW5zbGlkZWMtc3RhdGljIGJydW5zbGllbmMtc3RhdGljKQotCitzZXRfdGFyZ2V0X3By
b3BlcnRpZXMoYnJ1bnNsaWVuYy1zdGF0aWMgUFJPUEVSVElFUyBPVVRQVVRfTkFNRSBicnVuc2xp
ZW5jLWMpCitzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoYnJ1bnNsaWRlYy1zdGF0aWMgUFJPUEVSVElF
UyBPVVRQVVRfTkFNRSBicnVuc2xpZGVjLWMpCiBpZihOT1QgQlJVTlNMSV9FTVNDUklQVEVOKQog
YWRkX2xpYnJhcnkoYnJ1bnNsaWRlYy1jIFNIQVJFRAogICBjL2RlYy9kZWNvZGUuY2MKQEAgLTE1
Myw3ICsxNTQsNyBAQAogIyBJbnN0YWxsYXRpb24KIGlmKE5PVCBCUlVOU0xJX0VNU0NSSVBURU4p
CiAgIGluc3RhbGwoCi0gICAgVEFSR0VUUyBicnVuc2xpZGVjLWMgYnJ1bnNsaWVuYy1jCisgICAg
VEFSR0VUUyBicnVuc2xpZGVjLWMgYnJ1bnNsaWVuYy1jIGJydW5zbGlkZWMtc3RhdGljIGJydW5z
bGllbmMtc3RhdGljCiAgICAgQVJDSElWRSBERVNUSU5BVElPTiAiJHtDTUFLRV9JTlNUQUxMX0xJ
QkRJUn0iCiAgICAgTElCUkFSWSBERVNUSU5BVElPTiAiJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0i
CiAgICkKQEAgLTE3MSw2ICsxNzIsOCBAQAogICBSVU5USU1FX09VVFBVVF9ESVJFQ1RPUllfUkVM
RUFTRSAiJHtDTUFLRV9CSU5BUllfRElSfS9hcnRpZmFjdHMiCiApCiAKK2luc3RhbGwoVEFSR0VU
UyBjYnJ1bnNsaSBkYnJ1bnNsaSBSVU5USU1FIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9C
SU5ESVJ9KQorCiBpZiAoJHtCVUlMRF9URVNUSU5HfSkKIAogaW5jbHVkZShHb29nbGVUZXN0KQo=
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU ...  .   .   .  gcc
# WIN +++  .   .  +++ clang/gcc

# Filelist
# --------
# include/brunsli/jpeg_data_writer.h
# include/brunsli/status.h
# include/brunsli/brunsli_encode.h
# include/brunsli/types.h
# include/brunsli/decode.h
# include/brunsli/brunsli_decode.h
# include/brunsli/jpeg_data.h
# include/brunsli/jpeg_data_reader.h
# include/brunsli/encode.h
# lib/libbrunslidec-c.so
# lib/pkgconfig/brunslienc-c.pc
# lib/pkgconfig/brunslidec-c.pc
# lib/libbrunslienc-c.so
# lib/libbrunslidec-c.a
# lib/libbrunslienc-c.a
# share/doc/brunsli/LICENSE
# bin/dbrunsli
# bin/cbrunsli
