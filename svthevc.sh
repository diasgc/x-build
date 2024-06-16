#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .   clang
# GNU  .   .   .   .   gcc
# WIN  .   .   .   .   clang/gcc

lib='svthevc'
dsc='SVT (Scalable Video Technology) HEVC encoder'
lic='BSD-2-Clause-Patent'
src='https://github.com/OpenVisualCloud/SVT-HEVC.git'

cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin="BUILD_APPS"

on_config_arm(){
  doErr 'Unsupported arm architecture'
}

dev_bra='master'
dev_vrs='1.5.1'
pkg_deb=''
eta='145'

lst_inc='svt-av1/*.h'
lst_lib=''
lst_bin=''
lst_lic='LICENSE.md'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .   clang
# GNU  .   .   .   .   gcc
# WIN  .   .   .   .   clang/gcc