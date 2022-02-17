#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ++  ... ... ...
# linux-gnu   ++  ... ... ...
# mingw-llvm  ... ... ... ...

lib='freeimage'
apt="${lib}-dev"
dsc='Open Source library to support popular graphics image formats like PNG, BMP, JPEG, TIFF'
lic='Other'
src='https://svn.code.sf.net/p/freeimage/svn/FreeImage/trunk'
cfg='cmake'
<<<<<<< HEAD
eta='1600'
=======
eta='440'
>>>>>>> 4fccb347cf2eb37d6ea1d35e7eb3c9b3c8b73695

pc_llib="-lfreeimage"

cmake_static='BUILD_STATIC_LIBS'

lst_inc='FreeImage.h FreeImagePlus.h'
lst_lib='libFreeImage'
lst_bin=''
lst_lic='license-fi.txt license-gplv2.txt license-gplv3.txt'
lst_pc='freeimage.pc'

<<<<<<< HEAD
=======
WFLAGS='-Wno-switch -Wno-deprecated-register -Wno-unused-value -Wno-format -Wno-format-extra-args'

>>>>>>> 4fccb347cf2eb37d6ea1d35e7eb3c9b3c8b73695
. xbuilder.sh

source_patch(){
    cd ${dir_src}
    cp Source/FreeImage.h Dist
    s0=$(cat Makefile.srcs | sed -e 's| Source| ./Source|g; s| \./|\n\t|g')
    #s1=$(cat ${SRCDIR}/fipMakefile.srcs | sed -e 's| Source| ./Sources|g; s| \./|\n\t|g')
    local srcs=$(echo "$s0" | sed -n '/SRCS/,/INCLS/p' | sed '1d; $d')
    #local sfip=$(echo "$s1" | sed -n '/SRCS/,/INCLUDE = /p' | sed '1d; $d')
    local hdrs=$(echo "$s0" | sed -n '/INCLS/,/\n\n/p' | sed '1d; $d')
    local incl=$(echo "$s0" | sed -n '/INCLUDE = /,/$/p' | sed ' s/ -I/\n\t/g' | sed '1,2d')
    echo "$(awk -v r="$srcs" '{gsub(/@sourcelist@/,r)}1' CMakeLists.txt)" > CMakeLists.txt
    echo "$(awk -v r="$hdrs" '{gsub(/@headerlist@/,r)}1' CMakeLists.txt)" > CMakeLists.txt
    echo "$(awk -v r="$incl" '{gsub(/@incldir_list@/,r)}1' CMakeLists.txt)" > CMakeLists.txt
}

start

