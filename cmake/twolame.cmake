cmake_minimum_required(VERSION 3.5)

project(twolame 
    LANGUAGES C
    VERSION "0.4.0"
    DESCRIPTION "An optimized MPEG Audio Layer 2 encoder"
    HOMEPAGE_URL "http://www.twolame.org/"
)

set(PKG_PRIVATE_LIBS "-lm")
set(PKG_LIBNAME twolame)
set(PKG_PRIVATE_CFLAGS "-DLIBTWOLAME_STATIC")
set(PKG_CONFIG_PC "${CMAKE_BINARY_DIR}/${PKG_LIBNAME}.pc")

include(GNUInstallDirs)
include(CheckTypeSize)
include(CheckIncludeFile)
include(FindPkgConfig)

macro(check_library have_h libname)
    find_library(libx ${libname})
    if(libx_FOUND)
        set(${have_h} 1)
        message(STATUS "Library ${libname} found")
    else()
        message(STATUS "Library ${libname} not found")
    endif()
endmacro()

function(write_config_h line)
    file(APPEND ${CONFIG_H} ${line}"\n")
endfunction(write_config_h line)

function(config_h_check_include include have_h)
    check_include_file(${include} out)
    file(APPEND ${CONFIG_H} "#define ${have_h} ${out}\n")
    #file(APPEND ${CONFIG_H} "#define ${have_h} ${${have_h}}\n")
endfunction()

function(config_h_check_library lib have_lib)
    find_library(llib ${lib})
    if(llib_FOUND)
        file(APPEND ${CONFIG_H} "#define ${have_lib} 1")
        message("library ${lib} FOUND")
    else()
        file(APPEND ${CONFIG_H} "#define ${have_lib} 0")
        message("library ${lib} NOT FOUND")
    endif()
endfunction()

add_definitions(-Wno-deprecated-non-prototype)

