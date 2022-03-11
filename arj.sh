#!/bin/bash

lib='arj'
dsc='Open Source ARJ archiver'
lic='GLP-2.0'
src='http://deb.debian.org/debian/pool/main/a/arj/arj_3.10.22.orig.tar.gz'
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