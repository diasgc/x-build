cmake_minimum_required(VERSION 3.10)

include(GNUInstallDirs)
include(FindPkgConfig)

file(READ fastlz.h VERSION_F)
string(REGEX MATCH "FASTLZ_VERSION_MAJOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "FASTLZ_VERSION_MINOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "FASTLZ_VERSION_REVISION[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_1})
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(dc1394 
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "Small & portable byte-aligned LZ77 compression"
    HOMEPAGE_URL "https://github.com/ariya/FastLZ.git"
    LIBS_PUBLIC "-lfastlz"
)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_EXAMPLES "Build examples" ON)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" ON)
set(PKGCONFIG_TEMPLATE "${CMAKE_SOURCE_DIR}/../../cmake/pkg-config.pc.in"
    CACHE STRING "Pkg-config template file path"
)

set(CMAKE_CXX_FLAGS_RELEASE "-Ofast -flto")
if(UNIX)
  set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fPIC -fPIE")
endif()

set(DC1394_DIR ${CMAKE_SOURCE_DIR}/dc1394)
list(APPEND DC1394_C 
    dc1394/control.c
    dc1394/enumeration.c
    dc1394/capture.c
    dc1394/format7.c
    dc1394/register.c
    dc1394/utils.c
    dc1394/internal.c
    dc1394/conversions.c 
    dc1394/bayer.c
    dc1394/log.c
    dc1394/iso.c
)
set(DC1394_H )
include_directories(${DC1394_DIR})

if(UNIX)
    if(APPLE)
        list(APPEND DC1394_C macosx.c)
        file(GLOB dc1394-macosx_C dc1394/macosx/*.c dc1394/macosx/*.h)
        add_library(dc1394-linux ${dc1394-macosx_C})
        set_target_properties(dc1394-linux PROPERTIES
            VERSION ${PROJECT_VERSION}
            SOVERSION ${PROJECT_VERSION_MAJOR}
            OUTPUT_NAME dc1394-linux
        )
        target_link_libraries(dc1394-linux dc1394)
    else()
        pkg_check_modules(PKG_LIBRAW libraw1394)
        if(PKG_LIBRAW_FOUND)
            option(DC1394_USE_LIBRAW1394 "Use libraw1394" ON)
            if(DC1394_USE_LIBRAW1394)
                file(GLOB dc1394-linux_SRC dc1394/linux/*.c dc1394/linux/*.h)
                add_library(dc1394-linux ${dc1394-linux_SRC})
                set_target_properties(dc1394-linux PROPERTIES
                    VERSION ${PROJECT_VERSION}
                    SOVERSION ${PROJECT_VERSION_MAJOR}
                    OUTPUT_NAME dc1394-linux
                )
                target_link_libraries(dc1394-linux dc1394 raw1394)
        endif()
    endif()
else()

endif()


macro(add_lib sfx lnk)
    add_library(dc1394${sfx} ${lnk} $<TARGET_OBJECTS:$dc1394_obj>)
    set_target_properties(dc1394${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME dc1394
    )
    install(TARGETS dc1394${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_library(dc1394_obj OBJECT ${DC1394_C} )
add_lib()
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

install(FILES fastlz.h DESTINATION include)

if(BUILD_EXAMPLES)
    add_executable(6pack examples/6pack.c)
    target_link_libraries(6pack fastlz)
    add_executable(6unpack examples/6unpack.c)
    target_link_libraries(6unpack fastlz)
endif()

if(EXISTS PKGCONFIG_TEMPLATE)
  configure_file(${PKGCONFIG_TEMPLATE} fastlz.pc @ONLY)
  install(FILES ${CMAKE_BINARY_DIR}/fastlz.pc
      DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
  )
endif()

if(BUILD_EXAMPLES)
  install(TARGETS 6pack 6unpack RUNTIME DESTINATION bin)
endif()

if(INSTALL_DOCS)
  install(FILES LICENSE.MIT README.md DESTINATION share/docs/fastlz)
endif()