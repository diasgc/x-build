#!/bin/bash

lib='flac'
dsc='Free Lossless Audio Codec'
lic='BSD'
src='https://github.com/xiph/flac.git'
cfg='cmake'
dep='ogg libiconv'
eta='60'

lst_inc='FLAC++/*.h FLAC/*.h'
lst_lib='libFLAC libFLAC++'
lst_bin='flac metaflac'
lst_lic='COPYING.FDL COPYING.GPL COPYING.LGPL COPYING.Xiph AUTHORS'
lst_pc='flac.pc flac++.pc'

cmake_config='-DBUILD_CXXLIBS=ON -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DINSTALL_MANPAGES=OFF -DWITH_ASM=ON -DWITH_OGG=ON'
cmake_bin='BUILD_PROGRAMS'
cmake_static='BUILD_STATIC_LIBS'

dev_bra='main'
dev_vrs='1.3.4'
stb_bra=''
stb_vrs=''

. xbuild

#$host_arm && ac_config=" --disable-asm-optimizations --disable-vsx --disable-avx --disable-sse --disable-altivec"
#if [ "$build_tool" == "cmake" ] && $host_mingw; then
#  LD=$CC; AS=nasm
#fi


start

# patch on src/libFLAC/CMakeLists.txt and src/libFLAC++/CMakeLists.txt
# to support dual static/shared build
<<'XB64_PATCH'
LS0tIHNyYy9saWJGTEFDL0NNYWtlTGlzdHMudHh0CTIwMjItMDItMjEgMjE6NTU6MTMuMzM2MzI0
NzAwICswMDAwCisrKyBzcmMvbGliRkxBQy9DTWFrZUxpc3RzLnR4dAkyMDIyLTAyLTIxIDIyOjEx
OjA5LjY1NjMyNDcwMCArMDAwMApAQCAtNDYsNyArNDYsMjAgQEAKIAogaW5jbHVkZV9kaXJlY3Rv
cmllcygiaW5jbHVkZSIpCiAKLWFkZF9saWJyYXJ5KEZMQUMKK3NldChGTEFDX1RBUkdFVFMgRkxB
QykKK2lmKEJVSUxEX1NIQVJFRF9MSUJTIEFORCBCVUlMRF9TVEFUSUNfTElCUykKKyAgICBsaXN0
KEFQUEVORCBGTEFDX1RBUkdFVFMgRkxBQy1zdGF0aWMpCitlbmRpZigpCisKK2ZvcmVhY2goVEFS
R0VUICR7RkxBQ19UQVJHRVRTfSkKK2lmKCR7VEFSR0VUfSBNQVRDSEVTICItc3RhdGljJCIpCisg
ICAgc2V0KExJTksgU1RBVElDKQorICAgIHNldChTSEFSRUQgT0ZGKQorZWxzZSgpCisgICAgc2V0
KExJTksgIiIpCisgICAgc2V0KFNIQVJFRCBPTikKK2VuZGlmKCkKK2FkZF9saWJyYXJ5KCR7VEFS
R0VUfSAke0xJTkt9CiAgICAgYml0bWF0aC5jCiAgICAgYml0cmVhZGVyLmMKICAgICBiaXR3cml0
ZXIuYwpAQCAtODQsMzIgKzk3LDM0IEBACiAgICAgdGFyZ2V0X3NvdXJjZXMoRkxBQyBQUklWQVRF
ICQ8VEFSR0VUX09CSkVDVFM6RkxBQy1hc20+KQogZW5kaWYoKQogCi10YXJnZXRfY29tcGlsZV9k
ZWZpbml0aW9ucyhGTEFDCi0gICAgUFJJVkFURSAkPCQ8Qk9PTDoke0JVSUxEX1NIQVJFRF9MSUJT
fT46RkxBQ19BUElfRVhQT1JUUz4KLSAgICBQVUJMSUMgJDwkPE5PVDokPEJPT0w6JHtCVUlMRF9T
SEFSRURfTElCU30+PjpGTEFDX19OT19ETEw+KQordGFyZ2V0X2NvbXBpbGVfZGVmaW5pdGlvbnMo
JHtUQVJHRVR9CisgICAgUFJJVkFURSAkPCQ8Qk9PTDoke1NIQVJFRH0+OkZMQUNfQVBJX0VYUE9S
VFM+CisgICAgUFVCTElDICQ8JDxOT1Q6JDxCT09MOiR7U0hBUkVEfT4+OkZMQUNfX05PX0RMTD4p
CiBpZihOT1QgV0lOMzIpCi0gICAgdGFyZ2V0X2NvbXBpbGVfZGVmaW5pdGlvbnMoRkxBQyBQUklW
QVRFICQ8JDxCT09MOiR7QlVJTERfU0hBUkVEX0xJQlN9PjpGTEFDX19VU0VfVklTSUJJTElUWV9B
VFRSPikKKyAgICB0YXJnZXRfY29tcGlsZV9kZWZpbml0aW9ucygke1RBUkdFVH0gUFJJVkFURSAk
PCQ8Qk9PTDoke1NIQVJFRH0+OkZMQUNfX1VTRV9WSVNJQklMSVRZX0FUVFI+KQogZW5kaWYoKQot
dGFyZ2V0X2luY2x1ZGVfZGlyZWN0b3JpZXMoRkxBQyBJTlRFUkZBQ0UKK3RhcmdldF9pbmNsdWRl
X2RpcmVjdG9yaWVzKCR7VEFSR0VUfSBJTlRFUkZBQ0UKICAgICAiJDxCVUlMRF9JTlRFUkZBQ0U6
JHtQUk9KRUNUX1NPVVJDRV9ESVJ9L2luY2x1ZGU+IgogICAgICIkPElOU1RBTExfSU5URVJGQUNF
OiR7Q01BS0VfSU5TVEFMTF9JTkNMVURFRElSfT4iKQotdGFyZ2V0X2xpbmtfbGlicmFyaWVzKEZM
QUMgUFVCTElDICQ8JDxCT09MOiR7SEFWRV9MUk9VTkR9PjptPikKK3RhcmdldF9saW5rX2xpYnJh
cmllcygke1RBUkdFVH0gUFVCTElDICQ8JDxCT09MOiR7SEFWRV9MUk9VTkR9PjptPikKIGlmKFRB
UkdFVCBPZ2c6Om9nZykKLSAgICB0YXJnZXRfbGlua19saWJyYXJpZXMoRkxBQyBQVUJMSUMgT2dn
OjpvZ2cpCisgICAgdGFyZ2V0X2xpbmtfbGlicmFyaWVzKCR7VEFSR0VUfSBQVUJMSUMgT2dnOjpv
Z2cpCiBlbmRpZigpCi1pZihCVUlMRF9TSEFSRURfTElCUykKLSAgICBzZXRfdGFyZ2V0X3Byb3Bl
cnRpZXMoRkxBQyBQUk9QRVJUSUVTCitpZihTSEFSRUQpCisgICAgc2V0X3RhcmdldF9wcm9wZXJ0
aWVzKCR7VEFSR0VUfSBQUk9QRVJUSUVTCiAgICAgICAgIFZFUlNJT04gOC4zLjAKICAgICAgICAg
U09WRVJTSU9OIDgpCiAgICAgaWYoTk9UIFdJTjMyKQotICAgICAgICBzZXRfdGFyZ2V0X3Byb3Bl
cnRpZXMoRkxBQyBQUk9QRVJUSUVTIENfVklTSUJJTElUWV9QUkVTRVQgaGlkZGVuKQorICAgICAg
ICBzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoJHtUQVJHRVR9IFBST1BFUlRJRVMgQ19WSVNJQklMSVRZ
X1BSRVNFVCBoaWRkZW4pCiAgICAgZW5kaWYoKQorZWxzZSgpCisgICAgc2V0X3RhcmdldF9wcm9w
ZXJ0aWVzKCR7VEFSR0VUfSBQUk9QRVJUSUVTIE9VVFBVVF9OQU1FIEZMQUMpCiBlbmRpZigpCi0K
K2VuZGZvcmVhY2goKQogYWRkX2xpYnJhcnkoRkxBQzo6RkxBQyBBTElBUyBGTEFDKQogCiAKLWlu
c3RhbGwoVEFSR0VUUyBGTEFDIEVYUE9SVCB0YXJnZXRzCitpbnN0YWxsKFRBUkdFVFMgJHtGTEFD
X1RBUkdFVFN9IEVYUE9SVCB0YXJnZXRzCiAgICAgQVJDSElWRSBERVNUSU5BVElPTiAiJHtDTUFL
RV9JTlNUQUxMX0xJQkRJUn0vIgogICAgIExJQlJBUlkgREVTVElOQVRJT04gIiR7Q01BS0VfSU5T
VEFMTF9MSUJESVJ9LyIKICAgICBSVU5USU1FIERFU1RJTkFUSU9OICIke0NNQUtFX0lOU1RBTExf
QklORElSfS8iKQoKLS0tIHNyYy9saWJGTEFDKysvQ01ha2VMaXN0cy50eHQJMjAyMi0wMi0yMSAy
MjowMjo0MC4wMDYzMjQ3MDAgKzAwMDAKKysrIHNyYy9saWJGTEFDKysvQ01ha2VMaXN0cy50eHQJ
MjAyMi0wMi0yMSAyMjoxMTowNy40MzYzMjQ3MDAgKzAwMDAKQEAgLTExLDMzICsxMSw0NyBAQAog
ICAgIGludCBtYWluKGludCwgY2hhciAqIFtdKSB7IHJldHVybiAwOyB9CiAgICAgI2VuZGlmIgog
ICAgIEhBVkVfQ1hYX1ZBUkFSUkFZUykKK3NldChGTEFDX1RBUkdFVFMgRkxBQysrKQoraWYoQlVJ
TERfU0hBUkVEX0xJQlMgQU5EIEJVSUxEX1NUQVRJQ19MSUJTKQorICAgIGxpc3QoQVBQRU5EIEZM
QUNfVEFSR0VUUyBGTEFDKystc3RhdGljKQorZW5kaWYoKQogCi1hZGRfbGlicmFyeShGTEFDKysK
K2ZvcmVhY2goVEFSR0VUICR7RkxBQ19UQVJHRVRTfSkKK2lmKCR7VEFSR0VUfSBNQVRDSEVTICIt
c3RhdGljJCIpCisgICAgc2V0KExJTksgU1RBVElDKQorICAgIHNldChTSEFSRUQgT0ZGKQorZWxz
ZSgpCisgICAgc2V0KExJTksgIiIpCisgICAgc2V0KFNIQVJFRCBPTikKK2VuZGlmKCkKK2FkZF9s
aWJyYXJ5KCR7VEFSR0VUfSAke0xJTkt9CiAgICAgbWV0YWRhdGEuY3BwCiAgICAgc3RyZWFtX2Rl
Y29kZXIuY3BwCiAgICAgc3RyZWFtX2VuY29kZXIuY3BwKQotdGFyZ2V0X2NvbXBpbGVfZGVmaW5p
dGlvbnMoRkxBQysrCi0gICAgUFJJVkFURSAkPCQ8Qk9PTDoke0JVSUxEX1NIQVJFRF9MSUJTfT46
RkxBQ1BQX0FQSV9FWFBPUlRTPgotICAgIFBVQkxJQyAkPCQ8Tk9UOiQ8Qk9PTDoke0JVSUxEX1NI
QVJFRF9MSUJTfT4+OkZMQUNfX05PX0RMTD4pCit0YXJnZXRfY29tcGlsZV9kZWZpbml0aW9ucygk
e1RBUkdFVH0KKyAgICBQUklWQVRFICQ8JDxCT09MOiR7U0hBUkVEfT46RkxBQ1BQX0FQSV9FWFBP
UlRTPgorICAgIFBVQkxJQyAkPCQ8Tk9UOiQ8Qk9PTDoke1NIQVJFRH0+PjpGTEFDX19OT19ETEw+
KQogaWYoTk9UIFdJTjMyKQotICAgIHRhcmdldF9jb21waWxlX2RlZmluaXRpb25zKEZMQUMrKyBQ
UklWQVRFICQ8JDxCT09MOiR7QlVJTERfU0hBUkVEX0xJQlN9PjpGTEFDX19VU0VfVklTSUJJTElU
WV9BVFRSPikKKyAgICB0YXJnZXRfY29tcGlsZV9kZWZpbml0aW9ucygke1RBUkdFVH0gUFJJVkFU
RSAkPCQ8Qk9PTDoke0JVSUxEX1NIQVJFRF9MSUJTfT46RkxBQ19fVVNFX1ZJU0lCSUxJVFlfQVRU
Uj4pCiBlbmRpZigpCi10YXJnZXRfaW5jbHVkZV9kaXJlY3RvcmllcyhGTEFDKysgSU5URVJGQUNF
Cit0YXJnZXRfaW5jbHVkZV9kaXJlY3Rvcmllcygke1RBUkdFVH0gSU5URVJGQUNFCiAgICAgIiQ8
QlVJTERfSU5URVJGQUNFOiR7UFJPSkVDVF9TT1VSQ0VfRElSfS9pbmNsdWRlPiIKICAgICAiJDxJ
TlNUQUxMX0lOVEVSRkFDRToke0NNQUtFX0lOU1RBTExfSU5DTFVERURJUn0+IikKLXRhcmdldF9s
aW5rX2xpYnJhcmllcyhGTEFDKysgUFVCTElDIEZMQUMpCi1pZihCVUlMRF9TSEFSRURfTElCUykK
LSAgICBzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoRkxBQysrIFBST1BFUlRJRVMKK3RhcmdldF9saW5r
X2xpYnJhcmllcygke1RBUkdFVH0gUFVCTElDIEZMQUMpCitpZihTSEFSRUQpCisgICAgc2V0X3Rh
cmdldF9wcm9wZXJ0aWVzKCR7VEFSR0VUfSBQUk9QRVJUSUVTCiAgICAgICAgIFZFUlNJT04gNi4z
LjAKICAgICAgICAgU09WRVJTSU9OIDYpCiAgICAgaWYoTk9UIFdJTjMyKQotICAgICAgICBzZXRf
dGFyZ2V0X3Byb3BlcnRpZXMoRkxBQysrIFBST1BFUlRJRVMgQ1hYX1ZJU0lCSUxJVFlfUFJFU0VU
IGhpZGRlbikKKyAgICAgICAgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKCR7VEFSR0VUfSBQUk9QRVJU
SUVTIENYWF9WSVNJQklMSVRZX1BSRVNFVCBoaWRkZW4pCiAgICAgZW5kaWYoKQorZWxzZSgpCisg
ICAgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKCR7VEFSR0VUfSBQUk9QRVJUSUVTIE9VVFBVVF9OQU1F
IEZMQUMrKykKIGVuZGlmKCkKLQorZW5kZm9yZWFjaCgpCiBhZGRfbGlicmFyeShGTEFDOjpGTEFD
KysgQUxJQVMgRkxBQysrKQogCi1pbnN0YWxsKFRBUkdFVFMgRkxBQysrIEVYUE9SVCB0YXJnZXRz
CitpbnN0YWxsKFRBUkdFVFMgJHtGTEFDX1RBUkdFVFN9IEVYUE9SVCB0YXJnZXRzCiAgICAgQVJD
SElWRSBERVNUSU5BVElPTiAiJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0vIgogICAgIExJQlJBUlkg
REVTVElOQVRJT04gIiR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9LyIKICAgICBSVU5USU1FIERFU1RJ
TkFUSU9OICIke0NNQUtFX0lOU1RBTExfQklORElSfS8iKQo=
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++ +++  .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# share/FLAC/cmake/targets.cmake
# share/FLAC/cmake/targets-release.cmake
# share/FLAC/cmake/flac-config.cmake
# share/FLAC/cmake/flac-config-version.cmake
# include/FLAC/all.h
# include/FLAC/assert.h
# include/FLAC/callback.h
# include/FLAC/export.h
# include/FLAC/format.h
# include/FLAC/metadata.h
# include/FLAC/ordinals.h
# include/FLAC/stream_decoder.h
# include/FLAC/stream_encoder.h
# include/FLAC++/all.h
# include/FLAC++/decoder.h
# include/FLAC++/encoder.h
# include/FLAC++/export.h
# include/FLAC++/metadata.h
# lib/libFLAC.so
# lib/libFLAC.a
# lib/pkgconfig/flac.pc
# lib/libFLAC++.so
# lib/libFLAC++.a
# lib/pkgconfig/flac++.pc
# bin/flac
# bin/metaflac