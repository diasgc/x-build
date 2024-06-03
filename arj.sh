#!/bin/bash

lib='arj'
dsc='Open Source ARJ archiver'
lic='GLP-2.0'
src='https://git.code.sf.net/p/arj/git'
cfg='cmake'
eta='60'
cmake_cmakelists='arj.cmake'

lst_inc=''
lst_lib=''
lst_bin=''

on_config(){
    if ${src_rel}; then
        url='http://deb.debian.org/debian/pool/main/a/arj/'
        vrs=$(curl -s ${url} | grep -oP 'arj_\K([0-9\.]+).orig.tar.gz' | tail -n1)
        src="${url}arj_${vrs}"
        vrs=${vrs/\.orig\.tar\.gz/}
    fi
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc