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
eta='1600'

pc_llib="-lfreeimage"

cmake_static='BUILD_STATIC_LIBS'

lst_inc='FreeImage.h FreeImagePlus.h'
lst_lib='libFreeImage'
lst_bin=''
lst_lic='license-fi.txt license-gplv2.txt license-gplv3.txt'
lst_pc='freeimage.pc'

. xbuild

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
