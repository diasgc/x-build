cmake_minimum_required(VERSION 3.10)

include(GNUInstallDirs)

file(READ gif_lib.h VERSION_F)
string(REGEX MATCH "GIFLIB_MAJOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "GIFLIB_MINOR[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "GIFLIB_RELEASE[ ]+([0-9]*)" _ ${VERSION_F})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_1})
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

project(giflib 
    LANGUAGES C
    VERSION ${PROJECT_VERSION}
    DESCRIPTION "GIFLIB, a library for manipulating GIF files"
    HOMEPAGE_URL "http://sourceforge.net/projects/giflib"
)

#list(APPEND LIBS_PUBLIC "-lm")


option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_UTILITIES "Build utilities" OFF)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" OFF)

execute_process(COMMAND ./getversion
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(giflib_SRC dgif_lib.c egif_lib.c getarg.c
    gifalloc.c gif_err.c gif_font.c gif_hash.c
    openbsd-reallocarray.c qprintf.c quantize.c
)

set(giflib_INSTALLABLE gif2rgb gifbuild gifecho
    giffilter giffix gifinto giftext giftool
    gifsponge gifclrmp
)

set(giflib_UTILS ${giflib_INSTALLABLE}
    gifbg gifcolor gifhisto gifwedge
)

set(giflib_DOCS NEWS TODO
    getversion ChangeLog history.adoc
    control doc/*.xml doc/*.txt
    doc/index.html.in doc/00README
)

file(GLOB giflib_MAN doc/*.1)

add_library(giflib_obj OBJECT ${giflib_SRC} )

macro(add_lib sfx lnk)
    add_library(giflib${sfx} ${lnk} $<TARGET_OBJECTS:giflib_obj>)
    set_target_properties(giflib${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME giflib
        LINK_FLAGS_RELEASE -s
    )
    if(WIN32)
      set_target_properties(giflib PROPERTIES SUFFIX "-${PROJECT_VERSION_MAJOR}${CMAKE_SHARED_LIBRARY_SUFFIX}")
    endif(WIN32)
    target_link_libraries(giflib${sfx} m)
    install(TARGETS giflib${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

if(BUILD_UTILITIES)
  foreach(UTILITY ${giflib_UTILS})
    add_executable(${UTILITY} ${UTILITY}.c)
    target_link_libraries(${UTILITY} giflib)
    install(TARGETS ${UTILITY} DESTINATION bin)
  endforeach()
endif()

set(PKGCONFIG_FILE ${PROJECT_NAME}.pc)
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

install(FILES gif_lib.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(FILES COPYING DESTINATION ${CMAKE_INSTALL_PREFIX}/share/doc/giflib)

if(INSTALL_MAN)
  install(FILES ${giflib_MAN} DESTINATION ${CMAKE_INSTALL_PREFIX}/man/man1)
endif()

if(INSTALL_DOCS)
  install(FILES ${giflib_DOCS} DESTINATION ${CMAKE_INSTALL_PREFIX}/share/doc/giflib)
endif()
