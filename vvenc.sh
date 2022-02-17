#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .  +++ gcc
# WIN +++  .   .   .  clang/gcc

lib='vvenc'
pkg='libvvenc'
dsc='Fraunhofer Versatile Video Encoder'
lic='LGPL-2.1'
src='https://github.com/fraunhoferhhi/vvenc.git'
cfg='cmake'
eta='480'
cbk="BUILD_TOOLS"
#mkinstall='all'

. xbuilder.sh

$host_arm && CFG+=" -DVVENC_ENABLE_X86_SIMD=FALSE -DVVENC_ENABLE_ARM_SIMD=TRUE"

before_make(){
  sed -i 's/ -Werror//g' ${BUILD_DIR}/source/Lib/vvenc/CMakeFiles/vvenc.dir/flags.make
}

start

<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjEtMTAtMDggMTY6MTI6MDIuMTk4MDAwMDAwICswMTAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTEwLTA4IDE2OjEyOjQxLjIwMDAwMDAwMCArMDEwMApAQCAt
MTIsOCArMTIsOCBAQAogIyBwcm9qZWN0IG5hbWUKIHByb2plY3QoIHZ2ZW5jIFZFUlNJT04gMS4x
LjAgKQogCi1zZXQoIFZWRU5DX0VOQUJMRV9YODZfU0lNRCBUUlVFICkKLXNldCggVlZFTkNfRU5B
QkxFX0FSTV9TSU1EIEZBTFNFICkKK29wdGlvbiggVlZFTkNfRU5BQkxFX1g4Nl9TSU1EICJlbmFi
bGUgeDg2IGludHJpbnNpY3MiIFRSVUUpCitvcHRpb24oIFZWRU5DX0VOQUJMRV9BUk1fU0lNRCAi
ZW5hYmxlIGFybSBpbnRyaW5zaWNzIiBGQUxTRSApCiAKIGlmKCBBUFBMRSApCiAgIGlmKCBERUZJ
TkVEIENNQUtFX09TWF9BUkNISVRFQ1RVUkVTICkKCi0tLSBzb3VyY2UvTGliL3Z2ZW5jL3Z2ZW5j
aW1wbC5vbGQJMjAyMS0xMC0wOCAxNjoxNDoyMi43MDAwMDAwMDAgKzAxMDAKKysrIHNvdXJjZS9M
aWIvdnZlbmMvdnZlbmNpbXBsLmNwcAkyMDIxLTEwLTA4IDE2OjE5OjQyLjQ4MDAwMDAwMCArMDEw
MApAQCAtMjM1LDcgKzIzNSw3IEBACiAjZW5kaWYKICAgfQogCi0jaWYgZGVmaW5lZCggX19saW51
eF9fICkKKyNpZiBkZWZpbmVkKCBfX2xpbnV4X18gKSAmJiAhZGVmaW5lZChfX0FORFJPSURfXykK
ICAgbWFsbG9jX3RyaW0oMCk7ICAgLy8gZnJlZSB1bnVzZWQgaGVhcCBtZW1vcnkKICNlbmRpZgog
CkBAIC00MDMsNyArNDAzLDcgQEAKICAgICBpUmV0ID0geENvcHlBdSggKnBjQWNjZXNzVW5pdCwg
Y0F1ICApOwogICB9CiAKLSNpZiBkZWZpbmVkKCBfX2xpbnV4X18gKQorI2lmIGRlZmluZWQoIF9f
bGludXhfXyApICYmICFkZWZpbmVkKF9fQU5EUk9JRF9fKQogICBtYWxsb2NfdHJpbSgwKTsgICAv
LyBmcmVlIHVudXNlZCBoZWFwIG1lbW9yeQogI2VuZGlmCg==
XB64_PATCH

# Filelist
# --------
# include/vvenc/vvencDecl.h
# include/vvenc/vvenc.h
# include/vvenc/version.h
# include/vvenc/vvencCfg.h
# lib/pkgconfig/libvvenc.pc
# lib/cmake/vvenc/vvencConfig.cmake
# lib/cmake/vvenc/vvencTargets-shared-release.cmake
# lib/cmake/vvenc/vvencConfigVersion.cmake
# lib/cmake/vvenc/vvencTargets-shared.cmake
# lib/libvvenc.so
# bin/vvencapp
# bin/vvencFFapp
