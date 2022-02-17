#!/bin/bash
# cpu av8 av7 x86 x64
# NDK SYS------------ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='zlib'
apt='zlib1g'
dsc='zlib compression library'
lic='Zlib'
src='https://github.com/madler/zlib.git'
cfg='cmake'
eta='22'
cmake_bin="BUILD_TOOLS"
mkc='distclean'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='zlib.h zconf.h'
lst_lib='libz'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='zlib.pc'

. xbuilder.sh

on_end(){
    $host_mingw && {
        ln -s ${dir_install_lib}/libzlib.dll.a ${dir_install_lib}/libz.a 2>/dev/null
        ln -s ${dir_install_lib}/libzlibstatic.a ${dir_install_lib}/libzstatic.a 2>/dev/null
    }
}

if $host_ndk;then
    pc_libdir="/lib/${arch}"
    create_pkgconfig_file zlib '-lz' "${SYSROOT}/usr"
else
    start
fi

# patch to change pkgconfig install dir from shared/pkgconfig to lib/pkgconfig
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjEtMTAtMTAgMjA6MTg6MTEuMDYzMzE0NDAwICswMTAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIxLTEwLTA5IDIwOjIwOjM2LjkxODA4NjgwMCArMDEwMApAQCAt
MTIsNyArMTIsNyBAQAogc2V0KElOU1RBTExfTElCX0RJUiAiJHtDTUFLRV9JTlNUQUxMX1BSRUZJ
WH0vbGliIiBDQUNIRSBQQVRIICJJbnN0YWxsYXRpb24gZGlyZWN0b3J5IGZvciBsaWJyYXJpZXMi
KQogc2V0KElOU1RBTExfSU5DX0RJUiAiJHtDTUFLRV9JTlNUQUxMX1BSRUZJWH0vaW5jbHVkZSIg
Q0FDSEUgUEFUSCAiSW5zdGFsbGF0aW9uIGRpcmVjdG9yeSBmb3IgaGVhZGVycyIpCiBzZXQoSU5T
VEFMTF9NQU5fRElSICIke0NNQUtFX0lOU1RBTExfUFJFRklYfS9zaGFyZS9tYW4iIENBQ0hFIFBB
VEggIkluc3RhbGxhdGlvbiBkaXJlY3RvcnkgZm9yIG1hbnVhbCBwYWdlcyIpCi1zZXQoSU5TVEFM
TF9QS0dDT05GSUdfRElSICIke0NNQUtFX0lOU1RBTExfUFJFRklYfS9zaGFyZS9wa2djb25maWci
IENBQ0hFIFBBVEggIkluc3RhbGxhdGlvbiBkaXJlY3RvcnkgZm9yIHBrZ2NvbmZpZyAoLnBjKSBm
aWxlcyIpCitzZXQoSU5TVEFMTF9QS0dDT05GSUdfRElSICIke0NNQUtFX0lOU1RBTExfUFJFRklY
fS9saWIvcGtnY29uZmlnIiBDQUNIRSBQQVRIICJJbnN0YWxsYXRpb24gZGlyZWN0b3J5IGZvciBw
a2djb25maWcgKC5wYykgZmlsZXMiKQogCiBpbmNsdWRlKENoZWNrVHlwZVNpemUpCiBpbmNsdWRl
KENoZWNrRnVuY3Rpb25FeGlzdHMpCg==
XB64_PATCH

# Filelist
# --------
# include/zlib.h
# include/zconf.h
# lib/pkgconfig/zlib.pc
# lib/libz.a
# lib/libz.so.1.2.11
# share/man/man3/zlib.3
