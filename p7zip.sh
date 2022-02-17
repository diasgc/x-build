#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='p7zip'
dsc='p7zip is a port of the Windows programs 7z.exe and 7za.exe provided by 7-zip'
lic='MLP-2.0'
src='https://github.com/jinfeihan57/p7zip.git'
cfg='make'
eta='600'

. xbuilder.sh

static_ldflag=-static
CXXFLAGS+=" $CPPFLAGS -Wno-c++11-narrowing -Wno-dangling-else -Wno-switch"
CC="$CC $CFLAGS $CPPFLAGS"
mkf="7z 7za OPTFLAGS=${CXXFLAGS} DEST_HOME=${dir_install}"
mki="install DEST_HOME=${dir_install}"

before_make(){
    make clean
	$host_ndk && cp -f $dir_src/makefile.android $dir_src/makefile.machine
}

on_make(){
    cd $dir_src
    CC="$CC $CFLAGS $CPPFLAGS"
    make -j4 7z 7za OPTFLAGS="${CXXFLAGS}" DEST_HOME=${dir_install}
    mki="install DEST_HOME=${dir_install}"
}

create_package(){
    make install DEST_HOME=${1}
}

start

<<'XB64_PATCH'
LS0tIEMvaGFzaGVzL2hhc2guaAkyMDIyLTAyLTA4IDIzOjEzOjI4LjA0NDAwMDAwMCArMDAwMAor
KysgQy9oYXNoZXMvaGFzaC5oCTIwMjItMDItMDggMjM6MTM6MzIuNjU5MDAwMDAwICswMDAwCkBA
IC00NywxMiArNDcsMTAgQEAKICNkZWZpbmUgX1VJTlQzMl9UX0RFQ0xBUkVECiAjZW5kaWYKIAot
I2lmbmRlZiBfX0FORFJPSURfXwogI2lmbmRlZiBfVUlOVDY0X1RfREVDTEFSRUQKIHR5cGVkZWYg
VUludDY0IHVpbnQ2NF90OwogI2RlZmluZSBfVUlOVDY0X1RfREVDTEFSRUQKICNlbmRpZgotI2Vu
ZGlmCiAKIC8vI2luY2x1ZGUgPHN0ZGludC5oPgogCgotLS0gbWFrZWZpbGUuYW5kcm9pZAkxOTcw
LTAxLTAxIDAxOjAwOjAwLjAwMDAwMDAwMCArMDEwMAorKysgbWFrZWZpbGUuYW5kcm9pZAkyMDIy
LTAyLTA4IDIzOjE2OjMyLjg1OTAxODUwMCArMDAwMApAQCAtMCwwICsxLDE5IEBACitBTkRST0lE
X0ZMQUdTPSAtTU1EIC1NUCAtTUYgLWZwaWMgLU8zIC1mbHRvIC1EQU5EUk9JRCAtREFORFJPSURf
TkRLIC1ETkRFQlVHCisKK0FORFJPSURfTElOSz0gLVdsLC0tZ2Mtc2VjdGlvbnMgLVdsLC16LG5v
Y29weXJlbG9jIC1XbCwtLW5vLXVuZGVmaW5lZCAtV2wsLXosbm9leGVjc3RhY2sgLVdsLC16LHJl
bHJvIC1XbCwteixub3cgLWxjIC1sbSAtTC91c3IvYWFyY2g2NC1saW51eC1hbmRyb2lkL2xvY2Fs
L2xpYiAtbGljb252CisKK09QVEZMQUdTPS1PMyAtZmx0byAtcworCitBTExGTEFHUz0ke09QVEZM
QUdTfSAtcGlwZSAtRE5ERUJVRyAtRF9SRUVOVFJBTlQgLURFTlZfVU5JWCAkKEFORFJPSURfRkxB
R1MpICQoTE9DQUxfRkxBR1MpCisKK0NYWCs9IC1mZXhjZXB0aW9ucyAtZnJ0dGkKK0NDX0VYRT0g
LWZQSUUKK0xJTktfRVhFPS1mUElFIC1waWUgICMgLWZQSUUgLXBpZSA6IG9ubHkgZm9yIGV4ZWN1
dGFibGUKK0NDX1NIQVJFRD0gLWZwaWMKK0xJTktfU0hBUkVEPS1mcGljIC1zaGFyZWQKKworTE9D
QUxfTElCUz0kKEFORFJPSURfTElOSykKK0xPQ0FMX0xJQlNfRExMPSQoTE9DQUxfTElCUykgIyAt
bGRsCisKK09CSl9DUkMzMj0kKE9CSl9DUkMzMl9DKQorT0JKX0FFUz0K
XB64_PATCH