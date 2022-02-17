#!/bin/bash

lib='oniguruma'
dsc='Regular expression library'
lic='BSD-2c'
src='https://github.com/kkos/oniguruma.git'
cfg='cmake'
eta='30'

dev_bra='master'
dev_vrs='6.9.7'
stb_bra='tags/6.9.7.1'
stb_vrs='6.9.7.1'

lst_inc='oniggnu.h oniguruma.h'
lst_lib='libonig'
lst_bin='onig-config'
lst_lic='COPYING AUTHORS'
lst_pc='oniguruma.pc'

cmake_config='-DINSTALL_DOCUMENTATION=OFF'
cmake_static='BUILD_STATIC_LIBS'

. xbuilder.sh

start

# patch 01 6.9.7 CMakeLists.txt to support dual static shared build
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjItMDEtMzAgMjI6Mjk6NTEuMDAyMDAwMDAwICswMDAwCisrKyBDTWFrZUxpc3
RzLnR4dAkyMDIyLTAxLTMwIDIyOjMzOjI3LjM4MTk1MTAwMCArMDAwMApAQCAtNzIsNiArNzIsNyBAQAogICBhZGRf
ZGVmaW5pdGlvbnMoIi1EVVNFX0JJTkFSWV9DT01QQVRJQkxFX1BPU0lYX0FQSSIpCiBlbmRpZigpCiAKK3NldCh0YX
JnZXRfbGlicyBvbmlnKQogYWRkX2xpYnJhcnkob25pZyAke19TUkNTfSkKIHRhcmdldF9pbmNsdWRlX2RpcmVjdG9y
aWVzKG9uaWcgUFVCTElDCiAgICQ8QlVJTERfSU5URVJGQUNFOiR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS9zcm
M+CkBAIC05Myw2ICs5NCwxNCBAQAogICAgICAgVkVSU0lPTiAiJHtPTklHX1NPVkVSU0lPTn0uJHtMVEFHRX0uJHtM
VFJFVklTSU9OfSIpCiBlbmRpZigpCiAKK2lmKEJVSUxEX1NIQVJFRF9MSUJTIEFORCBCVUlMRF9TVEFUSUNfTElCUy
kKKyAgYWRkX2xpYnJhcnkob25pZy1zdGF0aWMgU1RBVElDICR7X1NSQ1N9KQorICB0YXJnZXRfaW5jbHVkZV9kaXJl
Y3RvcmllcyhvbmlnLXN0YXRpYyBQVUJMSUMKKyAgICAkPEJVSUxEX0lOVEVSRkFDRToke0NNQUtFX0NVUlJFTlRfU0
9VUkNFX0RJUn0vc3JjPgorICAgICQ8QlVJTERfSU5URVJGQUNFOiR7Q01BS0VfQ1VSUkVOVF9CSU5BUllfRElSfT4p
CisgIHNldF90YXJnZXRfcHJvcGVydGllcyhvbmlnLXN0YXRpYyBQUk9QRVJUSUVTIE9VVFBVVF9OQU1FIG9uaWcpCi
sgIGxpc3QoQVBQRU5EIHRhcmdldF9saWJzIG9uaWctc3RhdGljKQorZW5kaWYoKQogaWYoTVNWQykKICAgdGFyZ2V0
X2NvbXBpbGVfb3B0aW9ucyhvbmlnIFBSSVZBVEUKIAkjL1c0CkBAIC0xNjUsNyArMTc0LDcgQEAKICMgICAqIGhlYW
RlciBsb2NhdGlvbiBhZnRlciBpbnN0YWxsOiA8cHJlZml4Pi9pbmNsdWRlLwogIyAgICogaGVhZGVycyBjYW4gYmUg
aW5jbHVkZWQgYnkgQyBjb2RlIGAjaW5jbHVkZSA8b25pZ3VydW1hLmg+YAogaW5zdGFsbCgKLSAgICBUQVJHRVRTIG
9uaWcKKyAgICBUQVJHRVRTICR7dGFyZ2V0X2xpYnN9CiAgICAgRVhQT1JUICIke1RBUkdFVFNfRVhQT1JUX05BTUV9
IgogICAgIExJQlJBUlkgREVTVElOQVRJT04gIiR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9IgogICAgIEFSQ0hJVkUgRE
VTVElOQVRJT04gIiR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9Igo=
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/oniggnu.h
# include/oniguruma.h
# lib/pkgconfig/oniguruma.pc
# lib/libonig.a
# lib/cmake/oniguruma/onigurumaConfig.cmake
# lib/cmake/oniguruma/onigurumaTargets-release.cmake
# lib/cmake/oniguruma/onigurumaConfigVersion.cmake
# lib/cmake/oniguruma/onigurumaTargets.cmake
# lib/libonig.so
# share/doc/oniguruma/AUTHORS
# share/doc/oniguruma/COPYING
# bin/onig-config
