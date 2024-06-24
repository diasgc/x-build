#!/bin/bash

lib='xeve'
dsc='eXtra-fast Essential Video Encoder, MPEG-5 EVC (Essential Video Coding)'
lic='Other'
src='https://github.com/mpeg5/xeve.git'
src_rel=false # use git

xeve_profile='MAIN' # BASE|MAIN
case $xeve_profile in BASE) sfx='b';; esac
pkg="xeve${sfx}"

cfg='cmake'
cmake_config="-DSET_PROF=${xeve_profile}"

# supress warnings as errors
WFLAGS+=" -Wno-unknown-warning-option \
 -Wno-empty-body \
 -Wno-shift-negative-value \
 -Wno-parentheses-equality \
 -Wno-typedef-redefinition \
 -Wno-for-loop-analysis"

on_config(){
    cmake_config+=" -DXEVE_NATIVE_BUILD=$(bool2str ${host_native} ON OFF)"
    cmake_config+=" -DARM=$(bool2str ${host_arm} TRUE FALSE)"
}

on_end(){
    if $build_static; then
        local a_lib="${dir_install_lib}/${lst_lib}"
        test -f "${a_lib}.a" || ln -sf "${dir_install_lib}/xeve${sfx}/${lst_lib}.a" "${a_lib}.a"
        test -f "${a_lib}.so" && mv -f "${a_lib}.so" "${a_lib}.so_"
    fi
}

dev_bra='main'
dev_vrs='0.5.1'
pkg_deb=''
eta='112'

lst_inc="xeveb${sfx}/*.h"
lst_lib="libxeve${sfx}"
lst_bin="xeve${sfx}_app"
lst_lic='COPYING'
lst_pc="xeve${sfx}.pc"

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +  N/A  .   .  clang
# GNU  F   F   .   .  gcc
# WIN  F   F   .   .  clang/gcc

# clang mingw-arm64: call to undeclared function 'posix_memalign'
#                    passing '__m128d' (aka 'float64x2_t') to parameter of incompatible type 'float32x4_t'
# clang gnu-arm64:   passing '__m128d' (aka 'float64x2_t') to parameter of incompatible type 'float32x4_t'