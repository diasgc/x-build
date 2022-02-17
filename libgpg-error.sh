#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   +++ +++ +++ +++
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libgpg-error'
pkg='gpg-error'
apt='libgpg-error-dev'
dsc='Error codes used by GnuPG et al.'
lic='GPL-2.0'
src='https://github.com/gpg/libgpg-error.git'
cfg='ar'
eta='60'

. xbuilder.sh

CFG="--disable-languages --disable-doc --disable-tests"
CPPFLAGS+=" -I${SRCDIR}/src"
LDFLAGS+=" -L${SRCDIR}/src"

case $arch in *android*) CFG+=" --disable-threads";; esac

source_patch(){
    local p="${dir_src}/src/syscfg/lock-obj-pub."
    cp "${p}arm-unknown-linux-androideabi.h" "${p}aarch64-unknown-linux-android.h"
    cp "${p}arm-unknown-linux-androideabi.h" "${p}i686-unknown-linux-android.h"
    sed -i "s/_priv\[4\]/_priv[8]/; s/0/&,&/g" "${p}aarch64-unknown-linux-android.h"
    cp "${p}aarch64-unknown-linux-android.h" "${p}x86_64-unknown-linux-android.h"
}

before_make(){
    cd ${dir_src}
    # let make fail but generate 'gpg-error.h' so we can patch it after that
    make 2>&1 >/dev/null
    [ -f "${dir_src}/src/gpg-error.h" ] && sed -i "/^}}}/d" ${dir_src}/src/gpg-error.h
}

start

# Filelist
# --------
# include/gpgrt.h
# include/gpg-error.h
# lib/pkgconfig/gpg-error.pc
# lib/libgpg-error.so
# lib/libgpg-error.a
# lib/libgpg-error.la
# share/aclocal/gpgrt.m4
# share/aclocal/gpg-error.m4
# bin/gpg-error-config
# bin/gpgrt-config
# bin/gpg-error
