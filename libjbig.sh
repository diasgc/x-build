#!/bin/bash
#             a8  a7  x86 x64
# ndk-clang   +++ +++ +++ +++
# linux-gnu   +++ +++ ... ...
# mingw-llvm  +++ +++ ... +++

lib='libjbig'
dsc='JBIG1 data compression standard (ITU-T T.82) lossless image compression'
lic='GPL'
vrs='2.1'
#src='https://www.cl.cam.ac.uk/~mgk25/git/cdjbigkit' sty='git'
src="https://www.cl.cam.ac.uk/~mgk25/jbigkit/download/jbigkit-${vrs}.tar.gz" sty='tgz'
cfg='cmake'
eta='17'

pc_llib='-ljbig -ljbig85'

lst_inc='jbig_ar.h jbig85.h jbig.h'
lst_lib='libjbig85 libjbig'
lst_bin='pbmtojbg85 pbmtojbg jbgtopbm85 jbgtopbm'

cbk="BUILD_EXECUTABLES"

. xbuilder.sh

start

<<'XB_CREATE_CMAKELISTS'
cmake_minimum_required(VERSION 3.6)
project(jbigkit)

option(BUILD_STATIC_LIBS "Also build static libs" ON)
option(BUILD_EXECUTABLES "Build executables" ON)
option(INSTALL_MAN "Install man pages" OFF)

set(JBIG_SRC libjbig/jbig.c libjbig/jbig_ar.c)
set(JBIG85_SRC libjbig/jbig85.c libjbig/jbig_ar.c libjbig/jbig_ar.h)

set(JBIG_TARGETS "")

if(BUILD_SHARED_LIBS)
    add_library(libjbig SHARED ${JBIG_SRC})
    set_target_properties(libjbig PROPERTIES PUBLIC_HEADER "libjbig/jbig_ar.h;libjbig/jbig.h")
    add_library(libjbig85 SHARED ${JBIG85_SRC})
    set_target_properties(libjbig85 PROPERTIES PUBLIC_HEADER "libjbig/jbig_ar.h;libjbig/jbig85.h")
    list(APPEND JBIG_TARGETS libjbig libjbig85)
endif()

if(BUILD_STATIC_LIBS)
    add_library(libjbig_static STATIC ${JBIG_SRC})
    set_target_properties(libjbig_static PROPERTIES PUBLIC_HEADER "libjbig/jbig_ar.h;libjbig/jbig.h")
    set_target_properties(libjbig_static PROPERTIES OUTPUT_NAME libjbig)
    add_library(libjbig85_static STATIC ${JBIG85_SRC})
    set_target_properties(libjbig85_static PROPERTIES PUBLIC_HEADER "libjbig/jbig_ar.h;libjbig/jbig85.h")
    set_target_properties(libjbig85_static PROPERTIES OUTPUT_NAME libjbig85)
    list(APPEND JBIG_TARGETS libjbig_static libjbig85_static)
endif()

if(BUILD_EXECUTABLES)
    add_executable(pbmtojbg pbmtools/pbmtojbg.c)
    add_executable(pbmtojbg85 pbmtools/pbmtojbg85.c)
    add_executable(jbgtopbm pbmtools/pbmtojbg.c)
    add_executable(jbgtopbm85 pbmtools/pbmtojbg85.c)

    target_include_directories(pbmtojbg PRIVATE libjbig)
    target_include_directories(pbmtojbg85 PRIVATE libjbig)
    target_include_directories(jbgtopbm PRIVATE libjbig)
    target_include_directories(jbgtopbm85 PRIVATE libjbig)

    target_link_libraries(pbmtojbg libjbig_static)
    target_link_libraries(pbmtojbg85 libjbig85_static)
    target_link_libraries(jbgtopbm libjbig_static)
    target_link_libraries(jbgtopbm85 libjbig85_static)
    
    list(APPEND JBIG_TARGETS pbmtojbg pbmtojbg85 jbgtopbm jbgtopbm85)
endif()

if(JBIG_TARGETS)
    install(TARGETS ${JBIG_TARGETS}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )
endif()

if(INSTALL_MAN)
	install(FILES pbmtools/jbgtopbm.1 pbmtools/pbmtojbg.1 DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man1)
	install(FILES pbmtools/pbm.5 pbmtools/pgm.5 DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man5)
endif()
install(FILES COPYING INSTALL TODO DESTINATION ${CMAKE_INSTALL_PREFIX}/share/docs/libjbig)
XB_CREATE_CMAKELISTS

# Filelist
# --------
# include/jbig_ar.h
# include/jbig85.h
# include/jbig.h
# lib/libjbig85.so
# lib/libjbig.a
# lib/libjbig.so
# lib/libjbig85.a
# lib/libjbig85.la
# lib/libjbig.la
# share/man/man1/jbgtopbm.1
# share/man/man1/pbmtojbg.1
# share/man/man5/pgm.5
# share/man/man5/pbm.5
# bin/pbmtojbg85
# bin/pbmtojbg
# bin/jbgtopbm85
# bin/jbgtopbm
