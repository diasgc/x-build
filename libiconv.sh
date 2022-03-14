#!/bin/bash

lib='libiconv'
dsc='Character set conversion library'
lic='LGPL2.1'
#vrs='1.16' src="https://ftp.gnu.org/gnu/libiconv/libiconv-${vrs}.tar.gz"
#vrs='v1.16' 
src='https://git.savannah.gnu.org/git/libiconv.git'
#cfg_cmd='./autogen.sh --skip-gnulib'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'

eta='90'
#mki='install'
#pc_llib="-liconv"
#pc_url="https://www.gnu.org/software/libiconv"

#ac_config=" --enable-extra-encodings"
#ac_reconf=false

lst_inc='iconv.h libcharset.h localcharset.h'
lst_lib='libiconv libcharset'
lst_bin='iconv'
lst_lic='COPYING COPYING.LIB AUTHORS'
lst_pc='libiconv.pc'

dev_vrs='1.16'

. xbuild

_before_make(){
	#no docs
	sed -i '/cd man && $(MAKE)/d' $dir_src/Makefile
}

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ CLANG
# GNU  +   +   +   +  GCC
# WIN +++ +++  +   +  CLANG/GCC

# Filelist
# --------
# include/iconv.h
# include/libcharset.h
# include/localcharset.h
# lib/libcharset.so
# lib/pkgconfig/libiconv.pc
# lib/libiconv.so
# lib/libcharset.a
# lib/libcharset.la
# lib/libiconv.a
# lib/libiconv.la
# share/doc/libiconv/COPYING.LIB
# share/doc/libiconv/AUTHORS
# share/doc/libiconv/COPYING
# bin/iconv

<<'CMakeLists.txt'
cmake_minimum_required(VERSION 3.16)
project(libiconv)

option(ENABLE_EXTRA "Enable a few rarely used encodings" ON)
option(ENABLE_RELOCATABLE "if the package shall run at any location in the filesystem" ON)
option(INSTALL_MANPAGES "Install Man Pages" OFF)

include(CheckCCompilerFlag)
include(CheckIncludeFile)
include(CheckTypeSize)
include(TestBigEndian)

function(checkInclude incname name)
    check_include_file("${incname}" ${name})
    if(${name})
        add_definitions(-D${name}=1)
    endif()
endfunction()

function(checkInclude01 incname name)
    check_include_file("${incname}" ${name})
    if(${name})
        add_definitions(-D${name}=1)
    else()
        add_definitions(-D${name}=0)
    endif()
endfunction()

