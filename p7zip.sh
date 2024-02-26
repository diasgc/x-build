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

. xbuild

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
