#!/bin/bash

lib='lerc'
pkg='Lerc'
dsc='Limited Error Raster Compression'
lic='BSD/GPL-2.0'
src='https://github.com/Esri/lerc.git'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
eta='134'

lst_inc='Lerc_c_api.h Lerc_types.h'
lst_lib='libLerc'
lst_bin=''
lst_lic='LICENSE NOTICE'
lst_pc='Lerc.pc'

dev_vrs='3.0.0'

. xbuild

start

<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMub2xkCTIwMjItMDEtMjMgMjE6NTE6NTUuMjcyMDAwMDAwICswMDAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIyLTAxLTIzIDIxOjU1OjAwLjYwNTM5MDYwMCArMDAwMApAQCAt
MTUsMTIgKzE1LDggQEAKICAgICAic3JjL0xlcmNMaWIvaW5jbHVkZS8qIgogKQogCi0jIE1ha2Ug
YW4gb3B0aW9uLCBkZWZhdWx0aW5nIHRvIHNoYXJlZCBsaWJzLCBidXQgYWxsb3cgLURCVUlMRF9T
SEFSRURfTElCUz1PRkYKLW9wdGlvbiAoQlVJTERfU0hBUkVEX0xJQlMgIkJ1aWxkIHNoYXJlZCBs
aWJyYXJpZXMgKHNldCB0byBPRkYgdG8gYnVpbGQgc3RhdGljIGxpYnMpIiBPTikKLQotIyBJZiBu
byBTSEFSRUQgb3IgU1RBVElDIGlzIHNwZWNpZmllZCBleHBsaWNpdGx5LCBhZGRfbGlicmFyeSB3
aWxsIGhvbm9yIEJVSUxEX1NIQVJFRF9MSUJTCitzZXQoTGVyY19UYXJnZXRzIExlcmMpCiBhZGRf
bGlicmFyeShMZXJjICR7U09VUkNFU30pCi0KIHNldF90YXJnZXRfcHJvcGVydGllcyhMZXJjCiAg
ICAgUFJPUEVSVElFUwogICAgIFBVQkxJQ19IRUFERVIgInNyYy9MZXJjTGliL2luY2x1ZGUvTGVy
Y190eXBlcy5oO3NyYy9MZXJjTGliL2luY2x1ZGUvTGVyY19jX2FwaS5oIikKQEAgLTM1LDkgKzMx
LDE1IEBACiAgICAgICAgIFBST1BFUlRJRVMKICAgICAgICAgQ09NUElMRV9ERUZJTklUSU9OUyBM
RVJDX1NUQVRJQykKIGVuZGlmKCkKK2lmKEJVSUxEX1NIQVJFRF9MSUJTIEFORCBCVUlMRF9TVEFU
SUNfTElCUykKKyAgICBhZGRfbGlicmFyeShMZXJjX3N0YXRpYyBTVEFUSUMgJHtTT1VSQ0VTfSkK
KyAgICBzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoTGVyY19zdGF0aWMgUFJPUEVSVElFUyBDT01QSUxF
X0RFRklOSVRJT05TIExFUkNfU1RBVElDKQorICAgIHNldF90YXJnZXRfcHJvcGVydGllcyhMZXJj
X3N0YXRpYyBQUk9QRVJUSUVTIE9VVFBVVF9OQU1FIExlcmMpCisgICAgc2V0KExlcmNfVGFyZ2V0
cyBMZXJjIExlcmNfc3RhdGljKQorZW5kaWYoKQogCiBpbnN0YWxsKAotICAgIFRBUkdFVFMgTGVy
YworICAgIFRBUkdFVFMgJHtMZXJjX1RhcmdldHN9CiAgICAgTElCUkFSWSBERVNUSU5BVElPTiAk
e0NNQUtFX0lOU1RBTExfTElCRElSfQogICAgIFJVTlRJTUUgREVTVElOQVRJT04gJHtDTUFLRV9J
TlNUQUxMX0JJTkRJUn0KICAgICBBUkNISVZFIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9M
SUJESVJ9Cg==
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/Lerc_c_api.h
# include/Lerc_types.h
# lib/pkgconfig/Lerc.pc
# lib/libLerc.so
# lib/libLerc.a
# share/doc/lerc/LICENSE
# share/doc/lerc/NOTICE
