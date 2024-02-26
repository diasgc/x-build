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
