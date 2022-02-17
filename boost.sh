#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   V   F   F   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

# WARNING: repo size 1.5GB 45min @3mbps

lib='boost'
dsc='Super-project for modularized Boost'
lic='BSD-1c'
vrs='1.78.0'
src="https://boostorg.jfrog.io/artifactory/main/release/$BOOST_VER1.$BOOST_VER2.$BOOST_VER3/source/boost_${BOOST_VER1}_${BOOST_VER2}_${BOOST_VER3}.tar.bz2"
src="https://boostorg.jfrog.io/artifactory/main/release/${vrs}/source/boost_1_78_0.tar.bz2"
#src="https://github.com/boostorg/boost/archive/refs/tags/boost-${vrs}.tar.gz"
#src='https://github.com/boostorg/boost.git'
#src_opt='--recursive'
#vrs='boost-1.78.0'
cfg='other'
eta='1095'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''
dir_build='build'

# see https://github.com/moritz-wundke/Boost-for-Android for android
. xbuilder.sh

source_config(){
	# git checkout master # or whatever branch you want to use
    ./bootstrap.sh
    ./b2 headers
}

build_config(){
	echo "using clang : $arch : $CXX : <linkflags>-L${dir_install_lib} ; " >>${dir_src}/project-config.jam
    CXXFLAGS+=" -std=c++14 -stdlib=libc++"
    local toolset="$(os_fromid clang gnu clang)-$(arch_fromid aarch64 arm i686 x86_64)"
    local b_arch=$(arch_fromid arm arm x86 x86)
    local b_abi=$(arch_fromid aapcs aapcs sysv sysv)
    local b_bits=$(arch_fromid 64 32 32 64)
    cd $dir_src
    ./b2 target-os=android -j${HOST_NPROC} \
		include=${dir_install_include} \
		toolset="clang-$arch" \
		--prefix="${dir_install_lib}"  \
		-q \
		--without-stacktrace \
		--disable-icu \
		-sNO_ZSTD=1 \
		cxxflags="$CXXFLAGS" \
		linkflags="$LDFLAGS" \
		architecture="$b_arch" \
		abi="$b_abi" \
		address-model="$b_bits" \
		boost.locale.icu=off \
		binary-format=elf \
		threading=multi \
		install
}

start