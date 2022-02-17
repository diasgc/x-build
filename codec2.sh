#!/bin/bash

lib='codec2'
apt='libcodec2-0.9'
dsc='A speech codec for 2400 bit/s and below'
lic='LGPL-2.1'
src='https://github.com/drowe67/codec2.git'
cfg='cmake'
eta='80'

cmake_static="BUILD_STATIC_LIBS"
cmake_config="-DUNITTEST=FALSE"

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='codec2/*.h'
lst_lib='libcodec2'
lst_bin=''
lst_lic='COPYING'
lst_pc='codec2.pc'

. xbuilder.sh

unset LDFLAGS

before_make(){
    $host_mingw && {
        sed -i "s|include|# include|" ${dir_build}/cmake/GetDependencies.cmake
        sed -i "s|get_prerequisites|# get_prerequisites|" ${dir_build}/cmake/GetDependencies.cmake
    }
    LDFLAGS="-static"
    return 0
}

start

# do not edit lines below vvv
<<'XB64_PATCH'
LS0tIHNyYy9DTWFrZUxpc3RzLnR4dAkyMDIxLTA5LTI2IDExOjQwOjQzLjYyNTE0NzIwMCArMDEw
MAorKysgc3JjL0NNYWtlTGlzdHMudHh0CTIwMjEtMDktMjYgMTI6NTE6MTUuMzY1MTQ3MjAwICsw
MTAwCkBAIC03MSw2ICs3MSw3IEBACiAgICAgICAgQlVJTERfQ09NTUFORCAke0NNQUtFX0NPTU1B
TkR9IC0tYnVpbGQgLiAtLXRhcmdldCBnZW5lcmF0ZV9jb2RlYm9vawogICAgICAgIElOU1RBTExf
Q09NTUFORCAke0NNQUtFX0NPTU1BTkR9IC1FIGNvcHkgJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9E
SVJ9L2NvZGVjMl9uYXRpdmUvc3JjL2dlbmVyYXRlX2NvZGVib29rICR7Q01BS0VfQ1VSUkVOVF9C
SU5BUllfRElSfQogICAgICAgIEJVSUxEX0JZUFJPRFVDVFMgJHtDTUFLRV9DVVJSRU5UX0JJTkFS
WV9ESVJ9L2dlbmVyYXRlX2NvZGVib29rCisgICAgICAgQ01BS0VfQVJHUyAtRENNQUtFX0NfQ09N
UElMRVI9Z2NjCiAgICAgKQogICAgIGFkZF9leGVjdXRhYmxlKGdlbmVyYXRlX2NvZGVib29rIElN
UE9SVEVEKQogICAgIHNldF90YXJnZXRfcHJvcGVydGllcyhnZW5lcmF0ZV9jb2RlYm9vayBQUk9Q
RVJUSUVTCkBAIC0yMzgsNiArMjM5LDI4IEBACiAjCiAjIFNldHVwIHRoZSBjb2RlYzIgbGlicmFy
eQogIworCithZGRfY29tcGlsZV9vcHRpb25zKCItV25vLWltcGxpY2l0LWNvbnN0LWludC1mbG9h
dC1jb252ZXJzaW9uIikKKworc2V0KFRBUkdFVFMgY29kZWMyKQorCitpZihCVUlMRF9TVEFUSUNf
TElCUyBBTkQgQlVJTERfU0hBUkVEX0xJQlMpCisgICAgYWRkX2xpYnJhcnkoY29kZWMyX3N0YXRp
YyBTVEFUSUMgJHtDT0RFQzJfU1JDU30pCisgICAgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKGNvZGVj
Ml9zdGF0aWMgUFJPUEVSVElFUyBPVVRQVVRfTkFNRSBjb2RlYzIpCisgICAgdGFyZ2V0X2luY2x1
ZGVfZGlyZWN0b3JpZXMoY29kZWMyX3N0YXRpYyBJTlRFUkZBQ0UKKyAgICAgICAgJDxJTlNUQUxM
X0lOVEVSRkFDRTppbmNsdWRlL2NvZGVjMj4KKyAgICAgICAgJDxCVUlMRF9JTlRFUkZBQ0U6JHtD
TUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9PgorICAgICAgICAkPEJVSUxEX0lOVEVSRkFDRToke0NN
QUtFX0JJTkFSWV9ESVJ9PgorICAgICkKKyAgICBpZihVTklYKQorICAgICAgICB0YXJnZXRfbGlu
a19saWJyYXJpZXMoY29kZWMyX3N0YXRpYyBtKQorICAgIGVuZGlmKFVOSVgpCisgICAgaWYoTFBD
TkVUIEFORCBscGNuZXRmcmVlZHZfRk9VTkQpCisgICAgICAgIHRhcmdldF9saW5rX2xpYnJhcmll
cyhjb2RlYzJfc3RhdGljIGxwY25ldGZyZWVkdikKKyAgICBlbmRpZigpCisgICAgbGlzdChBUFBF
TkQgVEFSR0VUUyBjb2RlYzJfc3RhdGljKQorZW5kaWYoKQorCiBhZGRfbGlicmFyeShjb2RlYzIg
JHtDT0RFQzJfU1JDU30pCiBpZihVTklYKQogICAgIHRhcmdldF9saW5rX2xpYnJhcmllcyhjb2Rl
YzIgbSkKQEAgLTM5Myw3ICs0MTYsNyBAQAogYWRkX2V4ZWN1dGFibGUobGRwY19kZWMgbGRwY19k
ZWMuYykKIHRhcmdldF9saW5rX2xpYnJhcmllcyhsZHBjX2RlYyAke0NNQUtFX1JFUVVJUkVEX0xJ
QlJBUklFU30gY29kZWMyKQogCi1pbnN0YWxsKFRBUkdFVFMgY29kZWMyIEVYUE9SVCBjb2RlYzIt
Y29uZmlnCitpbnN0YWxsKFRBUkdFVFMgJHtUQVJHRVRTfSBFWFBPUlQgY29kZWMyLWNvbmZpZwog
ICAgIExJQlJBUlkgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0gQ09NUE9ORU5U
IGxpYgogICAgIEFSQ0hJVkUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0gQ09N
UE9ORU5UIGxpYgogICAgIFJVTlRJTUUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0JJTkRJ
Un0=
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK ++. ++. ++. ++. clang
# GNU  .   .   .   .  gcc
# WIN ++.  .   .   .  clang/gcc

# Filelist
# --------
# include/codec2/modem_stats.h
# include/codec2/codec2_cohpsk.h
# include/codec2/fsk.h
# include/codec2/codec2_fdmdv.h
# include/codec2/codec2_ofdm.h
# include/codec2/comp.h
# include/codec2/codec2_fifo.h
# include/codec2/version.h
# include/codec2/freedv_api.h
# include/codec2/codec2.h
# include/codec2/codec2_fm.h
# include/codec2/reliable_text.h
# lib/pkgconfig/codec2.pc
# lib/libcodec2.a
# lib/libcodec2.so
# lib/cmake/codec2/codec2-config.cmake
# lib/cmake/codec2/codec2-config-release.cmake