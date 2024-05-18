#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# all: missing make install
#
# ndk: [src/argp-getopt.h:179:12]
#           warning: a function declaration without a prototype is deprecated in all versions of C and is treated as a zero-parameter prototype
#           extern int getopt ();
#      [src/argp-fmtstream.c:107:7]
#           error: call to undeclared function 'fwrite_unlocked'
#           fwrite_unlocked (fs->buf, 1, fs->p - fs->buf, fs->stream);


lib='argp-standalone'
dsc='Another standalone version of the argp argument parsing functions from glibc'
lic='GNU Lesser General Public License v2.1'
vrs=''
src="https://github.com/tom42/argp-standalone.git"
cfg='cmake'
eta='0'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

on_config(){
    cmake_config='-DBUILD_TESTING=OFF'
    $host_ndk && cmake_fulltoolchain=true && cmake_config+=" -DCMAKE_C_COMPILER_CLANG_SCAN_DEPS=${CROSS_PREFIX}clang-scan-deps"
    #$host_ming32 || cmake_definitions+=('-D_GNU_SOURCE=1')
}

. xbuild && start