# patch 01 create CMakeLists.txt with dual static shared support
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0XwkyMDIyLTAxLTIwIDE5OjAwOjEyLjczMTU1ODAwMCArMDAwMAor
KysgQ01ha2VMaXN0cy50eHQJMjAyMi0wMS0yMCAxODo1NjoyNi43MTE1NTgwMDAgKzAwMDAKQEAg
LTAsMCArMSw1MyBAQAorY21ha2VfbWluaW11bV9yZXF1aXJlZChWRVJTSU9OIDMuMTEpCisKK3By
b2plY3QoRnJlZUltYWdlKQorCitzZXQoVkVSTElCTkFNRSAzLjE5LjApCisKK3NldChTUkNTIEBz
b3VyY2VsaXN0QAorICAgICkKKworc2V0KEhEUlMgQGhlYWRlcmxpc3RACisgICAgKQorCitpbmNs
dWRlX2RpcmVjdG9yaWVzKCR7Q01BS0VfU09VUkNFX0RJUn0KKyAgICBAaW5jbGRpcl9saXN0QAor
ICAgICkKKworc2V0IChBTExfU1JDICR7U1JDU30gJHtIRFJTfSkKK2FkZF9kZWZpbml0aW9ucygt
V25vLXN3aXRjaCAtV25vLWRlcHJlY2F0ZWQtcmVnaXN0ZXIgLVduby11bnVzZWQtdmFsdWUgLVdu
by1mb3JtYXQgLVduby1mb3JtYXQtZXh0cmEtYXJncykKK2lmKFVOSVgpCisJYWRkX2RlZmluaXRp
b25zKC1PMyAtZlBJQyAtZmV4Y2VwdGlvbnMgLWZ2aXNpYmlsaXR5PWhpZGRlbiAtRF9fQU5TSV9f
KQorCXNldChDTUFLRV9DX0ZMQUdTICIke0NNQUtFX0NfRkxBR1N9IC1zdGQ9Yzk5IC1ET1BKX1NU
QVRJQyAtRE5PX0xDTVMgLURESVNBQkxFX1BFUkZfTUVBU1VSRU1FTlQiKQorCXNldChDTUFLRV9T
SEFSRURfTElOS0VSX0ZMQUdTICIke0NNQUtFX1NIQVJFRF9MSU5LRVJfRkxBR1N9IC1sc3RkYysr
IC1sbSIpCisJc2V0KENNQUtFX0NYWF9GTEFHUyAiJHtDTUFLRV9DWFhfRkxBR1N9IC1zdGQ9Yysr
MHgiKQorZWxzZSgpCisJIyB0b2RvIG1pbmd3MzIKKwlhZGRfZGVmaW5pdGlvbnMoLU8zIC1mZXhj
ZXB0aW9ucyAtRE5ERUJVRykKKwlzZXQoQ01BS0VfQ19GTEFHUyAiJHtDTUFLRV9DX0ZMQUdTfSAt
RERJU0FCTEVfUEVSRl9NRUFTVVJFTUVOVCAtRF9fQU5TSV9fIC1ET1BKX1NUQVRJQyIpCisJc2V0
KENNQUtFX0NYWF9GTEFHUyAiJHtDTUFLRV9DWFhfRkxBR1N9IC1mdmlzaWJpbGl0eT1oaWRkZW4g
LVduby1jdG9yLWR0b3ItcHJpdmFjeSIpCisJc2V0KENNQUtFX1NIQVJFRF9MSU5LRVJfRkxBR1Mg
IiR7Q01BS0VfU0hBUkVEX0xJTktFUl9GTEFHU30gLXMgLXNoYXJlZCAtc3RhdGljIC1sd3MyXzMy
IikKK2VuZGlmKCkKKworaWYoQ01BS0VfU1lTVEVNX1BST0NFU1NPUiBNQVRDSEVTICJeYSIpCisJ
c2V0KENNQUtFX0NfRkxBR1MgIiR7Q01BS0VfQ19GTEFHU30gLURQTkdfQVJNX05FT05fT1BUPU9G
RiIpCitlbmRpZigpCisKK2FkZF9saWJyYXJ5KGZyZWVpbWFnZSAke0FMTF9TUkN9KQorc2V0KFRB
UkdFVFMgZnJlZWltYWdlKQorCitpZihCVUlMRF9TSEFSRURfTElCUyBBTkQgQlVJTERfU1RBVElD
X0xJQlMpCisgICAgYWRkX2xpYnJhcnkoZnJlZWltYWdlX3N0YXRpYyBTVEFUSUMgJHtBTExfU1JD
fSkKKyAgICBzZXRfdGFyZ2V0X3Byb3BlcnRpZXMoZnJlZWltYWdlX3N0YXRpYyBQUk9QRVJUSUVT
IE9VVFBVVF9OQU1FIGZyZWVpbWFnZSkKKyAgICBzZXQoVEFSR0VUUyBmcmVlaW1hZ2UgZnJlZWlt
YWdlX3N0YXRpYykKK2VuZGlmKCkKKworaW5zdGFsbChUQVJHRVRTICR7VEFSR0VUU30KKyAgUlVO
VElNRSBERVNUSU5BVElPTiBiaW4KKyAgTElCUkFSWSBERVNUSU5BVElPTiBsaWIke0xJQl9TVUZG
SVh9CisgIEFSQ0hJVkUgREVTVElOQVRJT04gbGliJHtMSUJfU1VGRklYfQorKQorCitpbnN0YWxs
KEZJTEVTIFNvdXJjZS9GcmVlSW1hZ2UuaCBERVNUSU5BVElPTiBpbmNsdWRlKQoraW5zdGFsbChG
SUxFUyBXcmFwcGVyL0ZyZWVJbWFnZVBsdXMvRnJlZUltYWdlUGx1cy5oIERFU1RJTkFUSU9OIGlu
Y2x1ZGUpCitpbnN0YWxsKEZJTEVTIGxpY2Vuc2UtZmkudHh0IGxpY2Vuc2UtZ3BsdjIudHh0IGxp
Y2Vuc2UtZ3BsdjMudHh0IERFU1RJTkFUSU9OIHNoYXJlL2RvY3MvRnJlZUltYWdlKQ==
XB64_PATCH



# Filelist
# --------
# include/FreeImage.h
# include/FreeImagePlus.h
# lib/pkgconfig/freeimage.pc
# lib/libfreeimage.so
# lib/libfreeimage.a
# share/docs/FreeImage/license-fi.txt
# share/docs/FreeImage/license-gplv3.txt
# share/docs/FreeImage/license-gplv2.txt
