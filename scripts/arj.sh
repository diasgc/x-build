#!/bin/bash

lib='arj'
dsc='Open Source ARJ archiver'
lic='GLP-2.0'
src='https://git.code.sf.net/p/arj/git'
cfg='ar'
eta='60'
ac_nohost=true
config_dir='gnu'

lst_inc=''
lst_lib=''
lst_bin=''

source_config(){
    autoheader 2>/dev/null
    autoconf 2>/dev/null
}

on_start(){
    dir_build=$dir_src
    ac_config="--host=$(echo ${arch} | sed 's/aarch64/arm/;s/android/gnu/')"
    mkf="-f GNUmakefile"
}

# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc