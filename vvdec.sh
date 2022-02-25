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

. xbuild

lst_inc=''
lst_lib=''
lst_bin=''

start

<<'XB64_PATCH'
LS0tIHNvdXJjZS9MaWIvdnZkZWMvQ01ha2VMaXN0cy50eHQJMjAyMi0wMi0yNSAxMjoyMzo0NC41
NDIwMDI4ODMgKzAwMDAKKysrIHNvdXJjZS9MaWIvdnZkZWMvQ01ha2VMaXN0cy50eHQJMjAyMi0w
Mi0yNSAxMjoyNTowNi42NjEwMjI1MDQgKzAwMDAKQEAgLTExMSw4ICsxMTEsOCBAQAogdGFyZ2V0
X2NvbXBpbGVfZGVmaW5pdGlvbnMoICR7TElCX05BTUV9IFBSSVZBVEUgJHtMSUJfTkFNRV9VQ31f
U09VUkNFICkKIHRhcmdldF9jb21waWxlX2RlZmluaXRpb25zKCAke0xJQl9OQU1FfSBQVUJMSUMg
JDwkPEFORDokPFBMQVRGT1JNX0lEOldpbmRvd3M+LCQ8U1RSRVFVQUw6JDxUQVJHRVRfUFJPUEVS
VFk6JHtMSUJfTkFNRX0sVFlQRT4sU0hBUkVEX0xJQlJBUlk+Pjoke0xJQl9OQU1FX1VDfV9EWU5f
TElOSz4gKQogCi10YXJnZXRfY29tcGlsZV9vcHRpb25zKCAke0xJQl9OQU1FfSBQUklWQVRFICQ8
JDxPUjokPENYWF9DT01QSUxFUl9JRDpDbGFuZz4sJDxDWFhfQ09NUElMRVJfSUQ6QXBwbGVDbGFu
Zz4+Oi1XYWxsIC1XZXJyb3IgLVduby11bnVzZWQtZnVuY3Rpb24gLVduby1lbnVtLWNvbXBhcmUt
c3dpdGNoIC1Xbm8tdW5rbm93bi1hdHRyaWJ1dGVzPgotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAkPCQ8Q1hYX0NPTVBJTEVSX0lEOkdOVT46LVdhbGwgLVdlcnJv
ciAtV25vLXVudXNlZC1mdW5jdGlvbiAtV25vLXNpZ24tY29tcGFyZSAtZmRpYWdub3N0aWNzLXNo
b3ctb3B0aW9uIC1Xbm8taWdub3JlZC1hdHRyaWJ1dGVzPgordGFyZ2V0X2NvbXBpbGVfb3B0aW9u
cyggJHtMSUJfTkFNRX0gUFJJVkFURSAkPCQ8T1I6JDxDWFhfQ09NUElMRVJfSUQ6Q2xhbmc+LCQ8
Q1hYX0NPTVBJTEVSX0lEOkFwcGxlQ2xhbmc+PjotV2FsbCAtV25vLWVycm9yIC1Xbm8tdW51c2Vk
LWZ1bmN0aW9uIC1Xbm8tZW51bS1jb21wYXJlLXN3aXRjaCAtV25vLXVua25vd24tYXR0cmlidXRl
cz4KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJDwkPENYWF9D
T01QSUxFUl9JRDpHTlU+Oi1XYWxsIC1Xbm8tZXJyb3IgLVduby11bnVzZWQtZnVuY3Rpb24gLVdu
by1zaWduLWNvbXBhcmUgLWZkaWFnbm9zdGljcy1zaG93LW9wdGlvbiAtV25vLWlnbm9yZWQtYXR0
cmlidXRlcz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJDwk
PENYWF9DT01QSUxFUl9JRDpNU1ZDPjovVzQgL1dYIC93ZDQxMDAgL3dkNDEyNyAvd2Q0MjQ0IC93
ZDQyNDUgL3dkNDM4OSAvd2Q0NDU2IC93ZDQ0NTcgL3dkNDQ1OCAvd2Q0NDU5IC93ZDQ1MDUgL3dk
NDcwMSAvd2Q0NzAyIC93ZDQ3MDMgPikKIAogdGFyZ2V0X2luY2x1ZGVfZGlyZWN0b3JpZXMoICR7
TElCX05BTUV9IFBSSVZBVEUgICAgICAgICAgICQ8QlVJTERfSU5URVJGQUNFOiR7Q01BS0VfQ1VS
UkVOVF9TT1VSQ0VfRElSfS8uLi8uLi8uLi9pbmNsdWRlPiAkPEJVSUxEX0lOVEVSRkFDRToke0NN
QUtFX0JJTkFSWV9ESVJ9PgoKLS0tIHNvdXJjZS9MaWIvdnZkZWMvdnZkZWNpbXBsLmNwcAkyMDIx
LTEwLTA4IDE1OjUwOjU4LjU0MjAwMDAwMCArMDEwMAorKysgc291cmNlL0xpYi92dmRlYy92dmRl
Y2ltcGwuY3BwCTIwMjEtMTAtMDggMTU6NTE6MjguMTkwMDAwMDAwICswMTAwCkBAIC0xOTAsNyAr
MTkwLDcgQEAKICAgZGVsZXRlIG1fY0RlY0xpYjsKICAgZGVzdHJveVJPTSgpOwogCi0jaWYgZGVm
aW5lZCggX19saW51eF9fICkKKyNpZiBkZWZpbmVkKCBfX2xpbnV4X18gKSAmJiAhZGVmaW5lZChf
X0FORFJPSURfXykKICAgbWFsbG9jX3RyaW0oMCk7CiAjZW5kaWYK
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
