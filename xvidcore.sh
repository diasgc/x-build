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
cmake_cmakelists='xvidcore.cmake'
pc_url=$url
#pc_llib='-lxvidcore'

lst_inc='xvid.h'
lst_lib='libxvidcore.*'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='libxvidcore.pc'

. xbuild

source_get(){
    pushd $dir_sources
	svn checkout http://svn.xvid.org/trunk --username anonymous .
	#wget -qO- $src 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz >/dev/null 2>&1 || err
	popd
}

if [ "x${cfg}" == "xac" ]; then
	dir_config="${dir_src}/build/generic"
	dir_build="${dir_src}/build/generic"
	$host_ndk && $host_x86 && CFG+=" --disable-assembly"
	$host_clang && static_ldflag="-static";
	unset CSH # unsupported static/shared tags
else
	cmake_config="-DXVID_PKGCONFIG_IN=${dir_root}/cmake/pkg-config.pc.in"
fi

#WFLAGS="-Wno-unused-but-set-variable -Wno-shift-negative-value -Wno-misleading-indentation -Wno-unused-command-line-argument"

_before_make(){
	rm $dir_install/lib/libxvidcore.so*
	sed -i 's/-O2 -fstrength-reduce/-Ofast -flto/g' ${dir_config}/platform.inc
}


start

# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  +   +   +   +   .   .   .   .   .   .   .  static
#  +   +   +   +   .   .   .   .   .   .   .  shared

# Filelist
# --------
# include/xvid.h
# lib/pkgconfig/xvidcore.pc
# lib/libxvidcore.so.4.3
# lib/libxvidcore.a
