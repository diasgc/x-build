#!/bin/bash

lib='libilbc'
dsc='Internet Low Bitrate Codec (iLBC) library'
lic='BSD-3c'
src='https://github.com/TimothyGu/libilbc.git'
cfg='cmake'
eta='64'
cbk="examples"

cfg_static='BUILD_STATIC_LIBS'
#cfg_bin=''

dev_bra='main'
dev_vrs='3.0.4'
stb_bra='tags/3.0.4'
stb_vrs='3.0.4'

lst_inc='ilbc.h ilbc_export.h'
lst_lib='libilbc'
lst_bin='ilbc_test'
lst_lic='COPYING AUTHORS'
lst_pc='libilbc.pc'

. xbuilder.sh

source_get(){
    do_progress 'git' git clone --depth=1 $src $lib
    cd $lib
    do_log 'sub' git submodule update --init
    cd ..
}


start

# Patch to support dual static+shared build. Do not edit
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMuYmFrCTIwMjItMDEtMTUgMTc6MDA6NDcuNjAyMDAwMDAwICswMDAw
CisrKyBDTWFrZUxpc3RzLnR4dAkyMDIyLTAxLTE1IDE3OjIxOjMyLjY4NjQ1MjYwMCArMDAw
MApAQCAtMzA1LDYgKzMwNSwxNCBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICMjIENv
bmZpZ3VyZSBvdXRwdXQgZmlsZXMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCitzZXQoaWxi
Y19zdGF0aWMgIiIpCitpZiAoQlVJTERfU0hBUkVEX0xJQlMgQU5EIEJVSUxEX1NUQVRJQ19M
SUJTKQorICAgIGFkZF9saWJyYXJ5KGlsYmMtc3RhdGljIFNUQVRJQyAke2lsYmNfc291cmNl
X2ZpbGVzfSkKKyAgICBzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoaWxiYy1zdGF0aWMgUFJPUEVS
VElFUyBWRVJTSU9OICR7UFJPSkVDVF9WRVJTSU9OfSBTT1ZFUlNJT04gMykKKyAgICBzZXRf
dGFyZ2V0X3Byb3BlcnRpZXMoaWxiYy1zdGF0aWMgUFJPUEVSVElFUyBDTEVBTl9ESVJFQ1Rf
T1VUUFVUIDEpCisgICAgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKGlsYmMtc3RhdGljIFBST1BF
UlRJRVMgT1VUUFVUX05BTUUgaWxiYykKKyAgICBzZXQoaWxiY19zdGF0aWMgImlsYmMtc3Rh
dGljIikKK2VuZGlmKCkKIAogYWRkX2xpYnJhcnkoaWxiYyAke2lsYmNfc291cmNlX2ZpbGVz
fSkKIGdlbmVyYXRlX2V4cG9ydF9oZWFkZXIoaWxiYykKQEAgLTMzMiw3ICszNDAsNyBAQAog
ICAgICAgICBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfSU5DTFVERURJUn0pCiBpbnN0
YWxsKEZJTEVTIENPTlRSSUJVVElORy5tZCBORVdTLm1kIFJFQURNRS5tZAogICAgICAgICBE
RVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfRE9DRElSfSkKLWluc3RhbGwoVEFSR0VUUyBp
bGJjIGlsYmNfdGVzdAoraW5zdGFsbChUQVJHRVRTIGlsYmMgJHtpbGJjX3N0YXRpY30gaWxi
Y190ZXN0CiAgICAgICAgIFJVTlRJTUUgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0JJ
TkRJUn0KICAgICAgICAgTElCUkFSWSBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfTElC
RElSfQogICAgICAgICBBUkNISVZFIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJE
SVJ9KQo=
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ilbc.h
# include/ilbc_export.h
# lib/pkgconfig/libilbc.pc
# lib/libilbc.a
# lib/libilbc.so
# share/doc/libilbc/AUTHORS
# share/doc/libilbc/README.md
# share/doc/libilbc/NEWS.md
# share/doc/libilbc/CONTRIBUTING.md
# share/doc/libilbc/COPYING
# bin/ilbc_test
