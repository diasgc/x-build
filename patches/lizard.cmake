cmake_minimum_required(VERSION 3.5)

file(READ lib/lizard_compress.h VERSION_F)
string(REGEX MATCH "LIZARD_VERSION_MAJOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "LIZARD_VERSION_MINOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "LIZARD_VERSION_RELEASE[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_1})
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(lizard 
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "Lizard compression library"
    HOMEPAGE_URL "https://github.com/inikep/lizard.git"
)

include(GNUInstallDirs)
include(FindPkgConfig)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(HOST_64BIT 1)
else()
    set(HOST_64BIT 0)
endif()

if(CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID STREQUAL "Clang")
    add_definitions(-std=gnu99 -Wall -DLIZARD_VERSION=\"${PROJECT_VERSION}\")
    set(GNU_COMPATIBLE_COMPILER 1)
endif()

pkg_check_modules(ZSTD libzstd)
if(ZSTD_FOUND)
    list(APPEND lizard_LIBS ${ZSTD__LIBRARIES})
    link_directories(${ZSTD_LIBRARY_DIRS})
endif()

set(lizard_LIC lib/LICENSE)
file(GLOB lizard_DOC doc/*.md)
file(GLOB lizard_H lib/*.h lib/entropy/*.h lib/xxhash/*.h)
file(GLOB lizard_C lib/*.c lib/entropy/*.c lib/xxhash/*.c)
file(GLOB lizard_CLI programs/*.c programs/*.h)

include_directories(lib lib/entropy lib/xxhash)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" OFF)
option(BUILD_EXECUTABLES "Build executables" ON)
option(INSTALL_DOCS      "Install Manpages"  ON)
option(LINK_TOOLS_WITH_LIB "Link the command line tools with the (shared) library" OFF)
set(WFLAGS "" CACHE STRING "Target compile warning flags" )

message(STATUS "${PROJECT_NAME} version ${PROJECT_VERSION}
    Build static libs ${BUILD_STATIC_LIBS}
    Build shared libs ${BUILD_SHARED_LIBS}
    Build executables ${BUILD_EXECUTABLES}
    Install manuals   ${INSTALL_DOCS}"
)

# Libraries
add_library(liblizard_obj OBJECT ${lizard_C} ${lizard_H} )

if(NOT WFLAGS STREQUAL "")
    target_compile_options(${liblizard_obj} PUBLIC ${WFLAGS})
endif()

macro(add_lib sfx lnk)
    add_library(lizard${sfx} ${lnk} $<TARGET_OBJECTS:liblizard_obj>)
    set_target_properties(lizard${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME lizard
        LINK_FLAGS_RELEASE -s
    )
    install(TARGETS lizard${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

# Executables
if(BUILD_EXECUTABLES)
    set(lizard_LIC ${lizard_LIC} programs/COPYING)
    add_executable(lizard-app ${lizard_CLI} ${lizard_H})
    target_link_libraries(lizard-app lizard)
    set_target_properties(lizard-app PROPERTIES
        LINK_FLAGS_RELEASE -s
        OUTPUT_NAME lizard
    )
    install(TARGETS lizard-app RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
endif()

# PkgConfig file
set(PREFIX ${CMAKE_INSTALL_PREFIX})
set(LIBDIR "\${prefix}/lib")
set(INCLUDEDIR "\${prefix}/include")
set(VERSION ${PROJECT_VERSION})
configure_file(lib/liblizard.pc.in liblizard.pc @ONLY)

install(FILES ${CMAKE_BINARY_DIR}/liblizard.pc
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)

# Headers
install(FILES lib/lizard_compress.h lib/lizard_common.h lib/lizard_frame.h
    DESTINATION include
)

# Licence, Docs and Manuals
install(FILES ${lizard_LIC} DESTINATION ${CMAKE_INSTALL_DOCDIR})
if(INSTALL_DOCS)
    if(NOT lizard_DOC STREQUAL "")
        install(FILES ${lizard_DOC} DESTINATION ${CMAKE_INSTALL_DOCDIR})
    endif()
    if(NOT ${lizard_MAN} STREQUAL "")
        install(FILES ${lizard_MAN} DESTINATION ${CMAKE_INSTALL_MANDIR})
    endif()
endif()