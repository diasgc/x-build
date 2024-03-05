cmake_minimum_required(VERSION 3.10)

include(GNUInstallDirs)
include(FindPkgConfig)
include(CheckIncludeFile)
include(CheckSymbolExists)
include(CheckFunctionExists)

project(dc1394 
    LANGUAGES C
    VERSION "2.2.7"
    DESCRIPTION "1394-based DC Control Library"
    HOMEPAGE_URL "https://damien.douxchamps.net/ieee1394/libdc1394/"
)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_EXAMPLES "Build examples" ON)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" ON)
option(DC1394_WITH_VENDOR "Build libdc1394-vendor lib" ON)

set(CONFIG_H ${CMAKE_BINARY_DIR}/config.h.in)

file(STRINGS config.h.in CONFIG_H_LINES LENGTH_MINIMUM 1)
foreach(LINE IN LISTS CONFIG_H_LINES)
    string(REGEX MATCH "^#undef[ ]+([A-Z_0-9]+)" _ ${LINE})
    if(NOT "${CMAKE_MATCH_1}" STREQUAL "")
        file(APPEND ${CONFIG_H} "#cmakedefine ${CMAKE_MATCH_1} @${CMAKE_MATCH_1}@\n")
    else()
        file(APPEND ${CONFIG_H} "${LINE}\n")
    endif()
endforeach()

# Check includes
check_include_file( dlfcn.h      HAVE_DLFCN_H        )
check_include_file( fcntl.h      HAVE_FCNTL_H        )
check_include_file( memory.h     HAVE_MEMORY_H       )
check_include_file( inttypes.h   HAVE_INTTYPES_H     )
check_include_file( stdint.h     HAVE_STDINT_H       )
check_include_file( stdlib.h     HAVE_STDLIB_H       )
check_include_file( strings.h    HAVE_STRINGS_H      )
check_include_file( string.h     HAVE_STRING_H       )
check_include_file( sys/ioctl.h  HAVE_SYS_IOCTL_H    ) 
check_include_file( sys/mman.h   HAVE_SYS_MMAN_H     )
check_include_file( sys/param.h  HAVE_SYS_PARAM_H    )
check_include_file( sys/stat.h   HAVE_SYS_STAT_H     )
check_include_file( sys/types.h  HAVE_SYS_TYPES_H    )
check_include_file( sys/unistd.h HAVE_UNISTD_H       )
check_include_file( string.h     HAVE_STRING_H       )
check_include_file( string.h     HAVE_STRING_H       )
check_include_file( netinet/in.h HAVE_NETINET_IN_H   )

# Check libs
pkg_check_modules(LIBRAW1394 libraw1394)
set(HAVE_LIBRAW1394 ${LIBRAW1394_FOUND})

pkg_check_modules(LIBRAW1394CAM lib1394camera)
set(HAVE_LIB1394CAMERA ${LIBRAW1394CAM_FOUND})

pkg_check_modules(SDL sdl3)
set(HAVE_LIBSDL ${SDL_FOUND})

pkg_check_modules(LIBUSB libusb-1.0)
set(HAVE_LIBUSB ${LIBUSB_FOUND})

pkg_check_modules(OPENGL OpenGL)
set(HAVE_LIBUSB ${OPENGL_FOUND})

check_symbol_exists(getpagesize unistd.h HAVE_GETPAGESIZE)
check_function_exists(mmap HAVE_MMAP)

find_package(IOKit QUIET)
set(HAVE_FRAMEWORK_IOKIT ${IOKit_FOUND})

set(CMAKE_C_FLAGS_RELEASE "-Ofast -flto")

if(CMAKE_C_COMPILER_ID MATCHES Clang)
    add_definitions(-pedantic -Wno-enum-conversion -Wno-strict-prototypes -Wno-deprecated-non-prototype)
endif()


list(APPEND DC1394_C 
    dc1394/control.c    dc1394/enumeration.c    dc1394/capture.c
    dc1394/format7.c    dc1394/register.c       dc1394/utils.c
    dc1394/internal.c   dc1394/conversions.c    dc1394/bayer.c
    dc1394/log.c        dc1394/iso.c
)

list(APPEND DC1394_PUBLIC_H
    dc1394/dc1394.h   dc1394/types.h   dc1394/camera.h
    dc1394/control.h  dc1394/capture.h dc1394/video.h 
    dc1394/format7.h  dc1394/utils.h   dc1394/conversions.h
    dc1394/register.h dc1394/log.h     dc1394/iso.h
)