macro(add_lib sfx lnk)
    add_library(twolame${sfx} ${lnk} $<TARGET_OBJECTS:libtwolame_obj>)
    set_host_properties(twolame${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME twolame
        LINK_FLAGS_RELEASE -s
    )
    target_link_libraries(twolame${sfx} ${LIBS})
    install(TARGETS twolame${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

macro(build_executable app src)
    add_executable(${app} ${src})
    target_link_libraries(${app} twolame ${LIBS})
    target_compile_options(${app} PUBLIC ${WFLAGS})
    set_host_properties(${app} PROPERTIES OUTPUT_NAME ${app}) #LINK_FLAGS_RELEASE -s
    install(TARGETS ${app} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
endmacro(build_executable app)




set(CONFIG_H libtwolame/config.h)
file(WRITE ${CONFIG_H} "/* AUTO GENERATED */\n\n")


config_h_check_include(stdio.h HAVE_STDIO_H)
config_h_check_include(stdlib.h HAVE_STDLIB_H)
config_h_check_include(string.h HAVE_STRING_H)
config_h_check_include(inttypes.h HAVE_INTTYPES_H)
config_h_check_include(stdint.h HAVE_STDINT_H)
config_h_check_include(strings.h HAVE_STRINGS_H)
config_h_check_include(sys/stat.h HAVE_SYSSTAT_H)
config_h_check_include(sys/types.h HAVE_SYSTYPES_H)
config_h_check_include(unistd.h HAVE_UNISTD_H)
config_h_check_include(malloc.h HAVE_MALLOC_H)
config_h_check_include(dlfcn.h HAVE_DLFCN_H)
config_h_check_include(assert.h HAVE_ASSERT_H)

config_h_check_library(m HAVE_LIBM)
config_h_check_library(mx HAVE_LIBMX)
check_type_size(float SIZEOF_FLOAT)
check_type_size(short SIZEOF_SHORT)

file(APPEND ${CONFIG_H}   "#define LT_OBJDIR \".libs/\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE \"${PROJECT_NAME}\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE_BUGREPORT \"twolame-discuss@lists.sourceforge.net\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE_NAME \"TwoLAME\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE_STRING \"TwoLAME ${PROJECT_VERSION}\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE_TARNAME \"twolame\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE_URL \"${HOMEPAGE_URL}\"\n")
file(APPEND ${CONFIG_H}   "#define PACKAGE_VERSION \"${PROJECT_VERSION}\"\n")
file(APPEND ${CONFIG_H}   "#define SIZEOF_FLOAT ${SIZEOF_FLOAT}\n")
file(APPEND ${CONFIG_H}   "#define SIZEOF_SHORT ${SIZEOF_SHORT}\n")
file(APPEND ${CONFIG_H}   "#define STDC_HEADERS 1\n")
file(APPEND ${CONFIG_H}   "#define VERSION \"${PROJECT_VERSION}\"\n\n")

if(BUILD_EXECUTABLES)
    pkg_check_modules(SNDFILE sndfile)
    if(SNDFILE_FOUND)
        message(STATUS "sndfile FOUND: needed to build executables")
    else()
        message(STATUS "sndfile NOT FOUND: you wont be able to build executables")
    endif()
endif(BUILD_EXECUTABLES)

set(twolame_LIC COPYING)
file(GLOB twolame_DOC doc/*.txt)
#file(GLOB twolame_H lib/*.h lib/entropy/*.h lib/xxhash/*.h)
file(GLOB twolame_C libtwolame/*.c  libtwolame/*.h ${CMAKE_BINARY_DIR}/config.h)
file(GLOB frontend_src frontend/*.c frontend/*.h)
file(GLOB simplefrontend_src simplefrontend/*.c simplefrontend/*.h)

include_directories(${CMAKE_BUILD_DIR} libtwolame frontend)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" OFF)
option(BUILD_EXECUTABLES "Build executables" ON)
option(INSTALL_DOCS      "Install Manpages"  ON)
set(WFLAGS "" CACHE STRING "Target compile warning flags" )

message(STATUS "${PROJECT_NAME} version ${PROJECT_VERSION}
    Build static libs ${BUILD_STATIC_LIBS}
    Build shared libs ${BUILD_SHARED_LIBS}
    Build executables ${BUILD_EXECUTABLES}
    Install manuals   ${INSTALL_DOCS}"
)

# Libraries
add_library(libtwolame_obj OBJECT ${twolame_C} ${twolame_H} )

if(NOT WFLAGS STREQUAL "")
    target_compile_options(${libtwolame_obj} PUBLIC ${WFLAGS})
endif()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

# Executables
if(BUILD_EXECUTABLES AND SNDFILE_FOUND)
    set(LIBS "${LIBS} sndfile")
    build_executable(frontend ${frontend_src})
    build_executable(simplefrontend ${simplefrontend_src})
endif()

# PkgConfig file
macro(write_pkgconfig)
    file(WRITE ${PKG_CONFIG_PC}
        "prefix=${CMAKE_INSTALL_PREFIX}\n"
        "exec_prefix=\${PREFIX}\n"
        "libdir=\${prefix}/lib\n"
        "includedir=\${prefix}/include\n\n"
        "Name: ${PROJECT_NAME}\n"
        "Description: ${PROJECT_DESCRIPTION}\n\n"
        "Requires:\n"
        "Version: ${PROJECT_VERSION}\n"
        "Libs: -L\${libdir} -l${PKG_LIBNAME}\n"
        "Libs.Private: ${PKG_PRIVATE_LIBS}\n"
        "Cflags: -I\${includedir}\n"
        "Cflags.private: ${PKG_PRIVATE_CFLAGS}"
    )
endmacro()

write_pkgconfig()


install(FILES ${PKG_CONFIG_PC}
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)

# Headers
install(FILES libtwolame/twolame.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# Licence, Docs and Manuals
install(FILES ${twolame_LIC} DESTINATION ${CMAKE_INSTALL_DOCDIR})
if(INSTALL_DOCS)
    if(NOT twolame_DOC STREQUAL "")
        install(FILES ${twolame_DOC} DESTINATION ${CMAKE_INSTALL_DOCDIR})
    endif()
    if(NOT ${twolame_MAN} STREQUAL "")
        install(FILES ${twolame_MAN} DESTINATION ${CMAKE_INSTALL_MANDIR})
    endif()
endif()