if(TRUE)
    if(NOT EXISTS config.h)
        file(WRITE config.h "")
    endif()

    # ENABLE_EXTRA : Define to 1 to enable a few rarely used encodings.
    if(ENABLE_EXTRA)
        add_definitions(-DENABLE_EXTRA=1)
    endif()

    # ENABLE_RELOCATABLE : Define to 1 if the package shall run at any location in the filesystem.
    if(ENABLE_RELOCATABLE)
        add_definitions(-DENABLE_RELOCATABLE=1)
    endif()

    # mbstate_t : Define to a type if <wchar.h> does not define.
    check_include_file("wchar.h" mbstate_t)
    if(mbstate_t)
        set(BROKEN_WCHAR_H 0)
        add_definitions(-Dmbstate_t=1 -DBROKEN_WCHAR_H=0)
    else()
        set(BROKEN_WCHAR_H 1)
        add_definitions(-DBROKEN_WCHAR_H=1)
    endif()

    # HAVE_ICONV : Define if you have <iconv.h>, the iconv_t type, and the iconv_open, iconv, iconv_close functions.
    check_include_file("iconv.h" HAVE_ICONV)
    if(HAVE_ICONV)
        check_symbol_exists(iconv "iconv.h" HAVE_ICONV)
        check_symbol_exists(iconv_open "iconv.h" HAVE_ICONV)
        check_symbol_exists(iconv_close "iconv.h" HAVE_ICONV)
        if(HAVE_ICONV)
            add_definitions(-DHAVE_ICONV=1)
        endif()
    endif()

    # ICONV_CONST : Define as const if the declaration of iconv() needs const. (empty by default)
  
    # HAVE_GETC_UNLOCKED : Define to 1 if you have the getc_unlocked() function
    check_function_exists("getc_unlocked" HAVE_GETC_UNLOCKED)
    if(HAVE_GETC_UNLOCKED)
        add_definitions(-DHAVE_GETC_UNLOCKED=1)
    endif()

    # HAVE_LANGINFO_CODESET : Define if you have <langinfo.h> and nl_langinfo(CODESET)
    check_include_file("langinfo.h" HAVE_LANGINFO_CODESET)
    if(HAVE_LANGINFO_CODESET)
        check_symbol_exists(nl_langinfo "langinfo.h" HAVE_LANGINFO_CODESET)
        if(HAVE_LANGINFO_CODESET)
            add_definitions(-DHAVE_LANGINFO_CODESET)
        endif()
    endif()
  
    # HAVE_MBRTOWC : Define if you have the mbrtowc() function
    check_function_exists("mbrtowc" HAVE_MBRTOWC)
    if(HAVE_MBRTOWC)
        add_definitions(-DHAVE_MBRTOWC)
    endif()

    # HAVE_SETLOCALE : Define to 1 if you have the setlocale() function
    check_function_exists("setlocale" HAVE_SETLOCALE)
    if(HAVE_SETLOCALE)
        add_definitions(-DHAVE_SETLOCALE=1)
    endif()
   
    # HAVE_STDDEF_H : Define to 1 if you have the <stddef.h> header file
    checkInclude("stddef.h" HAVE_STDDEF_H)

    # HAVE_STDLIB_H : Define to 1 if you have the <stdlib.h> header file
    checkInclude("stdlib.h" HAVE_STDLIB_H)

    # HAVE_STRING_H : Define to 1 if you have the <string.h> header file
    checkInclude("string.h" HAVE_STRING_H)

    # HAVE_VISIBILITY : Define to 1 or 0, depending whether the compiler supports simple visibility declarations
    check_c_compiler_flag("-fvisibility=hidden" HAVE_VISIBILITY)
    if(HAVE_VISIBILITY)
        add_definitions(-DHAVE_VISIBILITY=1)
        set(HAVE_VISIBILITY 1)
    else()
        add_definitions(-DHAVE_VISIBILITY=0)
        set(HAVE_VISIBILITY 0)
    endif()

    # HAVE_WCRTOMB : Define if you have the wcrtomb() function
    check_function_exists("wcrtomb" HAVE_WCRTOMB)
    if(HAVE_WCRTOMB)
        add_definitions(-DHAVE_WCRTOMB -DUSE_MBSTATE_T=1)
        set(USE_MBSTATE_T 1)
    endif()

    # HAVE_WORKING_O_NOFOLLOW : Define to 1 if O_NOFOLLOW works

    # WORDS_LITTLEENDIAN : Define if the machine's byte ordering is little endian
    test_big_endian(IS_BIG_ENDIAN)
    if(NOT IS_BIG_ENDIAN)
        add_definitions(-DWORDS_LITTLEENDIAN)
        set(WORDS_LITTLEENDIAN TRUE)
    endif()

    # INSTALLPREFIX : Define to the value of ${prefix}, as a string
    add_definitions(-DINSTALLPREFIX=${CMAKE_INSTALL_PREFIX})
    
    # Define to '__inline__' or '__inline' if that's what the C compiler calls it, or to nothing if 'inline' is not supported under any name.
    #ifndef __cplusplus
    #undef inline
    #endif
    
    foreach(test "inline" "__inline__" "__inline")
        if(NOT DEFINED C_INLINE)
            try_compile(C_HAS_${test} ${CMAKE_BINARY_DIR} COMPILE_DEFINITIONS "-Dinline=${test}")
            if(C_HAS_${test})
                set(C_INLINE TRUE)
                add_definitions("-Dinline=${test}")
            endif()
        endif()
    endforeach()
    if(NOT DEFINED C_INLINE)
        add_definitions("-Dinline=")
    endif()
    
    # mode_t : Define to 'int' if <sys/types.h> does not define
    check_symbol_exists(mode_t "sys/types.h" mode_t)
    if(NOT mode_t)
        add_definitions(-Dmode_t=int)
    endif
  
    # ssize_t : Define as a signed type of the same size as size_t
    check_type_size("int" INTSZ)
    check_type_size("ssize_t" SSIZET)
    if(${INTSZ} EQUAL ${SSIZET})
        add_definitions(-Dssize_t=int)
    endif()

    if(MINGW OR WIN32)
        set(DLL_VARIABLE "__declspec (dllimport)")
    else()
        set(DLL_VARIABLE "")
    endif()