include_directories(${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/dc1394 ${CMAKE_BINARY_DIR})

if(UNIX)
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fPIC -fPIE")
    if(APPLE)
        set(HAVE_MACOSX 1)
        list(APPEND DC1394_C macosx.c)
    else(APPLE)
        set(HAVE_LINUX 1)
        option(DC1394_WITH_JUJU "With juju" ON)
        if(LIBRAW1394_FOUND)
            option(DC1394_WITH_LIBRAW1394 "With libraw1394" ON)
        endif()
    endif(APPLE)
elseif(WIN32)
    set(HAVE_WINDOWS 1)
endif()

macro(add_lib sfx lnk)
    add_library(dc1394${sfx} ${lnk} $<TARGET_OBJECTS:dc1394_obj>)
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

configure_file(${CONFIG_H} ${CMAKE_BINARY_DIR}/config.h @ONLY)

add_library(dc1394_obj OBJECT ${DC1394_C} ${DC1394_PUBLIC_H})

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

if(DC1394_WITH_VENDOR)
    file(GLOB dc1394-vendor_C dc1394/vendor/*.c dc1394/vendor/*.h)
    add_definitions(-Wno-enum-compare -Wno-gnu-pointer-arith)
    add_library(dc1394-vendor ${dc1394-vendor_C})
    set_target_properties(dc1394-vendor PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME dc1394-vendor
    )
    target_link_libraries(dc1394-vendor dc1394)
    install(TARGETS dc1394-vendor
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
    list(APPEND DC1394_VENDOR_H
        dc1394/vendor/avt.h dc1394/vendor/pixelink.h
        dc1394/vendor/basler.h dc1394/vendor/basler_sff.h
    )
endif()


if(HAVE_MACOSX)
    file(GLOB dc1394-macosx_C dc1394/macosx/*.c dc1394/macosx/*.h)
    add_library(dc1394-macosx ${dc1394-macosx_C})
    set_target_properties(dc1394-macosx PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME dc1394-macosx
    )
    target_link_libraries(dc1394-macosx dc1394)
    install(TARGETS dc1394-macosx
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endif()

if(HAVE_WINDOWS)
    file(GLOB dc1394-windows_C dc1394/windows/*.c dc1394/windows/*.h)
    add_library(dc1394-windows ${dc1394-windows_C})
    set_target_properties(dc1394-windows PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME dc1394-windows
    )
    install(TARGETS dc1394-windows
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
    # NO PULBIC INCLUDES
endif()

if(HAVE_LINUX)
    if(DC1394_WITH_JUJU)
        file(GLOB dc1394-juju_C dc1394/juju/*.c dc1394/juju/*.h)
        add_library(dc1394-juju ${dc1394-juju_C})
        add_definitions(-std=gnu99 -pedantic-errors -Wno-zero-length-array)
        set_target_properties(dc1394-juju PROPERTIES
            VERSION ${PROJECT_VERSION}
            SOVERSION ${PROJECT_VERSION_MAJOR}
            OUTPUT_NAME dc1394-juju
        )
        target_link_libraries(dc1394-juju dc1394)
        install(TARGETS dc1394-juju
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )
    endif()
    if(DC1394_WITH_LIBRAW1394)
        add_definitions(-Wno-macro-redefined -Wno-format-pedantic)    
        file(GLOB dc1394-linux_SRC dc1394/linux/*.c dc1394/linux/*.h)
        add_library(dc1394-linux ${dc1394-linux_SRC})
        set_target_properties(dc1394-linux PROPERTIES
            VERSION ${PROJECT_VERSION}
            SOVERSION ${PROJECT_VERSION_MAJOR}
            OUTPUT_NAME dc1394-linux
        )
        target_include_directories(dc1394-linux PUBLIC ${LIBRAW1394_INCLUDE_DIRS})
        target_link_libraries(dc1394-linux dc1394 ${LIBRAW1394_LIBRARIES} pthread)
        install(TARGETS dc1394-linux
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        )
        list(APPEND DC1394_LINUX_H
            dc1394/linux/capture.h dc1394/linux/control.h
        )
    endif()
endif()

if(LIBUSB_FOUND)
    file(GLOB dc1394-usb_C dc1394/usb/*.c dc1394/usb/*.h)
    add_library(dc1394-usb ${dc1394-usb_C})
    set_target_properties(dc1394-usb PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME dc1394-usb
    )
    target_include_directories(dc1394-usb PUBLIC ${LIBUSB_INCLUDE_DIRS})
    target_link_libraries(dc1394-usb dc1394 ${LIBUSB_LIBRARIES})
    install(TARGETS dc1394-usb
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
    list(APPEND DC1394_LINUX_H
        dc1394/linux/capture.h dc1394/linux/control.h
    )
endif()

if(BUILD_EXAMPLES)
    #TODO
    message(STATUS "Todo: BUILD_EXAMPLES")
endif()

install(FILES ${DC1394_PUBLIC_H}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/libdc1394
)

set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix ${prefix})
set(libdir ${CMAKE_INSTALL_LIBDIR})
set(includedir ${CMAKE_INSTALL_INCLUDEDIR})
set(VERSION ${PROJECT_VERSION})

configure_file(libdc1394-2.pc.in ${CMAKE_BINARY_DIR}/libdc1394-2.pc @ONLY)

install(FILES ${CMAKE_BINARY_DIR}/libdc1394-2.pc
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)

install(FILES COPYING DESTINATION ${CMAKE_INSTALL_DOCDIR}/libdc1394)

if(INSTALL_DOCS)
  install(FILES AUTHORS NEWS README DESTINATION ${CMAKE_INSTALL_DOCDIR}/libdc1394)
endif()