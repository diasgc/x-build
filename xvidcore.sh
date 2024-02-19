#!/bin/bash

lib='xvidcore'
dsc='Xvid decoder/encoder library'
lic='GPL'
url='https://labs.xvid.com/source/'
#src='https://github.com/Distrotech/xvidcore.git'
vrs="1.3.7"
src="https://downloads.xvid.com/downloads/xvidcore-${vrs}.tar.gz"
cfg='ac'
eta='20'

pc_url=$url
pc_llib='-lxvidcore'

lst_inc='xvid.h'
lst_lib='libxvidcore.*'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='xvidcore.pc'

. xbuild

source_get(){
    pushd $dir_sources
	wget -qO- $src 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz >/dev/null 2>&1 || err
	popd
}

dir_config="${dir_src}/build/generic"
dir_build="${dir_src}/build/generic"

unset CSH # unsupported static/shared tags

$host_ndk && $host_x86 && CFG+=" --disable-assembly"
$host_clang && static_ldflag="-static";
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
