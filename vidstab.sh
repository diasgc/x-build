#!/bin/bash

#vrs='1.20'
lib='vidstab'
apt='libvidstab-dev'
dsc='Vidstab is a video stabilization library which can be plugged-in with Ffmpeg and Transcode'
lic='GPL-2+'
src='https://github.com/georgmartius/vid.stab.git'
cfg='cmake'
eta='80'

lst_inc='vid.stab/*.h'
lst_lib='libvidstab'
lst_bin=''
lst_lic='LICENSE'
lst_pc='vidstab.pc'

CFG="-DUSE_OMP=OFF"

. xbuilder.sh

$host_arm && CFG+=" -DSSE2_FOUND=OFF"

start

<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjEtMTAtMTAgMTg6MjQ6MzMuNDMzMzE0NDAwICswMTAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTEwLTEwIDE4OjI1OjEzLjYyMzMxNDQwMCArMDEwMApAQCAt
MTYsNyArMTYsNyBAQAogaWYoTk9UIENNQUtFX0JVSUxEX1RZUEUgQU5EIE5PVCBDTUFLRV9DT05G
SUdVUkFUSU9OX1RZUEVTKQogICBzZXQoQ01BS0VfQlVJTERfVFlQRSAiUmVsZWFzZSIpCiBlbmRp
ZigpCi0KK29wdGlvbihCVUlMRF9TVEFUSUNfTElCUyAiYnVpbGQgc3RhdGljIGxpYnMiIE9OKQog
b3B0aW9uKEJVSUxEX1NIQVJFRF9MSUJTICJidWlsZCBzaGFyZWQgbGlicmFyaWVzIGluc3RlYWQg
b2Ygc3RhdGljIGxpYnJhcmllcyIKICAgICAgICBPTikKIApAQCAtODEsMTMgKzgxLDI1IEBACiBz
ZXQoUEtHX0VYVFJBX0xJQlMgIiR7UEtHX0VYVFJBX0xJQlN9ICR7T3Blbk1QX0NfRkxBR1N9IikK
IGVuZGlmKCkKIAotCitzZXQodGFyZ2V0cyB2aWRzdGFiKQoraWYoQlVJTERfU0hBUkVEX0xJQlMg
QU5EIEJVSUxEX1NUQVRJQ19MSUJTKQorYWRkX2xpYnJhcnkgKHZpZHN0YWJfc3RhdGljIFNUQVRJ
QyAke1NPVVJDRVN9KQorc2V0X3RhcmdldF9wcm9wZXJ0aWVzKHZpZHN0YWJfc3RhdGljIFBST1BF
UlRJRVMgT1VUUFVUX05BTUUgdmlkc3RhYikKK3RhcmdldF9saW5rX2xpYnJhcmllcyh2aWRzdGFi
X3N0YXRpYyBtKQorbGlzdChBUFBFTkQgdGFyZ2V0cyB2aWRzdGFiX3N0YXRpYykKK2lmKE9SQ19G
T1VORCkKK3RhcmdldF9saW5rX2xpYnJhcmllcyh2aWRzdGFiX3N0YXRpYyAke09SQ19MSUJSQVJJ
RVN9KQorZW5kaWYoKQoraWYoVVNFX09NUCBBTkQgT1BFTk1QX0ZPVU5EKQordGFyZ2V0X2xpbmtf
bGlicmFyaWVzKHZpZHN0YWJfc3RhdGljIE9wZW5NUDo6T3Blbk1QX0MpCitlbmRpZigpCitlbmRp
ZigpCiAjaWYoIU5PSEVBREVSUykKIEZJTEUoR0xPQiBIRUFERVJTICIke0NNQUtFX0NVUlJFTlRf
U09VUkNFX0RJUn0vc3JjLyouaCIpCiBJTlNUQUxMKEZJTEVTICR7SEVBREVSU30gREVTVElOQVRJ
T04gJHtDTUFLRV9JTlNUQUxMX0lOQ0xVREVESVJ9L3ZpZC5zdGFiKQogI2VuZGlmKCkKIAotSU5T
VEFMTChUQVJHRVRTIHZpZHN0YWIKK0lOU1RBTEwoVEFSR0VUUyAke3RhcmdldHN9CiAgIFJVTlRJ
TUUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0JJTkRJUn0KICAgTElCUkFSWSBERVNUSU5B
VElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfQogICBBUkNISVZFIERFU1RJTkFUSU9OICR7Q01B
S0VfSU5TVEFMTF9MSUJESVJ9Cg==
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/vid.stab/vidstabdefines.h
# include/vid.stab/motiondetect_opt.h
# include/vid.stab/transformtype.h
# include/vid.stab/libvidstab.h
# include/vid.stab/vsvector.h
# include/vid.stab/motiondetect.h
# include/vid.stab/transform_internal.h
# include/vid.stab/transform.h
# include/vid.stab/transformtype_operations.h
# include/vid.stab/frameinfo.h
# include/vid.stab/motiondetect_internal.h
# include/vid.stab/serialize.h
# include/vid.stab/transformfixedpoint.h
# include/vid.stab/transformfloat.h
# include/vid.stab/localmotion2transform.h
# include/vid.stab/boxblur.h
# lib/pkgconfig/vidstab.pc
# lib/libvidstab.a
# lib/libvidstab.so
# share/doc/vidstab/LICENSE
