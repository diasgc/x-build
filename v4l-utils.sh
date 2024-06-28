#!/bin/bash

lib='v4l-utils'
dsc='Linux utilities and libraries to handle media devices'
lic='GPLv2'
src="http://git.linuxtv.org/v4l-utils.git"

cfg='meson'
meson_config='-Dqv4l2=disabled
 -Dqvidcap=disabled
 -Dv4l2-tracer=disabled
 -Ddoxygen-doc=disabled
 -Ddoxygen-html=false
 -Ddoxygen-man=false
 -Dv4l-plugins=false
 -Dv4l-utils=false
 -Dv4l-wrappers=false'

_on_config_ndk(){
    #meson_config+=" --sysroot=${SYSROOT}"
    LDFLAGS+=" -L${dir_root}/gnutls/build_${arch}/gl/.libs -lgnu"
}

dev_bra='master'
dev_vrs=''
pkg_deb='libv4l-utils-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc
