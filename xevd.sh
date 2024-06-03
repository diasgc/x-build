#!/bin/bash
# cpu av8 av7 x86 x64
# NDK N/A N/A  .   .  clang
# GNU N/A N/A  .   .  gcc
# WIN N/A N/A  .   .  clang/gcc

lib='xevd'
dsc='eXtra-fast Essential Video Decoder, MPEG-5 EVC (Essential Video Coding)'
lic='BSD-3c'
src='https://github.com/mpeg5/xevd.git'
cfg='cmake'
# -DSET_PROF=MAIN crashes with missing xevdm_itrans_map_tbl_neon fix in branch dev-BuildErrorsHotfix
bra='dev-BuildErrorsHotfix'
src_rel=false # use git
xevd_profile='MAIN' # BASE|MAIN

case $xevd_profile in BASE) sfx='b';; esac

pkg="xevd${sfx}"

lst_inc="xevd${sfx}/*.h"
lst_lib="libxevs${sfx}"
lst_bin="xevd${sfx}_app"
lst_lic='COPYING'
lst_pc="xevd${sfx}.pc"

dev_bra='main'
dev_vrs='0.4.1'
stb_bra=''
stb_vrs='0.4.1'

cmake_config="-DSET_PROF=${xevd_profile} -DXEVD_APP_STATIC_BUILD=ON"
WFLAGS+="-Wno-for-loop-analysis \
 -Wno-unknown-warning-option \
 -Wno-typedef-redefinition \
 -Wno-sometimes-uninitialized \
 -Wno-shift-negative-value \
 -Wno-tautological-pointer-compare"

on_config(){
    $host_native && cmake_config+=' -DXEVD_NATIVE_BUILD=ON'
    $host_arm && cmake_config+=" -DARM=TRUE"
}

build_prepare(){
    # v0.4.1-6-g418ed6d: there's a typo at src_base/neon/xevd_dbk_neon.h
    sed -i 's/_XEVD_DBK_NOEN_H_/_XEVD_DBK_NEON_H_/g' ${dir_src}/src_base/neon/xevd_dbk_neon.h
}

on_end(){
    if $build_static; then
        local a_lib="${dir_install_lib}/${lst_lib}"
        test -f "${a_lib}.a" || ln -sf "${dir_install_lib}/xevd${sfx}/${lst_lib}.a" "${a_lib}.a"
        test -f "${a_lib}.so" && mv -f "${a_lib}.so" "${a_lib}.so_"
    fi
    return 0
}

. xbuild && start