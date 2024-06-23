cmake_minimum_required(VERSION 3.5)

set(VERSION 3.10.22)
project(arj VERSION ${VERSION} LANGUAGES C CXX)

add_definitions(-Wno-dev -DLOCALE=LANG_en -DLOCALE_DESC=en -DPKGLIBDIR=lib/arj)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(COMMERCIAL "Commercial use" OFF)
option(LIBC "link dynamically to libc" OFF)
option(NP_SFX "Force disable packing of SFX modules" OFF)

if(UNIX)
    add_definitions(-D_UNIX -DELF_EXECUTABLES=1 -DREGISTER=arj-register)
    set(DYN_LIBS -ldl)
endif()
if(NP_SFX)
    add_definitions(-DNP_SFX=1)
endif()
if(LIBC)
    add_definitions(-DLIBC=1)
endif()
if(CMAKE_SYSTEM_PROCESSOR MATCHES ^arm OR CMAKE_SYSTEM_PROCESSOR MATCHES ^aarch)
    add_definitions(-DALIGN_POINTERS)
endif()

include(CheckCSourceRuns)
include(CheckIncludeFile)
include(CheckFunctionExists)

check_c_source_runs("
#include <fnmatch.h>
int main(){
    return(fnmatch("@<:@", "@<:@", 0)); /* Must return 0 for a valid match */
}
" TOLERANT_FNMATCH)

function(check_include_file_def inc out)
    check_include_file(${inc} ${out})
    if(${out})
        add_definitions(-D${out})
    endif()
endfunction()
function(check_function_exists_def fn out)
    check_function_exists(${fn} ${out})
    if(${out})
        add_definitions(-D${out})
    endif()
endfunction()

check_include_file_def("stdint.h" HAVE_STDINT_H)
check_function_exists_def("mkdtemp" HAVE_MKDTEMP)
check_function_exists_def("fcloseall" HAVE_FCLOSEALL)
check_function_exists_def("setpriority" HAVE_SETPRIORITY)
check_function_exists_def("strcasecmp" HAVE_STRCASECMP)
check_function_exists_def("strupr" HAVE_STRUPR)
check_function_exists_def("strlwr" HAVE_STRLWR)
#undef USE_COLORS
if(WIN32)
    add_definitions(-DWORDS_BIGENDIAN)
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

#
# ARJCRYPT utility
#
add_library(arjcrypt_o OBJECT integr.c gost.c gost_t.c nmsg_crp.c arjcrypt.c gnu/arjcrypt.def)
function(add_lib name sfx lnk)
    add_library(${name}${sfx} ${lnk})
    set_target_properties(${name}${sfx} PROPERTIES
        OUTPUT_NAME ${name}
        VERSION ${VERSION}
    )
    target_link_libraries(${name}${sfx} ${name}_o)
endfunction()

#
# SFX stub
#
add_executable(sfxstub nmsg_stb.c sfxstub.c)

#
# ARJSFXV module
#
add_library(arjsfxv_o OBJECT
    sfx_id.c
    filemode.c 
    date_sig.c 
    fmsg_sfv.c 
    imsg_sfv.c 
    nmsg_sfv.c 
    decode.c 
    arjsfx.c 
    fardata.c 
    arj_user.c 
    arj_arcv.c 
    arj_file.c 
    crc32.c 
    misc.c 
    debug.c 
    arj_proc.c 
    environ.c 
    ea_mgr.c 
    ntstream.c 
    uxspec.c 
    ext_hdr.c 
    arjtypes.c 
    exe_sear.c 
    chk_fmsg.c 
    filelist.c 
    arjsec_h.c 
    arjsec_l.c 
    garble.c 
    scrnio.c 
    ansi.c 
    externs.c
)

add_lib(arjcrypt "" "")
add_lib(arjsfxv "" "")

if (BUILD_STATIC_LIBS AND BUILD_SHARED_LIBS)
    add_lib(arjcrypt -static STATIC)
    add_lib(arjsfxv -static STATIC)
endif()