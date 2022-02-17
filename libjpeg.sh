#!/bin/bash

lib='libjpeg'
apt="${lib}-dev"
dsc='JPEG image codec that uses SIMD instructions'
lic='BSD'
src='https://github.com/libjpeg-turbo/libjpeg-turbo.git'
cfg='cmake'
eta='78'
cmake_static="ENABLE_STATIC"
cmake_shared="ENABLE_SHARED"
mki='install/strip'

cmake_config="-DWITH_JPEG8=ON -DWITH_JPEG7=ON -DWITH_DOCS=OFF -DWITH_MAN=OFF"

lst_inc='jerror.h jconfig.h jpeglib.h jmorecfg.h turbojpeg.h'
lst_lib='libjpeg libturbojpeg'
lst_bin='rdjpgcom jpegtran wrjpgcom djpeg tjbench cjpeg'
lst_lic='LICENSE.md'
lst_pc='libjpeg.pc libturbojpeg.pc'

extraOpts(){
  case $1 in
    --jpeg7) cmake_config+=" -DWITH_JPEG7=ON";;
    --jpeg8) cmake_config+=" -DWITH_JPEG8=ON";;
    --12bit) cmake_config+=" -DWITH_12BIT=ON";;
  esac
}

. xbuilder.sh

start

<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjEtMDktMTggMjA6NTE6NTYuMTkxMzE3NDAwICswMTAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTA5LTE4IDIwOjU1OjA4LjY1MTMxNzQwMCArMDEwMApAQCAt
MTQ5Myw2ICsxNDkzLDEzIEBACiAKIGluc3RhbGwoVEFSR0VUUyByZGpwZ2NvbSB3cmpwZ2NvbSBS
VU5USU1FIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9CSU5ESVJ9KQogCitvcHRpb24oV0lU
SF9ET0NTICJ3aXRoIGRvY3MiIEZBTFNFKQorYm9vbGVhbl9udW1iZXIoV0lUSF9ET0NTKQorCitv
cHRpb24oV0lUSF9NQU4gIndpdGggbWFuIHBhZ2VzIiBGQUxTRSkKK2Jvb2xlYW5fbnVtYmVyKFdJ
VEhfTUFOKQorCitpZihXSVRIX0RPQ1MpCiBpbnN0YWxsKEZJTEVTICR7Q01BS0VfQ1VSUkVOVF9T
T1VSQ0VfRElSfS9SRUFETUUuaWpnCiAgICR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS9SRUFE
TUUubWQgJHtDTUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9L2V4YW1wbGUudHh0CiAgICR7Q01BS0Vf
Q1VSUkVOVF9TT1VSQ0VfRElSfS90amV4YW1wbGUuYwpAQCAtMTUwMCwxMiArMTUwNywxMyBAQAog
ICAke0NNQUtFX0NVUlJFTlRfU09VUkNFX0RJUn0vc3RydWN0dXJlLnR4dAogICAke0NNQUtFX0NV
UlJFTlRfU09VUkNFX0RJUn0vdXNhZ2UudHh0ICR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS93
aXphcmQudHh0CiAgICR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS9MSUNFTlNFLm1kIERFU1RJ
TkFUSU9OICR7Q01BS0VfSU5TVEFMTF9ET0NESVJ9KQorZW5kaWYoKQogaWYoV0lUSF9KQVZBKQog
ICBpbnN0YWxsKEZJTEVTICR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS9qYXZhL1RKRXhhbXBs
ZS5qYXZhCiAgICAgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0RPQ0RJUn0pCiBlbmRpZigp
CiAKLWlmKFVOSVggT1IgTUlOR1cpCitpZihXSVRIX01BTiBBTkQgVU5JWCBPUiBNSU5HVykKICAg
aW5zdGFsbChGSUxFUyAke0NNQUtFX0NVUlJFTlRfU09VUkNFX0RJUn0vY2pwZWcuMQogICAgICR7
Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS9kanBlZy4xICR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0Vf
RElSfS9qcGVndHJhbi4xCiAgICAgJHtDTUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9L3JkanBnY29t
LjE=
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/jerror.h
# include/jconfig.h
# include/jpeglib.h
# include/jmorecfg.h
# include/turbojpeg.h
# lib/pkgconfig/libjpeg.pc
# lib/pkgconfig/libturbojpeg.pc
# lib/libturbojpeg.a
# lib/cmake/libjpeg-turbo/libjpeg-turboTargets-release.cmake
# lib/cmake/libjpeg-turbo/libjpeg-turboConfig.cmake
# lib/cmake/libjpeg-turbo/libjpeg-turboConfigVersion.cmake
# lib/cmake/libjpeg-turbo/libjpeg-turboTargets.cmake
# lib/libjpeg.so
# lib/libturbojpeg.so
# lib/libjpeg.a
# share/doc/libjpeg/LICENSE.md
# bin/rdjpgcom
# bin/jpegtran
# bin/wrjpgcom
# bin/djpeg
# bin/tjbench
# bin/cjpeg
