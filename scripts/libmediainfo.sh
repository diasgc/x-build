#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   PP. ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='libmediainfo'
apt="${lib}-dev"
dsc='Convenient unified display of the most relevant technical and tag data for video and audio files.'
lic='BSD-2c'
src='https://github.com/MediaArea/MediaInfoLib.git'
cfg='cmake'
eta='10'
config_dir='Project/CMake'
lst_inc='MediaInfo/MediaInfoList.h
	MediaInfo/MediaInfo_Events.h
	MediaInfo/MediaInfo.h
	MediaInfo/MediaInfo_Const.h
	MediaInfoDLL/MediaInfoDLL_Static.h
	MediaInfoDLL/MediaInfoDLL.h'
lst_lib='libmediainfo'
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# include/MediaInfo/MediaInfoList.h
# include/MediaInfo/MediaInfo_Events.h
# include/MediaInfo/MediaInfo.h
# include/MediaInfo/MediaInfo_Const.h
# include/MediaInfoDLL/MediaInfoDLL_Static.h
# include/MediaInfoDLL/MediaInfoDLL.h
# lib/pkgconfig/libmediainfo.pc
# lib/cmake/mediainfolib/MediaInfoLibConfigVersion.cmake
# lib/cmake/mediainfolib/MediaInfoLibConfig.cmake
# lib/cmake/mediainfolib/MediaInfoLibTargets.cmake
# lib/cmake/mediainfolib/MediaInfoLibTargets-release.cmake
# lib/libmediainfo.so
