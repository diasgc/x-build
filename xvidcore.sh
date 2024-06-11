#!/bin/bash

lib='xvidcore'
dsc='Xvid decoder/encoder library'
lic='GPL'
url='https://labs.xvid.com/source/'
vrs="1.3.7"
src="https://downloads.xvid.com/downloads/xvidcore-${vrs}.tar.gz"
cfg='cmake'

pkg='libxvidcore'
pc_url=$url

cmake_file='xvidcore'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_EXECUTABLES'

dev_vrs='1.4.0'
pkg_deb='libxvidcore-dev'
eta='96'

lst_inc='xvid.h'
lst_lib='libxvidcore'
lst_bin='xvid_bench xvid_decraw xvid_encraw'
lst_lic='LICENSE AUTHORS'
lst_pc='libxvidcore.pc'

source_get(){
    pushd $dir_sources
	svn checkout http://svn.xvid.org/trunk --username anonymous --password '' .
	popd
}

on_config(){
	cmake_config="-DXVID_PKGCONFIG_IN=${dir_root}/cmake/pkg-config.pc.in"
	LDFLAGS+=' -lm'
}

on_config_mingw(){
	build_bin=false
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   +   .   .  clang
# GNU  +   .   .   .  gcc
# WIN  +   .   .   .  clang/gcc

# Filelist
# --------
# include/xvid.h
# lib/pkgconfig/xvidcore.pc
# lib/libxvidcore.so.4.3
# lib/libxvidcore.a
# bin/xvid_bench
# bin/xvid_decraw
# bin/xvid_encraw