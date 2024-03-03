cmake_minimum_required(VERSION 3.11)

include(GNUInstallDirs)
include(FindPkgConfig)

file(READ FreeImage.rc VERSION_F)
string(REGEX MATCH "FILEVERSION[ ]+([0-9]*),([0-9]*),([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_2})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_3})
set(VERLIBNAME "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(FreeImage 
    LANGUAGES C CXX
    VERSION ${VERLIBNAME}
    DESCRIPTION "Open Source library to support popular graphics image formats like PNG, BMP, JPEG, TIFF"
    HOMEPAGE_URL "https://freeimage.sourceforge.io"
)

file(GLOB LibFreeImage_SRC Source/FreeImage/*.c Source/FreeImage/*.cpp)
file(GLOB Metadata_SRC Source/Metadata/*.cpp)
list(APPEND global_src ${LibFreeImage_SRC} ${Metadata_SRC})
include_directories(Source Source/FreeImage Source/Metadata)

pkg_check_modules(PKG_JPEG libjpeg)
if(PKG_JPEG_FOUND)
    option(FREEIMAGE_JPEG_EXT "Use external Jpeg lib" ON)
endif()
if(NOT FREEIMAGE_JPEG_EXT)
    include_directories(Source/LibJPEG)
    file(GLOB LibJPEG Source/LibJPEG/*.c)
    add_library(libjpeg STATIC ${LibJPEG})
    set_target_properties(libjpeg PROPERTIES OUTPUT_NAME libjpeg)
endif()
list(APPEND FreeImageLinks libjpeg)

pkg_check_modules(PKG_PNG libpng)
if(PKG_PNG_FOUND)
    option(FREEIMAGE_PNG_EXT "Use external png lib" ON)
endif()
if(NOT FREEIMAGE_PNG_EXT)
    include_directories(Source/LibPNG)
    file(GLOB LibPNG Source/LibPNG/*.c)
    add_library(libpng STATIC ${LibJPEG})
    set_target_properties(libpng PROPERTIES OUTPUT_NAME libpng)
endif()
list(APPEND FreeImageLinks libpng)

pkg_check_modules(PKG_PNG libpng)
if(PKG_PNG_FOUND)
    option(FREEIMAGE_PNG_EXT "Use external png lib" ON)
endif()
if(NOT FREEIMAGE_PNG_EXT)
    include_directories(Source/LibPNG)
    file(GLOB LibPNG Source/LibPNG/*.c)
    add_library(libpng STATIC ${LibJPEG})
    set_target_properties(libpng PROPERTIES OUTPUT_NAME libpng)
endif()
list(APPEND FreeImageLinks libpng)

pkg_check_modules(PKG_TIFF libtiff-4)
if(PKG_TIFF4_FOUND)
    option(FREEIMAGE_TIFF4_EXT "Use external tiff lib" ON)
endif()
if(NOT FREEIMAGE_TIFF4_EXT)
    file(GLOB LibTIFF4 Source/LibTIFF4/*.c Source/LibTIFF4/*.h)
    add_library(libjpeg STATIC ${LibJPEG})
    set_target_properties(libjpeg PROPERTIES OUTPUT_NAME libtiff)
endif()
list(APPEND FreeImageLinks libtiff)

pkg_check_modules(PKG_ZLIB zlib)
if(PKG_ZLIB)
    option(FREEIMAGE_ZLIB_EXT "Use external zlib" ON)
endif()
if(NOT FREEIMAGE_ZLIB_EXT)
    include_directories(Source/ZLib)
    file(GLOB ZLib Source/ZLib/*.c)
    add_library(zlib STATIC ${LibJPEG})
    set_target_properties(zlib PROPERTIES OUTPUT_NAME zlib)
endif()
list(APPEND FreeImageLinks zlib)

pkg_check_modules(PKG_OPENJPEG libopenjp2)
if(PKG_OPENJPEG)
    option(FREEIMAGE_OPENJPEG_EXT "Use external openjpeg" ON)
endif()
if(NOT FREEIMAGE_OPENJPEG_EXT)
    include_directories(Source/LibOpenJPEG)
    file(GLOB LibOpenJPEG Source/LibOpenJPEG/*.c)
    add_library(openjp2 STATIC ${LibJPEG})
    set_target_properties(zlib PROPERTIES OUTPUT_NAME openjp2)
endif()
list(APPEND FreeImageLinks openjp2)

pkg_check_modules(PKG_OPENEXR OpenEXR)
if(PKG_OPENEXR)
    option(FREEIMAGE_OPENEXR_EXT "Use external openexr" ON)
endif()
if(NOT FREEIMAGE_OPENEXR_EXT)
    include_directories(Source/OpenEXR)
    file(GLOB OpenEXR Source/OpenEXR/IlmImf/*.cpp)
    add_library(OpenEXR-3_1 STATIC ${LibJPEG})
    set_target_properties(zlib PROPERTIES OUTPUT_NAME OpenEXR-3_1)
endif()
list(APPEND FreeImageLinks OpenEXR-3_1)

message(FATA_ERROR "So far, so good")





set (ALL_SRC ${SRCS} ${HDRS})
add_definitions(-Wno-switch -Wno-deprecated-register -Wno-unused-value -Wno-format -Wno-format-extra-args)
if(UNIX)
	add_definitions(-O3 -fPIC -fexceptions -fvisibility=hidden -D__ANSI__)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -DOPJ_STATIC -DNO_LCMS -DDISABLE_PERF_MEASUREMENT")
	set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -lstdc++ -lm")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
	# todo mingw32
	add_definitions(-O3 -fexceptions -DNDEBUG)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_PERF_MEASUREMENT -D__ANSI__ -DOPJ_STATIC")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -Wno-ctor-dtor-privacy")
	set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -s -shared -static -lws2_32")
endif()

if(CMAKE_SYSTEM_PROCESSOR MATCHES "^a")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DPNG_ARM_NEON_OPT=OFF")
endif()

add_library(freeimage ${ALL_SRC})
set(TARGETS freeimage)

if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_library(freeimage_static STATIC ${ALL_SRC})
    set_target_properties(freeimage_static PROPERTIES OUTPUT_NAME freeimage)
    set(TARGETS freeimage freeimage_static)
endif()

install(TARGETS ${TARGETS}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib${LIB_SUFFIX}
  ARCHIVE DESTINATION lib${LIB_SUFFIX}
)

install(FILES Source/FreeImage.h DESTINATION include)
install(FILES Wrapper/FreeImagePlus/FreeImagePlus.h DESTINATION include)
install(FILES license-fi.txt license-gplv2.txt license-gplv3.txt DESTINATION share/docs/FreeImage)
