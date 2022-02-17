#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='exiv2'
dsc='Image metadata library and tools'
lic='Other'
src='https://github.com/Exiv2/exiv2.git'
cfg='cmake'
dep='libiconv expat libpng'
eta='60'
# Options
xmp="OFF"
png="OFF"
mingw_posix=true

extraOpts(){
	if [ "$1" == "--min" ];then
		png="ON"
		xmp="ON"
		dep="libiconv"
	fi
}

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''
. xbuilder.sh

$host_mingw && CFG+=" -DCMAKE_TOOLCHAIN_FILE=${dir_src}/cmake/toolschains/ubuntu1804-mingw64.cmake -DEXIV2_ENABLE_WIN_UNICODE=ON"
! $build_shared && CFG+=" -DEXIV2_ENABLE_DYNAMIC_RUNTIME=OFF" || CFG+=" -DEXIV2_ENABLE_DYNAMIC_RUNTIME=ON"

CFG+=" -DINSTALL_EXAMPLES=OFF \
	-DEXIV2_BUILD_DOC=OFF \
	-DEXIV2_BUILD_SAMPLES=OFF \
	-DBUILD_TESTING=OFF \
	-DEXIV2_TEAM_PACKAGING=ON \
	-DEXIV2_ENABLE_PNG=$png \
	-DEXIV2_ENABLE_XMP=$xmp"

source_patch(){
	# update mingw toolchain to <xv_x64_mingw> in .config
	sed -i "s|7.3|${xv_x64_mingw}|g" ${dir_src}/cmake/toolschains/ubuntu1804-mingw64.cmake
	# hack for cross compile with mingw on ubuntu
	sed -i "s|AND NOT APPLE|AND NOT MINGW|" ${dir_src}/cmake/compilerFlags.cmake
}

start

# Filelist
# --------
# releasenotes.txt
# include/exiv2/xmpsidecar.hpp
# include/exiv2/psdimage.hpp
# include/exiv2/bmffimage.hpp
# include/exiv2/epsimage.hpp
# include/exiv2/jpgimage.hpp
# include/exiv2/value.hpp
# include/exiv2/pngimage.hpp
# include/exiv2/rafimage.hpp
# include/exiv2/pgfimage.hpp
# include/exiv2/mrwimage.hpp
# include/exiv2/iptc.hpp
# include/exiv2/tags.hpp
# include/exiv2/ini.hpp
# include/exiv2/config.h
# include/exiv2/image.hpp
# include/exiv2/datasets.hpp
# include/exiv2/cr2image.hpp
# include/exiv2/webpimage.hpp
# include/exiv2/exif.hpp
# include/exiv2/futils.hpp
# include/exiv2/preview.hpp
# include/exiv2/error.hpp
# include/exiv2/easyaccess.hpp
# include/exiv2/exv_conf.h
# include/exiv2/exiv2lib_export.h
# include/exiv2/http.hpp
# include/exiv2/orfimage.hpp
# include/exiv2/basicio.hpp
# include/exiv2/crwimage.hpp
# include/exiv2/tiffimage.hpp
# include/exiv2/gifimage.hpp
# include/exiv2/rw2image.hpp
# include/exiv2/bmpimage.hpp
# include/exiv2/convert.hpp
# include/exiv2/tgaimage.hpp
# include/exiv2/jp2image.hpp
# include/exiv2/slice.hpp
# include/exiv2/metadatum.hpp
# include/exiv2/exiv2.hpp
# include/exiv2/xmp_exiv2.hpp
# include/exiv2/types.hpp
# include/exiv2/version.hpp
# include/exiv2/properties.hpp
# ReadMe.txt
# README.md
# lib/pkgconfig/exiv2.pc
# lib/cmake/exiv2/exiv2ConfigVersion.cmake
# lib/cmake/exiv2/exiv2Config.cmake
# lib/cmake/exiv2/exiv2Config-release.cmake
# lib/libexiv2.so
# lib/libexiv2-xmp.a
# README-CONAN.md
# share/man/man1/exiv2.1
# README-SAMPLES.md
# samples/exifprint.cpp
# bin/exiv2
# COPYING
# exiv2.png