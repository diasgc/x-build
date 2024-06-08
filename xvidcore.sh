#!/bin/bash

lib='xvidcore'
dsc='Xvid decoder/encoder library'
lic='GPL'
url='https://labs.xvid.com/source/'
#src='https://github.com/Distrotech/xvidcore.git'
vrs="1.3.7"
src="https://downloads.xvid.com/downloads/xvidcore-${vrs}.tar.gz"
cfg='cmake'
eta='20'
pkg='libxvidcore'
pc_url=$url
#pc_llib='-lxvidcore'

lst_inc='xvid.h'
lst_lib='libxvidcore.*'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='libxvidcore.pc'

#WFLAGS="-Wno-unused-but-set-variable -Wno-shift-negative-value -Wno-misleading-indentation -Wno-unused-command-line-argument"

source_get(){
    pushd $dir_sources
	svn checkout http://svn.xvid.org/trunk --username anonymous .
	#wget -qO- $src 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz >/dev/null 2>&1 || err
	popd
}

_before_make(){
	rm $dir_install/lib/libxvidcore.so*
	sed -i 's/-O2 -fstrength-reduce/-Ofast -flto/g' ${dir_config}/platform.inc
}

on_config(){
	if [ "x${cfg}" == "xac" ]; then
		dir_config="${dir_src}/build/generic"
		dir_build="${dir_src}/build/generic"
		$host_ndk && $host_x86 && CFG+=" --disable-assembly"
		$host_clang && static_ldflag="-static";
		unset CSH build_link # unsupported static/shared tags
	else
		cmake_config="-DXVID_PKGCONFIG_IN=${dir_root}/cmake/pkg-config.pc.in"
	fi
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +  N/A  .   .  clang
# GNU  F   F   .   .  gcc
# WIN  F   F   .   .  clang/gcc

# Filelist
# --------
# include/xvid.h
# lib/pkgconfig/xvidcore.pc
# lib/libxvidcore.so.4.3
# lib/libxvidcore.a
