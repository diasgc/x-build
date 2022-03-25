#!/bin/bash

lib='arj'
dsc='Open Source ARJ archiver'
lic='GLP-2.0'
#src='http://deb.debian.org/debian/pool/main/a/arj/arj_3.10.22.orig.tar.gz'
src='https://git.code.sf.net/p/arj/git'
cfg='ac'
eta='60'
#ac_nohost=true
config_dir='gnu'
ac_opts="--update-config_sub --update-config_guess"

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild

source_config(){
    autoheader 2>/dev/null
    autoconf 2>/dev/null
    patch_fromremote "https://git.hadrons.org/cgit/debian/pkgs/arj.git/plain/debian/patches" 001_arches_align.patch \
        002_no_remove_static_const.patch \
        003_64_bit_clean.patch \
        004_parallel_build.patch \
        005_use_system_strnlen.patch \
        006_use_safe_strcpy.patch \
        doc_refer_robert_k_jung.patch \
        fix-time_t-usage.patch \
        gnu_build_cross.patch \
        gnu_build_fix.patch \
        gnu_build_fix_autoreconf.patch \
        gnu_build_flags.patch \
        gnu_build_pie.patch \
        gnu_build_strip.patch \
        hurd_no_fcntl_getlk.patch \
        out-of-bounds-read.patch \
        remove_build_date.patch \
        reproducible_help_archive.patch \
        security-afl.patch \
        security-traversal-dir.patch \
        security-traversal-symlink.patch \
        security_format.patch \
        self_integrity_64bit.patch
}

unset CSH
ac_config="--disable-libc"
mkf="-f ../GNUmakefile"
export CC_FOR_BUILD=gcc

start

# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


<<'CMakeLists.txt'
cmake_minimum_required(VERSION 3.5)

set(VERSION 3.10.22)
project(arj VERSION ${VERSION} LANGUAGES C CXX)

add_definitions(-DLOCALE=LANG_en -DLOCALE_DESC=en -DPKGLIBDIR=lib/arj)

option(COMMERCIAL "Commercial use" OFF)
option(LIBC "link dynamically to libc" OFF)
option(NP_SFX "Force disable packing of SFX modules" OFF)

if(UNIX)
    add_definitions(-D_UNIX -DELF_EXECUTABLES=1 -DREGISTER=arj-register)
    set(DYN_LIBS -ldl)
endif()
if(NP_SFX)
    add_definitions(-DNP_SFX=1)
endif()
if(LIBC)
    add_definitions(-DLIBC=1)
endif()
if(CMAKE_SYSTEM_PROCESSOR MATCHES ^arm OR CMAKE_SYSTEM_PROCESSOR MATCHES ^aarch)
    add_definitions(-DALIGN_POINTERS)
endif()

function(test_c)
    CMAKE_C_COMPILE 
    #include <fnmatch.h>
    int main()
    {
        return(fnmatch("@<:@", "@<:@", 0)); /* Must return 0 for a valid match */
    }
    OUT
endfunction()
#undef NP_SFX
#undef HAVE_STDINT_H
#undef HAVE_MKDTEMP
#undef HAVE_FCLOSEALL
#undef HAVE_SETPRIORITY
#undef HAVE_STRCASECMP
#undef HAVE_STRUPR
#undef HAVE_STRLWR
#undef USE_COLORS
#undef WORDS_BIGENDIAN
#undef TOLERANT_FNMATCH

CMakeLists.txt