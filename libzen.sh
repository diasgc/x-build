#!/bin/bash

lib='libzen'
apt="${lib}-dev"
dsc='Zenlib for MediaInfo'
lic='Zlib'
src='https://github.com/MediaArea/ZenLib.git'
cfg='cmake'
eta='27'
config_dir='Project/CMake'

lst_inc='ZenLib/*.h ZenLib/Format/Html/*.h'
lst_lib='libzen'
lst_bin=''
lst_lic='License.txt'
lst_pc='libzen.pc'
dev_vrs='0.4.39'

cmake_static='BUILD_STATIC_LIBS'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ZenLib/BitStream_LE.h
# include/ZenLib/int128u.h
# include/ZenLib/Translation.h
# include/ZenLib/Dir.h
# include/ZenLib/ZtringListList.h
# include/ZenLib/BitStream.h
# include/ZenLib/Trace.h
# include/ZenLib/int128s.h
# include/ZenLib/Format/Html/Html_Handler.h
# include/ZenLib/Format/Html/Html_Request.h
# include/ZenLib/Format/Http/Http_Cookies.h
# include/ZenLib/Format/Http/Http_Request.h
# include/ZenLib/Format/Http/Http_Utils.h
# include/ZenLib/Format/Http/Http_Handler.h
# include/ZenLib/File.h
# include/ZenLib/Ztring.h
# include/ZenLib/CriticalSection.h
# include/ZenLib/ZtringList.h
# include/ZenLib/MemoryDebug.h
# include/ZenLib/Utils.h
# include/ZenLib/OS_Utils.h
# include/ZenLib/InfoMap.h
# include/ZenLib/Conf_Internal.h
# include/ZenLib/ZtringListListF.h
# include/ZenLib/Conf.h
# include/ZenLib/BitStream_Fast.h
# include/ZenLib/Thread.h
# include/ZenLib/FileName.h
# include/ZenLib/PreComp.h
# lib/libzen.so
# lib/pkgconfig/libzen.pc
# lib/cmake/zenlib/ZenLibTargets-release.cmake
# lib/cmake/zenlib/ZenLibConfig.cmake
# lib/cmake/zenlib/ZenLibTargets.cmake
# lib/cmake/zenlib/ZenLibConfigVersion.cmake
# lib/libzen.a
# share/doc/libzen/License.txt

# patch 01 on Project/CMake/CMakeLists.txt to support dual static shared build
# patch 02 on Project/CMake/libzen.pc.in to set paths relative to prefix 
<<'LZS_PATCH'
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
LZS_PATCH