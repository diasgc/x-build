#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='rapidjson'
dsc='A fast JSON parser/generator for C++ with both SAX/DOM style API'
lic='GLP-2.0'
src='https://github.com/Tencent/rapidjson.git'
url='http://rapidjson.org/'
cfg='cmake'
eta='0'
pkg='RapidJSON'

cmake_config='-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF'
lst_inc='rapidjson/*.h rapidjson/internal/*.h'
lst_lib=''
lst_bin=''
lst_lic='licence.txt'
lst_pc='RapidJSON.pc'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs='1.1.0'

. xbuilder.sh

start

# Filelist
# --------
# include/rapidjson/istreamwrapper.h
# include/rapidjson/memorybuffer.h
# include/rapidjson/encodings.h
# include/rapidjson/internal/pow10.h
# include/rapidjson/internal/strtod.h
# include/rapidjson/internal/diyfp.h
# include/rapidjson/internal/dtoa.h
# include/rapidjson/internal/clzll.h
# include/rapidjson/internal/biginteger.h
# include/rapidjson/internal/swap.h
# include/rapidjson/internal/itoa.h
# include/rapidjson/internal/meta.h
# include/rapidjson/internal/strfunc.h
# include/rapidjson/internal/stack.h
# include/rapidjson/internal/ieee754.h
# include/rapidjson/internal/regex.h
# include/rapidjson/stringbuffer.h
# include/rapidjson/allocators.h
# include/rapidjson/filereadstream.h
# include/rapidjson/fwd.h
# include/rapidjson/writer.h
# include/rapidjson/reader.h
# include/rapidjson/memorystream.h
# include/rapidjson/encodedstream.h
# include/rapidjson/filewritestream.h
# include/rapidjson/schema.h
# include/rapidjson/prettywriter.h
# include/rapidjson/rapidjson.h
# include/rapidjson/stream.h
# include/rapidjson/document.h
# include/rapidjson/ostreamwrapper.h
# include/rapidjson/error/error.h
# include/rapidjson/error/en.h
# include/rapidjson/uri.h
# include/rapidjson/msinttypes/stdint.h
# include/rapidjson/msinttypes/inttypes.h
# include/rapidjson/cursorstreamwrapper.h
# include/rapidjson/pointer.h
# lib/pkgconfig/RapidJSON.pc
# lib/cmake/RapidJSON/RapidJSONConfigVersion.cmake
# lib/cmake/RapidJSON/RapidJSONConfig.cmake
# share/doc/RapidJSON/examples/filterkey/filterkey.cpp
# share/doc/RapidJSON/examples/serialize/serialize.cpp
# share/doc/RapidJSON/examples/sortkeys/sortkeys.cpp
# share/doc/RapidJSON/examples/condense/condense.cpp
# share/doc/RapidJSON/examples/simplepullreader/simplepullreader.cpp
# share/doc/RapidJSON/examples/traverseaspointer.cpp
# share/doc/RapidJSON/examples/filterkeydom/filterkeydom.cpp
# share/doc/RapidJSON/examples/CMakeLists.txt
# share/doc/RapidJSON/examples/simpledom/simpledom.cpp
# share/doc/RapidJSON/examples/messagereader/messagereader.cpp
# share/doc/RapidJSON/examples/schemavalidator/schemavalidator.cpp
# share/doc/RapidJSON/examples/simplereader/simplereader.cpp
# share/doc/RapidJSON/examples/pretty/pretty.cpp
# share/doc/RapidJSON/examples/archiver/archiver.cpp
# share/doc/RapidJSON/examples/archiver/archiver.h
# share/doc/RapidJSON/examples/archiver/archivertest.cpp
# share/doc/RapidJSON/examples/capitalize/capitalize.cpp
# share/doc/RapidJSON/examples/tutorial/tutorial.cpp
# share/doc/RapidJSON/examples/simplewriter/simplewriter.cpp
# share/doc/RapidJSON/examples/prettyauto/prettyauto.cpp
# share/doc/RapidJSON/examples/parsebyparts/parsebyparts.cpp
# share/doc/RapidJSON/examples/jsonx/jsonx.cpp
# share/doc/RapidJSON/examples/lookaheadparser/lookaheadparser.cpp
# share/doc/RapidJSON/readme.md
