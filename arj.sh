#!/bin/bash

lib='arj'
dsc='Open Source ARJ archiver'
lic='GLP-2.0'
src='https://git.code.sf.net/p/arj/git'
cfg='cmake'

cmake_file='arj.cmake'

lst_inc=''
lst_lib=''
lst_bin=''

dev_vrs=''
pkg_deb=''
eta=''

on_src_release(){
    url='http://deb.debian.org/debian/pool/main/a/arj/'
    vrs=$(curl -s ${url} | grep -oP 'arj_\K([0-9\.]+).orig.tar.gz' | tail -n1)
    src="${url}arj_${vrs}"
    vrs=${vrs/\.orig\.tar\.gz/}
}

on_config(){
    ${src_rel} && on_src_release
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc