#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libdvdnav'
dsc='Library to navigate DVD disks'
lic='GNU General Public License v2.0'
src="https://code.videolan.org/videolan/libdvdnav.git"
dep='libdvdread'
pkg='dvdnav'

cmake_file='libdvdnav'

cfg='ar'
WFLAGS='-Wno-unneeded-internal-declaration -Wno-unused-parameter '

on_src_release(){
    local u="$(sed 's,.git,/-,' <<<${src})"
    vrs="$(tar_version ${u}/tags libdvdnav-)"
    src="${u}/archive/${vrs}/libdvdnav-${vrs}.tar.gz"
    tar_stripcomponents=true
}



dev_bra='master'
dev_vrs='6.1.1'
pkg_deb='libdvdnav-dev'
eta='80'

lst_inc='dvdnav/dvdnav.h dvdnav/dvdnav_events.h dvdnav/dvd_types.h src/dvdnav/version.h'
lst_lib='libdvdnav'
lst_bin=''
lst_lic='AUTHORS ChangeLog COPYING README.md TODO'
lst_pc='dvdnav.pc'

eta='80'

. xbuild && start