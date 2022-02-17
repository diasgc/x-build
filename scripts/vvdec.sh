#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='vvdec'
pkg='libvvdec'
dsc='Fraunhofer Versatile Video Decoder (VVdeC)'
lic='LGPL-2.1'
src='https://github.com/fraunhoferhhi/vvdec.git'
cfg='cmake'
eta='480'
cbk="BUILD_TOOLS"
#mki='all'

. xbuilder.sh

lst_inc=''
lst_lib=''
lst_bin=''

$host_arm && CFG="-DVVDEC_ENABLE_X86_SIMD=FALSE -DVVDEC_ENABLE_ARM_SIMD=TRUE"

before_make(){
  sed -i 's/ -Werror//g' ${BUILD_DIR}/source/Lib/vvdec/CMakeFiles/vvdec.dir/flags.make
}

start

<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjEtMTAtMDggMTU6MTk6MTMuMDUzMDAwMDAwICswMTAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTEwLTA4IDE1OjM1OjI5LjExMDAwMDAwMCArMDEwMApAQCAt
MTIsOCArMTIsOCBAQAogIyBwcm9qZWN0IG5hbWUKIHByb2plY3QoIHZ2ZGVjIFZFUlNJT04gMS4y
LjAgKQogCi1zZXQoIFZWREVDX0VOQUJMRV9YODZfU0lNRCBUUlVFICBDQUNIRSBCT09MICJlbmFi
bGUgeDg2IGludHJpbnNpY3MiICkKLXNldCggVlZERUNfRU5BQkxFX0FSTV9TSU1EIEZBTFNFIENB
Q0hFIEJPT0wgImVuYWJsZSBhcm0gaW50cmluc2ljcyIgKQorb3B0aW9uKCBWVkRFQ19FTkFCTEVf
WDg2X1NJTUQgImVuYWJsZSB4ODYgaW50cmluc2ljcyIgVFJVRSkKK29wdGlvbiggVlZERUNfRU5B
QkxFX0FSTV9TSU1EICJlbmFibGUgYXJtIGludHJpbnNpY3MiIEZBTFNFICkKIAogaWYoIEFQUExF
ICkKICAgaWYoIERFRklORUQgQ01BS0VfT1NYX0FSQ0hJVEVDVFVSRVMgKQoKLS0tIHNvdXJjZS9M
aWIvdnZkZWMvdnZkZWNpbXBsLmNwcAkyMDIxLTEwLTA4IDE1OjUwOjU4LjU0MjAwMDAwMCArMDEw
MAorKysgc291cmNlL0xpYi92dmRlYy92dmRlY2ltcGwuY3BwCTIwMjEtMTAtMDggMTU6NTE6Mjgu
MTkwMDAwMDAwICswMTAwCkBAIC0xOTAsNyArMTkwLDcgQEAKICAgZGVsZXRlIG1fY0RlY0xpYjsK
ICAgZGVzdHJveVJPTSgpOwogCi0jaWYgZGVmaW5lZCggX19saW51eF9fICkKKyNpZiBkZWZpbmVk
KCBfX2xpbnV4X18gKSAmJiAhZGVmaW5lZChfX0FORFJPSURfXykKICAgbWFsbG9jX3RyaW0oMCk7
CiAjZW5kaWYK
XB64_PATCH

# Filelist
# --------
# include/vvdec/sei.h
# include/vvdec/vvdec.h
# include/vvdec/version.h
# include/vvdec/vvdecDecl.h
# lib/pkgconfig/libvvdec.pc
# lib/cmake/vvdec/vvdecConfigVersion.cmake
# lib/cmake/vvdec/vvdecTargets-static.cmake
# lib/cmake/vvdec/vvdecTargets-static-release.cmake
# lib/cmake/vvdec/vvdecConfig.cmake
# lib/libvvdec.a
# bin/vvdecapp
