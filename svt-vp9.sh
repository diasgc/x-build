#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   +  clang/gcc
# WIN  .   .   .   +  clang/gcc

lib='svt-vp9'
dsc='SVT VP9 encoder'
lic='Other'
src="https://github.com/OpenVisualCloud/SVT-VP9"
cfg='cmake'
pkg='SvtVp9Enc'
eta='15'

dev_bra='master'
dev_vrs='0.3.0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

src_rel=false
WFLAGS='-Wno-unused-function -Wno-unused-but-set-variable -Wno-unused-but-set-parameter -Wno-unused-parameter'

on_config_ndk(){
    # unsupported pthread_setaffinity_np on ndk
    exit_err "Not available for Android ${arch}"
}

. xbuild && start