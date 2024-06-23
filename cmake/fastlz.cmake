cmake_minimum_required(VERSION 3.10)

include(GNUInstallDirs)

file(READ fastlz.h VERSION_F)
string(REGEX MATCH "FASTLZ_VERSION_MAJOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "FASTLZ_VERSION_MINOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "FASTLZ_VERSION_REVISION[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_1})
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(fastlz 
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "Small & portable byte-aligned LZ77 compression"
    HOMEPAGE_URL "https://github.com/ariya/FastLZ.git"
)

set(PKGCONFIG_FILE ${PROJECT_NAME}.pc)
option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_EXAMPLES "Build examples" ON)
option(BUILD_TESTS "Build tests" OFF)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" ON)
set(PKGCONFIG_TEMPLATE "${CMAKE_SOURCE_DIR}/../../cmake/pkg-config.pc.in"
    CACHE STRING "Pkg-config template file path"
)

set(CMAKE_CXX_FLAGS_RELEASE "-Oz -flto")
if(UNIX)
  set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fPIC -fPIE")
endif()

include_directories(${CMAKE_SOURCE_DIR})

add_library(fastlz_obj OBJECT fastlz.c fastlz.h )

macro(add_lib sfx lnk)
    add_library(fastlz${sfx} ${lnk} $<TARGET_OBJECTS:fastlz_obj>)
    set_host_properties(fastlz${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME fastlz
        LINK_FLAGS_RELEASE -s
    )
    install(TARGETS fastlz${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
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

if(NOT EXISTS ${PKGCONFIG_FILE}.in)
    file(WRITE ${PKGCONFIG_FILE}.in
        "prefix=@CMAKE_INSTALL_PREFIX@\n"
        "exec_prefix=${prefix}\n"
        "libdir=${exec_prefix}/lib\n"
        "includedir=${prefix}/include\n"
        "\n"
        "Name: @PROJECT_NAME@\n"
        "Description: @CMAKE_PROJECT_DESCRIPTION@\n"
        "URL: @CMAKE_PROJECT_HOMEPAGE_URL@\n"
        "Version: @PROJECT_VERSION@\n"
        "Libs: -L${libdir} -l@PROJECT_NAME@\n"
        "Cflags: -I${includedir}\n"
    )
endif()

configure_file(${CMAKE_SOURCE_DIR}/${PKGCONFIG_FILE}.in ${PKGCONFIG_FILE} @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/${PKGCONFIG_FILE} DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)


if(BUILD_EXAMPLES)
  install(TARGETS 6pack 6unpack RUNTIME DESTINATION bin)
endif()

if(INSTALL_DOCS)
  install(FILES LICENSE.MIT README.md DESTINATION share/docs/fastlz)
endif()