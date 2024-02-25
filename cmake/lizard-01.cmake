cmake_minimum_required(VERSION 3.5)

project(lizard 
    LANGUAGES C
    VERSION 2.0.0
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
    set(GNU_COMPATIBLE_COMPILER 1)
endif()

pkg_check_modules(ZSTD libzstd)
if(ZSTD_FOUND)
    list(APPEND lizard_LIBS ${ZSTD__LIBRARIES})
    link_directories(${ZSTD_LIBRARY_DIRS})
endif()

set(lizard_LIC LICENCE)
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
    add_library(liblizard${sfx} ${lnk} $<TARGET_OBJECTS:liblizard_obj>)
    set_target_properties(liblizard${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME liblizard
    )
    install(TARGETS liblizard${sfx}
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
    add_executable(lizard ${lizard_CLI} ${lizard_H})
    target_link_libraries(lizard liblizard ${lizard_LIBS})
    install(TARGETS lizard RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
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
install(FILES ${${PROJECT_NAME}_lic} DESTINATION ${CMAKE_INSTALL_DOCDIR})
if(INSTALL_DOCS)
    if(NOT ${PROJECT_NAME}_doc STREQUAL "")
        install(FILES ${${PROJECT_NAME}_doc} DESTINATION ${CMAKE_INSTALL_DOCDIR})
    endif()
    if(NOT ${PROJECT_NAME}_man STREQUAL "")
        install(FILES ${${PROJECT_NAME}_man} DESTINATION ${CMAKE_INSTALL_MANDIR})
    endif()
endif()