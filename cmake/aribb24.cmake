cmake_minimum_required(VERSION 3.5)

project(aribb24 
    LANGUAGES C 
    VERSION 1.0.3
    DESCRIPTION "A library for ARIB STD-B24, decoding JIS 8 bit characters and parsing MPEG-TS stream."
    HOMEPAGE_URL "https://www.arib.or.jp/"
)

set(${PROJECT_NAME}_lic COPYING)
set(${PROJECT_NAME}_doc README.md)
set(${PROJECT_NAME}_hdrs
    src/aribb24/decoder.h
    src/aribb24/parser.h 
    src/aribb24/bits.h 
    src/aribb24/aribb24.h
)
set(${PROJECT_NAME}_src
    src/aribb24.c
    src/aribb24_private.h
    src/decoder.c 
    src/decoder_private.h 
    src/parser.c 
    src/parser_private.h 
    src/md5.c 
    src/md5.h 
    src/drcs.c 
    src/drcs.h 
    src/convtable.h 
    src/decoder_macro.h
)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" ON)
option(BUILD_EXECUTABLES "Build executables" ON)
option(INSTALL_DOCS      "Install Manpages"  ON)

include(GNUInstallDirs)
message(STATUS "${PROJECT_NAME} version ${PROJECT_VERSION}
    Build static libs ${BUILD_STATIC_LIBS}
    Build shared libs ${BUILD_SHARED_LIBS}
    Build executables ${BUILD_EXECUTABLES}
    Install manuals   ${INSTALL_DOCS}"
)

add_definitions(-fvisibility=hidden)
set(CMAKE_C_FLAGS_RELEASE "-Ofast -flto")

set(libs m)
#include(FindPNG)
find_library(PNG libpng16.a)
if(PNG_FOUND)
    list(APPEND libs ${PNG_LIBRARY})
    add_definitions(-DHAVE_PNG=1)
    include_directories(${PNG_INCLUDE_DIR})
endif()

# Libraries
add_library(${PROJECT_NAME}_obj OBJECT ${${PROJECT_NAME}_src})
if(NOT WFLAGS STREQUAL "")
    target_compile_options(${PROJECT_NAME}_obj PUBLIC ${WFLAGS})
endif()

macro(add_lib sfx lnk)
    add_library(${PROJECT_NAME}${sfx} ${lnk} $<TARGET_OBJECTS:${PROJECT_NAME}_obj>)
    set_target_properties(${PROJECT_NAME}${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME ${PROJECT_NAME}
    )
    target_link_libraries(${PROJECT_NAME}${sfx} ${libs})
    install(TARGETS ${PROJECT_NAME}${sfx}
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
    message(STATUS "No executables to build")
endif()

# PkgConfig file
set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix "\${prefix}")
set(libdir "\${prefix}/lib")
set(includedir  "\${prefix}/include")
set(datarootdir "\${prefix}/share")
set(datadir "\${prefix}/share")
set(pkgincludedir "\${includedir}/@PROJECT_NAME@")
set(pkgdatadir "\${datadir}/@PROJECT_NAME@")
set(pkglibdir "\${libdir}/@PROJECT_NAME@")
set(pluginsdir "\${pkglibdir}/plugins")
set(VERSION "${PROJECT_VERSION}")
set(PKG_REQUIRES "libpng")
configure_file(src/${PROJECT_NAME}.pc.in ${PROJECT_NAME}.pc @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)

# Headers
install(FILES ${${PROJECT_NAME}_hdrs} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})

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
