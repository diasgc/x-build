cmake_minimum_required(VERSION 3.5)

project(dvdcss LANGUAGES C VERSION 1.4.3)

option(DISABLE_PKGCONFIG "Disable PkgConfig module generation" OFF)
option(DISABLE_CMAKE_CONFIG "Disable CMake package config module generation" OFF)
option(BUILD_STATIC_LIBS "Build static libs" ON)

include(GNUInstallDirs)
include(CheckIncludeFile)
include(CheckSymbolExists)

set(DVDCSS_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(DVDCSS_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(DVDCSS_VERSION_MICRO ${PROJECT_VERSION_PATCH})
configure_file(src/dvdcss/version.h.in ${CMAKE_SOURCE_DIR}/src/dvdcss/version.h @ONLY)

check_symbol_exists(DVD_STRUCT   "linux/cdrom.h" DVD_STRUCT_IN_LINUX_CDROM_H)
check_symbol_exists(dvd_struct   "sys/cdio.h" DVD_STRUCT_IN_SYS_CDIO_H)
check_symbol_exists(dvd_struct   "sys/dvdio.h" DVD_STRUCT_IN_SYS_DVDIO_H)
check_include_file("dlfcn.h"     HAVE_DLFCN_H)
check_include_file("dvd.h"       HAVE_DVD_H)
check_include_file("errno.h"     HAVE_ERRNO_H)
check_include_file("fcntl.h"     HAVE_FCNTL_H)
check_include_file("inttypes.h"  HAVE_INTTYPES_H)
check_include_file("io.h"        HAVE_IO_H)
check_include_file("memory.h"    HAVE_MEMORY_H)
check_include_file("pwd.h"       HAVE_PWD_H)
check_include_file("stdint.h"    HAVE_STDINT_H)
check_include_file("stdlib.h"    HAVE_STDLIB_H)
check_include_file("strings.h"   HAVE_STRINGS_H)
check_include_file("string.h"    HAVE_STRING_H)
check_include_file("sys/cdio.h"  HAVE_SYS_CDIO_H)
check_include_file("sys/dvdio.h" HAVE_SYS_DVDIO_H)
check_include_file("sys/ioctl.h" HAVE_SYS_IOCTL_H)
check_include_file("sys/param.h" HAVE_SYS_PARAM_H)
check_include_file("sys/stat.h"  HAVE_SYS_STAT_H)
check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
check_include_file("sys/uio.h"   HAVE_SYS_UIO_H)


check_include_file("linux/cdrom.h"    HAVE_LINUX_CDROM_H)

configure_file(config.h.in config.h @ONLY)
include_directories(${CMAKE_BINARY_DIR})

set(dvdcss_SOURCES
    src/libdvdcss.c
    src/libdvdcss.h
    src/device.c
    src/device.h
    src/css.c
    src/css.h
    src/csstables.h
    src/ioctl.c
    src/ioctl.h
    src/error.c
    src/common.h
)

set(dvdcss_PUBLIC_HEADERS
    src/dvdcss/dvdcss.h
    src/dvdcss/version.h
)

set(dvdcss_DOCS
    AUTHORS
    COPYING
    NEWS
    README.md
    ChangeLog
)

add_library(dvdcss_obj OBJECT ${dvdcss_SOURCES})

macro(add_libdvdcss sfx lnk)
    add_library(dvdcss${sfx} ${lnk} $<TARGET_OBJECTS:dvdcss_obj>)
    set_host_properties(dvdcss${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME dvdcss
    )
    install(TARGETS dvdcss${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_libdvdcss("" "")
if(BUILD_STATIC_LIBS AND BUILD_SHARED_LIBS)
    add_libdvdcss(-static STATIC)
endif()

install(FILES ${dvdcss_PUBLIC_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dvdcss)

set(prefix      ${CMAKE_INSTALL_PREFIX})
set(exec_prefix "\${prefix}")
set(libdir      "\${prefix}/${CMAKE_INSTALL_LIBDIR}")
set(includedir  "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
configure_file(src/libdvdcss.pc.in ${CMAKE_BINARY_DIR}/libdvdcss.pc @ONLY)
