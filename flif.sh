#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc
# warning: Warning static builds of getopt violate the Lesser GNU Public License

lib='flif'
dsc='Free Lossless Image Format'
lic='BSD-2c Apache-2.0 GPL-2.0 LGPL-2.1'
src='https://github.com/FLIF-hub/FLIF.git'
cfg='cmake'
dep='libpng'
eta='60'

lst_inc='flif_dec.h flif_enc.h flif.h flif_common.h'
lst_lib='libflif libflif_dec'
lst_bin='flif apng2flif gif2flif dflif'
lst_lic='share/licenses/FLIF/LICENSE_Apache2
    share/licenses/FLIF/LICENSE
    share/licenses/FLIF/LICENSE_GPL
    share/licenses/FLIF/LICENSE_LGPL
    share/licenses/FLIF/FLIF-CLA-template.txt'

pc_llibs=$lst_lib
config_dir='src'

. xbuilder.sh

CPPFLAGS+=" -Wno-sign-compare -Wno-type-limits"
HOST_NPROC=16

start

<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjEtMTAtMDkgMTQ6Mzk6MjAuNzgzMDAwMDAwICswMTAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTEwLTA5IDE0OjQxOjE0LjgwMTc4MDMwMCArMDEwMApAQCAt
NSw2ICs1LDcgQEAKIGluY2x1ZGUoRmluZFBrZ0NvbmZpZykKIGZpbmRfcGFja2FnZShQTkcgUkVR
VUlSRUQpCiBpbmNsdWRlX2RpcmVjdG9yaWVzKCR7UE5HX0lOQ0xVREVfRElSU30pCitvcHRpb24o
VVNFX1NETCAiVXNlIFNETCIgT0ZGKQogb3B0aW9uKEJVSUxEX1NIQVJFRF9MSUJTICJCdWlsZCBz
aGFyZWQgRkxJRiBlbmNvZGVyL2RlY29kZXIgbGlicmFyaWVzIiBPTikKIG9wdGlvbihCVUlMRF9T
VEFUSUNfTElCUyAiQnVpbGQgc3RhdGljIEZMSUYgZW5jb2Rlci9kZWNvZGVyIGxpYnJhcmllcyIg
T04pCiAKQEAgLTEyLDYgKzEzLDcgQEAKICMgZmluZCBTREwyCiAKIGZpbmRfcGFja2FnZShQa2dD
b25maWcgUVVJRVQpCitpZiAoVVNFX1NETCkKIHBrZ19jaGVja19tb2R1bGVzKFBLR19TREwyIFFV
SUVUIHNkbDIpCiAKIGZpbmRfcGF0aChTREwyX0lOQ0xVREVfRElSCkBAIC0zOCw2ICs0MCw4IEBA
CiAgIFBBVEhfU1VGRklYRVMgeDY0IHg4NgogKQogCitlbmRpZihVU0VfU0RMKQorCiBpbmNsdWRl
KEZpbmRQYWNrYWdlSGFuZGxlU3RhbmRhcmRBcmdzKQogZmluZF9wYWNrYWdlX2hhbmRsZV9zdGFu
ZGFyZF9hcmdzKFNETDIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSRVFVSVJF
RF9WQVJTIFNETDJfSU5DTFVERV9ESVIgU0RMMl9MSUJSQVJZIFNETDJNQUlOX0xJQlJBUlkpCi0t
LSBpbWFnZS9jcmMzMmsuaHBwCTIwMjEtMTAtMDkgMTU6MzU6MzcuMTIxNzgwMzAwICswMTAwCisr
KyBpbWFnZS9jcmMzMmsuaHBwCTIwMjEtMTAtMDkgMjA6MDE6MjguNzY4MDg2ODAwICswMTAwCkBA
IC0zLDcgKzMsNyBAQAogI2luY2x1ZGUgPHN0ZGxpYi5oPgogCiAvLyBkZWZpbmUgZW5kaWFuZXNz
IGFuZCBzb21lIGludGVnZXIgZGF0YSB0eXBlcwotI2lmIGRlZmluZWQoX01TQ19WRVIpIHx8IGRl
ZmluZWQoX19NSU5HVzMyX18pCisjaWYgZGVmaW5lZChfTVNDX1ZFUikgfHwgZGVmaW5lZChfX01J
TkdXMzJfXykgJiYgZGVmaW5lZChfX2FtZDY0X18pCiAgIHR5cGVkZWYgdW5zaWduZWQgX19pbnQ4
ICB1aW50OF90OwogICB0eXBlZGVmIHVuc2lnbmVkIF9faW50MTYgdWludDE2X3Q7CiAgIHR5cGVk
ZWYgdW5zaWduZWQgX19pbnQzMiB1aW50MzJfdDs=
XB64_PATCH

# Filelist
# --------
# include/flif_dec.h
# include/flif_enc.h
# include/flif.h
# include/flif_common.h
# lib/pkgconfig/flif_dec.pc
# lib/pkgconfig/flif.pc
# lib/libflif.so.0
# lib/libflif.a
# lib/libflif_dec.a
# lib/libflif_dec.so.0
# share/FLIF/flif.magic
# share/man/man1/flif.1
# share/mime/packages/flif-mime.xml
# share/licenses/FLIF/LICENSE_Apache2
# share/licenses/FLIF/LICENSE
# share/licenses/FLIF/LICENSE_GPL
# share/licenses/FLIF/LICENSE_LGPL
# share/licenses/FLIF/FLIF-CLA-template.txt
# bin/flif
# bin/apng2flif
# bin/gif2flif
# bin/dflif
