cmake_minimum_required(VERSION 3.10)

include(GNUInstallDirs)
include(CheckCSourceRuns)
include(FindPkgConfig)

project(quirc
    LANGUAGES C
    VERSION "1.0"
    DESCRIPTION "QR decoder library"
    HOMEPAGE_URL "https://github.com/dlbeer/quirc"
)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_EXAMPLES "Build examples" OFF)
option(BUILD_TESTS "Build tests" OFF)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" ON)

set(CMAKE_C_FLAGS_RELEASE "-Ofast -flto -g -DNDEBUG")
if(UNIX)
  set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fPIC -fPIE")
endif()

include_directories(${CMAKE_SOURCE_DIR}/lib)

add_library(quirc_obj OBJECT
    lib/decode.c lib/identify.c
    lib/quirc.c  lib/quirc.h
    lib/version_db.c 
    lib/quirc_internal.h
)

macro(add_lib sfx lnk)
    add_library(quirc${sfx} ${lnk} $<TARGET_OBJECTS:quirc_obj>)
    set_target_properties(quirc${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME quirc
    )
    target_link_libraries(quirc m)
    install(TARGETS quirc${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

if(NOT EXISTS quirc.pc.in)
    file(WRITE quirc.pc.in
        "prefix=@CMAKE_INSTALL_PREFIX@\n"
        "exec_prefix=${prefix}\n"
        "libdir=${exec_prefix}/lib\n"
        "includedir=${prefix}/include\n"
        "\n"
        "Name: @PROJECT_NAME@\n"
        "Description: @CMAKE_PROJECT_DESCRIPTION@\n"
        "URL: @CMAKE_PROJECT_HOMEPAGE_URL@\n"
        "Version: @PROJECT_VERSION@\n"
        "Requires: @REQ_PUBLIC@\n"
        "Requires.private: @REQ_PRIVATE@\n"
        "Libs: -L${libdir} @LIBS_PUBLIC@\n"
        "Libs.private: @LIBS_PRIVATE@\n"
        "Cflags: -I${includedir}\n"
    )
endif()

configure_file(quirc.pc.in ${CMAKE_BINARY_DIR}/quirc.pc)
install(FILES ${CMAKE_BINARY_DIR}/quirc.pc 
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)

install(FILES lib/quirc.h 
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(FILES LICENSE 
    DESTINATION ${CMAKE_INSTALL_DOCDIR}/quirc
)

if(INSTALL_DOCS)
  install(FILES README.md DESTINATION ${CMAKE_INSTALL_DOCDIR}/quirc)
endif()