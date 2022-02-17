#!/bin/bash

lib='jsoncpp'
dsc='A C++ library for interacting with JSON.'
lic='MIT'
src='https://github.com/open-source-parsers/jsoncpp.git'
cfg='cmake'
eta='60'

lst_inc='json/*.h'
lst_lib='libjsoncpp'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='jsoncpp.pc'

. xbuilder.sh

# -DBUILD_OBJECT_LIBS -DBUILD_SHARED_LIBS -DBUILD_STATIC_LIBS -DBUILD_TESTING -DJSONCPP_WITH_EXAMPLE

cmake_config="-DBUILD_TESTING=OFF -DJSONCPP_WITH_TESTS=OFF"
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='JSONCPP_WITH_EXAMPLE'

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/json/assertions.h
# include/json/allocator.h
# include/json/value.h
# include/json/json_features.h
# include/json/config.h
# include/json/writer.h
# include/json/reader.h
# include/json/json.h
# include/json/version.h
# include/json/forwards.h
# lib/pkgconfig/jsoncpp.pc
# lib/objects-Release/jsoncpp_object/json_reader.cpp.o
# lib/objects-Release/jsoncpp_object/json_writer.cpp.o
# lib/objects-Release/jsoncpp_object/json_value.cpp.o
# lib/cmake/jsoncpp/jsoncpp-targets.cmake
# lib/cmake/jsoncpp/jsoncpp-namespaced-targets.cmake
# lib/cmake/jsoncpp/jsoncppConfigVersion.cmake
# lib/cmake/jsoncpp/jsoncpp-targets-release.cmake
# lib/cmake/jsoncpp/jsoncppConfig.cmake
# lib/libjsoncpp.so
# lib/libjsoncpp.a
# share/doc/jsoncpp/LICENSE
# share/doc/jsoncpp/AUTHORS
