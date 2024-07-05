cmake_minimum_required(VERSION 3.10)

include(GNUInstallDirs)
include(CheckIncludeFile)
include(FindPkgConfig)

project(libavc1394 
    LANGUAGES C
    VERSION 0.5.4
    DESCRIPTION "A programming interface to the AV/C specification from the 1394 Trade Assocation"
    HOMEPAGE_URL "https://sourceforge.net/projects/libavc1394/"
)

set(PKGCONFIG_FILE ${PROJECT_NAME}.pc)
option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_EXAMPLES "Build examples" ON)
option(BUILD_TESTS "Build tests" OFF)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" ON)

pkg_check_modules(LIBRAW REQUIRED libraw1394)

set(CMAKE_C_FLAGS_RELEASE "-Ofast -flto")
if(UNIX)
  set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fPIC -fPIE")
endif()

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
check_include_file( inttypes.h   HAVE_INTTYPES_H     )
check_include_file( netinet/in.h HAVE_NETINET_IN_H   )
check_include_file( stdint.h     HAVE_STDINT_H       )
check_include_file( stdio.h      HAVE_STDIO_H        )
check_include_file( stdlib.h     HAVE_STDLIB_H       )
check_include_file( strings.h    HAVE_STRINGS_H      )
check_include_file( string.h     HAVE_STRING_H       )
check_include_file( sys/stat.h   HAVE_SYS_STAT_H     )
check_include_file( sys/time.h   HAVE_SYS_TIME_H     )
check_include_file( sys/types.h  HAVE_SYS_TYPES_H    )
check_include_file( sys/unistd.h HAVE_UNISTD_H       )

check_include_file( arpg.h       HAVE_ARPG_H         )

set(LT_OBJDIR ".libs/")
set(STDC_HEADERS 1)
set(VERSION ${PROJECT_VERSION})

configure_file(${CONFIG_H} ${CMAKE_BINARY_DIR}/config.h @ONLY)
include_directories(${CMAKE_BINARY_DIR} ${LIBRAW_INCLUDE_DIRS})

if (CMAKE_C_COMPILER_ID STREQUAL "Clang")
    add_definitions(-Wno-format)
    add_compile_options(-static)
endif()

set(SRC_LIBAVC1394
    libavc1394/avc1394_internal.c
    libavc1394/avc1394_simple.c
    libavc1394/avc1394_vcr.c
    libavc1394/avc1394.h
    libavc1394/avc1394_internal.h
    libavc1394/avc1394_vcr.h)
set(SRC_COMMON
    common/raw1394util.c
    common/raw1394util.h
    )
set(SRC_LIBROM1394
    librom1394/rom1394.h
    librom1394/rom1394_internal.c
    librom1394/rom1394_internal.h
    librom1394/rom1394_main.c)

add_library(avc1394_o OBJECT ${SRC_LIBAVC1394} ${SRC_COMMON})
add_library(avc1394 $<TARGET_OBJECTS:avc1394_o>)
set_target_properties(avc1394 PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
    OUTPUT_NAME avc1394
)
target_link_libraries(avc1394 raw1394)

add_library(rom1394_o OBJECT ${SRC_LIBAVC1394} ${SRC_COMMON})
add_library(rom1394 $<TARGET_OBJECTS:rom1394_o>)
set_target_properties(rom1394 PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
    OUTPUT_NAME rom1394
)
target_link_libraries(rom1394 raw1394)

install(TARGETS avc1394 rom1394
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)


install(FILES libavc1394/avc1394.h librom1394/rom1394.h DESTINATION include)

if(BUILD_EXAMPLES)
    link_directories(${LIBRAW_LIBRARY_DIRS})
    set(SRC_BIN avc_vcr dvcont mkrfc2734 romtest setrom)
    if(HAVE_ARPG_H)
        set(SRC_BIN ${SRC_BIN} panelctl)
    endif()
    foreach(B ${SRC_BIN})
        add_executable(${B} test/${B}.c)
        target_link_libraries(${B} rom1394 avc1394)
    endforeach()
    install(TARGETS ${SRC_BIN} RUNTIME DESTINATION bin)
endif(BUILD_EXAMPLES)

set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix ${CMAKE_INSTALL_PREFIX})
set(libdir "\${prefix}/lib")
set(includedir "\${prefix}/include")

configure_file(${CMAKE_SOURCE_DIR}/${PKGCONFIG_FILE}.in ${PKGCONFIG_FILE} @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/${PKGCONFIG_FILE} DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)

if(INSTALL_DOCS)
  install(FILES AUTHORS COPYING README DESTINATION share/docs/libavc1394)
endif()