else()
    if(NOT EXISTS ${CMAKE_SOURCE_DIR}/config.h)
        if(NOT EXISTS config.h.cmake)
            file(READ lib/config.h.in cfg_out)
            string(REPLACE "#undef " "#cmakedefine01 " cfg_new ${cfg_out})
            file(WRITE config.h.cmake ${cfg_new})
        endif()

    include(CheckIncludeFile)
    include(CheckFunctionExists)
    include(CheckSymbolExists)

    check_include_file("wchar.h" mbstate_t)
    if(mbstate_t)
        set(BROKEN_WCHAR_H 0)
    else()
        set(BROKEN_WCHAR_H 1)
    endif()
    if(MINGW OR WIN32)
        set(DLL_VARIABLE "__declspec (dllimport)")
    else()
        set(DLL_VARIABLE "")
    endif()
    check_include_file("iconv.h" HAVE_ICONV)
    if(HAVE_ICONV)
        check_symbol_exists(iconv "iconv.h" HAVE_ICONV)
        check_symbol_exists(iconv_open "iconv.h" HAVE_ICONV)
        check_symbol_exists(iconv_close "iconv.h" HAVE_ICONV)
    endif()
    check_include_file("langinfo.h" HAVE_LANGINFO_CODESET)
    if(HAVE_LANGINFO_CODESET)
        check_symbol_exists(nl_langinfo "langinfo.h" HAVE_LANGINFO_CODESET)
    endif()
    check_function_exists("getc_unlocked" HAVE_GETC_UNLOCKED)
    check_function_exists("mbrtowc" HAVE_MBRTOWC)
    check_function_exists("mbrsetlocaletowc" HAVE_SETLOCALE)
    check_function_exists("wcrtomb" HAVE_WCRTOMB)
    if(HAVE_WCRTOMB)
        set(USE_MBSTATE_T 1)
    endif()
    check_include_file("stddef.h" HAVE_STDDEF_H)
    check_include_file("stdlib.h" HAVE_STDLIB_H)
    check_include_file("string.h" HAVE_STRING_H)
    check_symbol_exists(mode_t "sys/types.h" mode_t)
    include(CheckTypeSize)
    check_type_size("size_t" SIZET)
    check_type_size("ssize_t" SSIZET)
    if(${SIZET} EQUAL ${SSIZET})
        set(ssize_t 1)
    endif()
    include (TestBigEndian)
    TEST_BIG_ENDIAN(IS_BIG_ENDIAN)
    if(IS_BIG_ENDIAN)
        set(WORDS_LITTLEENDIAN FALSE)
    else()
        set(WORDS_LITTLEENDIAN TRUE)
    endif()
    configure_file(config.h.cmake ${CMAKE_SOURCE_DIR}/config.h)
    execute_process(
        COMMAND "sed -i 's/^#define.*0$/\/\*&\*\//;' ${CMAKE_SOURCE_DIR}/config.h"
        OUTPUT_VARIABLE FOO
    )
endif()

include_directories(
    ${CMAKE_SOURCE_DIR} 
    ${CMAKE_SOURCE_DIR}/libcharset/include 
    ${CMAKE_SOURCE_DIR}/include 
    ${CMAKE_SOURCE_DIR}/lib
)

configure_file(
    libcharset/include/export.h 
    ${CMAKE_SOURCE_DIR}/libcharset/include/export.h 
    @ONLY
)
configure_file(
    libcharset/include/libcharset.h.in 
    ${CMAKE_SOURCE_DIR}/libcharset/include/libcharset.h
)
configure_file(
    libcharset/include/localcharset.h.in 
    ${CMAKE_SOURCE_DIR}/libcharset/include/localcharset.h
)
configure_file(
    include/export.h 
    ${CMAKE_SOURCE_DIR}/include/export.h 
    @ONLY
)
configure_file(include/iconv.h.in 
    ${CMAKE_SOURCE_DIR}/include/iconv.h 
    @ONLY
)

set(src_libcharset 
    libcharset/include/export.h 
    libcharset/lib/localcharset.c
    libcharset/lib/relocatable-stub.c
)

set(src_libiconv
     lib/genaliases.c 
    lib/genaliaes2.c 
    lib/genflags.c 
    lib/gentranslit.c 
    lib/iconv.c 
    lib/relocatable.c
)

function(add_libcharset sfx lnk)
    add_library(charset${sfx} ${lnk} ${src_libcharset})
    set_target_properties(charset${sfx} 
        PROPERTIES 
        OUTPUT_NAME charset
    )
    install(TARGETS charset${sfx}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
    )
endfunction()

function(add_libiconv sfx lnk)
    add_library(iconv${sfx} ${lnk} ${src_libiconv})
    set_target_properties(iconv${sfx} PROPERTIES OUTPUT_NAME iconv)
        install(TARGETS iconv${sfx}
            RUNTIME DESTINATION bin
            LIBRARY DESTINATION lib
            ARCHIVE DESTINATION lib)
endfunction()

add_definitions(-DBUILDING_LIBCHARSET=1)
add_libcharset("" "")
add_libiconv("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_libcharset("-static" STATIC)
    add_libiconv("-static" STATIC)
endif()

if(INSTALL_MANPAGES)
    install(
        FILES man/iconv.1 
        DESTINATION ${CMAKE_INSTALL_MANDIR}/man1
    )
    install(
        DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/man
        DESTINATION ${CMAKE_INSTALL_MANDIR}/man3
        FILES_MATCHING PATTERN "*.3"
    )
endif()
CMakeLists.txt