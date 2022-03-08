#!/bin/bash

lib='id3v2'
apt='id3v2-dev'
dsc='Command line id3v2 tag editor'
lic='GPL-2.0'
src='https://salsa.debian.org/debian/id3v2.git'
url='http://id3v2.sourceforge.net/'
cfg='make'
eta='10'

dev_bra='master'
dev_vrs='' #0.1.6
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

. xbuild

start

#             a8  a7  x86 x64
# ndk-clang   ++. ++. ++. ++.
# linux-gnu   ++. ++. ++. ++.
# mingw-llvm  ++. ++. ... ++.

<<'CMAKELISTS.TXT'
cmake_minimum_required(VERSION 2.8.6)

project(id3v2 LANGUAGES CXX VERSION 0.1.12)
option(BUILD_STATIC_LIBS "to build also static libs" ON)

add_definitions(-DVERSION=0.1.12 -Wall -pedantic -O3 -flto)
function(add_lib sfx lnk)
    add_library(id3v2${sfx} ${lnk} convert.cpp list.cpp id3v2.cpp genre.cpp genre.h frametable.h)
    set_target_properties(id3v2${sfx} PROPERTIES OUTPUT_NAME id3v2)
    target_link_library(id3v2${sfx} -lz -lid3)
endfunction()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib("-static" STATIC)
endif()
CMAKELISTS.TXT