cmake_minimum_required(VERSION 2.8)

set(PROJECT_NAME xavs2)
set(CMAKE_PROJECT_DESCRIPTION "An open-source encoder of AVS2-P2/IEEE1857.4 video coding standard")
set(CMAKE_PROJECT_HOMEPAGE_URL "http://vcl.idm.pku.edu.cn")
set(LIBS_PUBLIC "-lxavs2")
set(REQ_PRIVATE)
set(REQ_PUBLIC)

project(${PROJECT_NAME} C)

#set(CMAKE_VERBOSE_MAKEFILE ON)

include(CheckCCompilerFlag)
#include(CheckCSourceCompiles)
include(FindPkgConfig)
include(CheckIncludeFile)
include(CheckCSourceRuns)


message("Builing for ${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_PROCESSOR}")

set(CMAKE_INSTALL_LIBDIR lib)
set(CMAKE_INSTALL_INCLUDEDIR include)

macro(patch_file SRC_FILE STR_IN STR_OUT)
  file(READ ${SRC_FILE} FCONTENT)
  string(REPLACE "${STR_IN}" "${STR_OUT}" FCONTENT "${FCONTENT}") 
  file(WRITE ${SRC_FILE} "${FCONTENT}")
endmacro()

# Version
set(VERSION_H ${CMAKE_SOURCE_DIR}/source/version.h)
if(NOT EXISTS ${VERSION_H})
  # Patch threadpool.c  
  patch_file(source/common/threadpool.c
    "SYS_LINUX) && !__MINGW32__"
    "SYS_LINUX) && !(__MINGW32__ || __ANDROID__)"
  )
  # Patch encoder.c
  patch_file(source/encoder/encoder.c
    "xavs2_threadpool_run(h->h_top->threadpool_aec, encoder_aec_encode_one_frame, h, 0);"
    "xavs2_threadpool_run(h->h_top->threadpool_aec, (xavs2_tfunc_t)encoder_aec_encode_one_frame, h, 0);"
  )

  find_package(Git)
  if(Git_FOUND)
    if (EXISTS ${CMAKE_SOURCE_DIR}/.git)
      execute_process(COMMAND ${GIT_EXECUTABLE} rev-list --count origin/master
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
        OUTPUT_VARIABLE VER_BUILD
        OUTPUT_STRIP_TRAILING_WHITESPACE)
        message("VER_BUILD=${VER_BUILD}")
      execute_process(COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} 
        OUTPUT_VARIABLE VER_SHA)
        string(SUBSTRING ${VER_SHA} 0 16 VER_SHA)
        message("VER_SHA=${VER_SHA}")
    endif()
  else()
    set(VER_R=VER_BUILD)
    set(VER_SHA 'not-in-git-tree')
  endif()
  file(READ source/xavs2.h out)
  string(REGEX MATCH "define XAVS2_BUILD[ ]+([0-9]*)" _ ${out})
  set(XAVS2_VERSION ${CMAKE_MATCH_1})
  math(EXPR VER_MAJOR "${XAVS2_VERSION} / 10")
  math(EXPR VER_MINOR "${XAVS2_VERSION} % 10")
  string(TIMESTAMP XBUILD_TIME "%Y-%m-%d %H:%M:%S")
  set(XAVS2_POINTVER "${VER_MAJOR}.${VER_MINOR}.${VER_BUILD}")
  file(WRITE ${VERSION_H} 
      "#ifndef XAVS2_VERSION_H\n"
      "#define XAVS2_VERSION_H\n\n"
      "#define VER_MAJOR ${VER_MAJOR}\n"
      "#define VER_MINOR ${VER_MINOR}\n"
      "#define VER_BUILD ${VER_BUILD}\n"
      "#define VER_SHA_STR \"${VER_SHA}\"\n"
      "#define XVERSION VER_MAJOR, VER_MINOR, VER_BUILD\n"
      #"#define _TOSTR(x) #x\n"
      #"#define TOSTR(x)  _TOSTR(x)\n"
      #"#define XVERSION_STR TOSTR(VER_MAJOR) \".\" TOSTR(VER_MINOR) \".\" TOSTR(VER_BUILD) \" \" VER_SHA_STR\n"
      "#define XVERSION_STR \"${XAVS2_POINTVER} ${VER_SHA}\"\n"
      "#define XBUILD_TIME \"${XBUILD_TIME}\"\n\n"
      "#endif"
  )
  #configure_file("${VERSION_H}.in" ${VERSION_H} @ONLY)
else()
  set(XAVS2_POINTVER "${VER_MAJOR}.${VER_MINOR}.${VER_BUILD}")
  file(READ ${VERSION_H} VERSION_F)
  string(REGEX MATCH "define VER_BUILD[ ]+([0-9]*)" _ ${VERSION_F})
  set(VER_BUILD ${CMAKE_MATCH_1})
  string(REGEX MATCH "define VER_MAJOR[ ]+([0-9]*)" _ ${VERSION_F})
  set(VER_MAJOR ${CMAKE_MATCH_1})
  string(REGEX MATCH "define VER_MINOR[ ]+([0-9]*)" _ ${VERSION_F})
  set(VER_MINOR ${CMAKE_MATCH_1})
endif()

set(XAVS2_POINTVER "${VER_MAJOR}.${VER_MINOR}.${VER_BUILD}")
message("Version ${XAVS2_POINTVER}-${VER_SHA} ${XBUILD_TIME}")

set(PROJECT_VERSION "${XAVS2_POINTVER}")

set(XAVS2_LIB_VERSION ${VER_MAJOR}.${VER_MINOR}.0)
set(XAVS2_SO_VERSION ${VER_MAJOR})

# Options
option(BUILD_STATIC_LIBS "Build the static library" ON)
option(BUILD_SHARED_LIBS "Build the shared library" OFF)
option(BUILD_EXECUTABLE "Build test programs" ON)
option(DISABLE_WARNINGS "Disable warnings at compile time" ON)
option(XAVS2_GPL "GPL" ON)
option(XAVS2_INTERLACED "Interlaced" ON)
set(XAVS2_CHROMA_FORMAT 0 CACHE STRING "Chroma Format")

set(BIT_DEPTH_VALUES 8 10 12)
set(XAVS2_BIT_DEPTH 8 CACHE STRING "Bit Depth")
set_property(CACHE XAVS2_BIT_DEPTH PROPERTY STRINGS ${BIT_DEPTH_VALUES})

option(ENABLE_ASM "Enable ASM" OFF)
set(X264_SOURCE_DIR "" CACHE STRING "Source code for x264 - for asm code" )

# xavs2_config.h
file(WRITE source/xavs2_config.h 
    "#define XAVS2_BIT_DEPTH ${XAVS2_BIT_DEPTH}\n"
    "#define XAVS2_GPL=${XAVS2_GPL}\n"
    "#define XAVS2_INTERLACED=${XAVS2_INTERLACED}\n"
    "#define XAVS2_CHROMA_FORMAT=${XAVS2_CHROMA_FORMAT}\n"
    "#define XAVS2_VERSION=${XAVS2_VERSION}\n"
    "#define XAVS2_POINTVER=${DXAVS2_POINTVER}"
)

list(APPEND XAVS2_HAVELIST HAVE_MALLOC_H ARCH_AARCH64 SYS_LINUX HAVE_THREAD
  STACK_ALIGNMENT HAVE_POSIXTHREAD HAVE_BEOSTHREAD HAVE_WIN32THREAD
  HAVE_MMAP HAVE_VECTOREXT HAVE_GPL HAVE_INTERLACED HAVE_ALTIVEC
  HAVE_ALTIVEC_H HAVE_MMX HAVE_ARMV6 HAVE_ARMV6T2 HAVE_NEON HAVE_LOG2F
  HAVE_CPU_COUNT HAVE_THP HAVE_X86_INLINE_ASM HAVE_AS_FUNC HAVE_MSA HAVE_WINRT
  HAVE_VSX HAVE_INTEL_DISPATCHER HAVE_OPENCL HAVE_LSMASH HAVE_SWSCALE
  HAVE_LAVF HAVE_FFMS HAVE_GPAC HAVE_AVS
)

# Config.h
set(HCONFIG_IN ${CMAKE_SOURCE_DIR}/source/config.h.in)
if (NOT EXISTS ${HCONFIG_IN})
  set(HCONFIG_IN source/config.h.in)
  file(WRITE ${HCONFIG_IN} "/*Config File*/\n\n")
  foreach(xHave ${XAVS2_HAVELIST})
    set(${xHave} 0)
    file(APPEND ${HCONFIG_IN} "#cmakedefine ${xHave} @${xHave}@\n")
  endforeach()
endif()

#message(FATAL_ERROR "Done")

set(SC ${CMAKE_SOURCE_DIR}/source/common)
set(SV ${SC}/vec)
set(SE ${CMAKE_SOURCE_DIR}/source/encoder)

include_directories(source ${SC} ${SE} source/compat ${CMAKE_BINARY_DIR})

# XAVS2 Library
# common sources
file(GLOB SRC_COM source/common/*.c)
file(GLOB SRC_ENC source/encoder/*.c)

set(xavs2_CLI source/test/test.c)

# Threads
find_package(Threads)
if(Threads_FOUND)
  set(HAVE_THREAD 1)
  set(HAVE_POSIXTHREAD ${CMAKE_USE_PTHREADS_INIT})
  set(HAVE_WIN32THREAD ${CMAKE_USE_WIN32_THREADS_INIT})
  if(NOT HAVE_WIN32THREAD)
    list(REMOVE_ITEM SRC_COM ${CMAKE_SOURCE_DIR}/source/common/win32thread.c)
  endif()
else(Threads_FOUND)
  list(REMOVE_ITEM SRC_COM ${CMAKE_SOURCE_DIR}/source/common/threadpool.c ${CMAKE_SOURCE_DIR}/source/common/win32thread.c)
endif(Threads_FOUND)

macro(checkLibrary LPREFIX libname)
  #message("Checking ${libname}")
  pkg_check_modules(${LPREFIX} ${libname})
  if(${LPREFIX}_FOUND)
    #message("${LPREFIX}_FOUND")  
    option(XAVS2_${LPREFIX} "Use ${libname}" OFF)
    if(${XAVS2_${LPREFIX}})
      set(HAVE_${LPREFIX} 1)
      list(APPEND XAVS2_LIBS ${${LPREFIX}_LIBRARIES})
      list(APPEND XAVS2_LPATHS ${${LPREFIX}_LIBRARY_DIRS})
      message("appending ${${LPREFIX}_LIBRARY_DIRS}")
    endif()
  endif()
endmacro(LPREFIX libname)

checkLibrary(LAVS avisynth)
checkLibrary(LAVF libavformat)
checkLibrary(LSWS libswscale)
checkLibrary(OPENCL OpenCL)
checkLibrary(LSMASH liblsmash)

list(REMOVE_DUPLICATES XAVS2_LPATHS)
link_directories(${XAVS2_LPATHS})

list(APPEND XAVS2_LIBS m)

check_c_compiler_flag(-ffast-math CC_HAS_FAST_MATH) 
if (CC_HAS_FAST_MATH)
    add_definitions(-ffast-math)
endif()

if (UNIX)
  set(OBJ_SUFFIX o)
  list(APPEND XAVS2_LIBS pthread)
  find_library(LIBRT rt)
  if(LIBRT)
    list(APPEND XAVS2_LIBS rt)
  endif()
  mark_as_advanced(LIBRT)
  find_library(LIBDL dl)
  if(LIBDL)
      list(APPEND XAVS2_LIBS dl)
  endif()
  if(CMAKE_SYSTEM MATCHES Linux)
    set(SYS_LINUX 1)
    set(HAVE_MALLOC_H 1)
    add_definitions(-D_GNU_SOURCE)
  endif()
elseif(WIN32)
  set(OBJ_SUFFIX obj)  
  # intel dispatcher
  check_include_file("intel_dispatcher.h" HAVE_INTEL_DISPATCHER)
  set(HAVE_INTEL_DISPATCHER ${HAVE_INTEL_DISPATCHER})
endif()

# 64 or 32 bit
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(STACK_ALIGNMENT 16)
else()
  set(STACK_ALIGNMENT 4)
endif()

if (CMAKE_SYSTEM_PROCESSOR MATCHES aarch64)
  set(ARCH_ASM ${CMAKE_SYSTEM_PROCESSOR})
  set(HAVE_VECTOREXT 1)
  set(ARCH_AARCH64 1)
  set(HAVE_NEON 1)
  #set(ASM_FLAGS -DSTACK_ALIGNMENT=${STACK_ALIGNMENT})
  add_definitions(-fPIC -fomit-frame-pointer -flto -fno-tree-vectorize -fvisibility=hidden -DARCH_ARM=1)
elseif (CMAKE_SYSTEM_PROCESSOR MATCHES arm)
  set(ARCH_ASM ${CMAKE_SYSTEM_PROCESSOR})
  set(ASM_S S)
  set(HAVE_NEON 1)
  add_definitions(-fomit-frame-pointer -fno-tree-vectorize -DARCH_ARM=1)
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES x86_64)
  option(ENABLE_AVX "Enable MMX/AVX optimizations (asm)" OFF)
  set(ARCH_ASM x86)
  set(ASMS asm)
  list(REMOVE_ITEM SRC_COM ${CMAKE_SOURCE_DIR}/source/common/common_arm.c)
  set(WFLAGS "${WFLAGS} -Wno-implicit-function-declaration")
  set(HAVE_VECTOREXT 1)
  add_definitions(-fomit-frame-pointer -fno-tree-vectorize -DARCH_X86_64=1)
  if(ENABLE_AVX)
    add_definitions(-DHAVE_MMX=1)
    file(GLOB SRC_VEC source/common/vec/*.c)
    file(GLOB HDR_VEC source/common/vec/*.h)
    set(HAVE_MMX 1)
    set(CPP "-mmmx -msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 -msse4a")
    set(CPP "${CPP} -mavx -mavx2")
    set(HAVE_X86_INLINE_ASM 0)   ## todo
  endif()
endif()

# write config.h
set(BIT_DEPTH ${XAVS2_BIT_DEPTH})
set(CONFIG_H_IN ${CMAKE_CURRENT_SOURCE_DIR}/source/config.h.in)
configure_file(${CONFIG_H_IN} config.h @ONLY)

if(ENABLE_ASM)
  if (EXISTS ${X264_SOURCE_DIR}/common/${ARCH_ASM})
    message("X264 ASM source dir found at ${X264_ASM_DIR}")
    enable_language(ASM)
    set(ASM_DIR ${CMAKE_SOURCE_DIR}/source/common/${ARCH_ASM})
    if(NOT EXISTS source/common/${ARCH_ASM})
      file(COPY ${X264_SOURCE_DIR}/common/${ARCH_ASM} DESTINATION ${CMAKE_SOURCE_DIR}/source/common)
    endif()
    file(COPY ${CMAKE_BINARY_DIR}/config.h DESTINATION ${ASM_DIR})
    
    foreach(ASM ${ASM_S})
      list(APPEND ASM_OBJS ${ASM}.${OBJ_SUFFIX})
      add_custom_command(
        OUTPUT ${ASM}.${OBJ_SUFFIX}
        COMMAND ${ASM_COMPILER}
        ARGS ${ASM_FLAGS} ${ASM} -o ${ASM}.${OBJ_SUFFIX}
        DEPENDS ${ASM}
      )
    endforeach()  
    
    list(APPEND ASM_C ${ASM_DIR}/mc-c.c ${ASM_DIR}/predict-c.c)
    #list(APPEND ASM_H mc.h predict.h bitstream.h dct.h deblock.h mc.h pixel.h predict.h quant.h)
    list(APPEND ASM_S bitstream-a dct-a deblock-a mc-a pixel-a predict-a quant-a)
    file(GLOB ASM_H ${ASM_DIR}/*.h ${CMAKE_BINARY_DIR}/config.h)
    list(APPEND ASM_C ${ASM_H})
    # S files are ADS syntax, not GNU syntax, clang fails
    if (CMAKE_SYSTEM_PROCESSOR MATCHES aarch64)
      set(ASM_EXT S)
      set(ASM_FLAGS "-I. -I.. -c -DSTACK_ALIGNMENT=16 -DPIC")
      set(ASM_COMPILER ${CMAKE_C_COMPILER})
      list(APPEND ASM_C ${ASM_DIR}/asm-offsets.c)
      list(APPEND ASM_S cabac-a)
      # check sve support
      check_c_source_runs("__asm__(\".arch armv8.2-a+sve  \n ptrue p0.b, vl16\");" SUPPORTS_SVE)
      if(SUPPORTS_SVE)
        message("${CMAKE_SYSTEM_PROCESSOR} supports SVE")
        add_definitions(-DHAVE_SVE)
        list(APPEND ASM_S dct-a-sve deblock-a-sve mc-a-sve pixel-a-sve)
      endif()
      # check sve2 support
      check_c_source_runs("__asm__(\".arch armv8.2-a+sve2 \n smlalb z10.s, z2.h, z1.h\");" SUPPORTS_SVE2)
      if(SUPPORTS_SVE2)
        message("${CMAKE_SYSTEM_PROCESSOR} supports SVE2")
        add_definitions(-DHAVE_SVE2)
        list(APPEND ASM_S dct-a-sve2)
      endif()
      #-DHAVE_AS_FUNC=1
    elseif(CMAKE_SYSTEM_PROCESSOR MATCHES arm)
      set(ASM_EXT S)
    elseif(CMAKE_SYSTEM_PROCESSOR MATCHES *.86$)
      set(ASM_EXT asm)
      list(APPEND ASM_S const-a cabac-a mc-a2 dct-32 pixel-32)
    elseif(CMAKE_SYSTEM_PROCESSOR MATCHES x86_64)
      set(ASM_EXT asm)
      list(APPEND ASM_S const-a cabac-a mc-a2 dct-64 trellis-64)
    endif()
    add_definitions(-fno-integrated-as)
    if (CMAKE_C_COMPILER_ID STREQUAL "Clang")
      set(ASM_FLAGS "${ASM_FLAGS} -c")
      add_definitions(-DHAVE_AS_FUNC=1)
      set(ASM_COMPILER ${CMAKE_C_COMPILER})
    else()
      set(ASM_COMPILER nasm)
    endif()
    message("ASM compiler set to ${ASM_COMPILER}")
    foreach(ASM ${ASM_S})
      set(ASM_IN ${ASM_DIR}/${ASM}.${ASM_EXT})
      set(ASM_OUT ${CMAKE_BINARY_DIR}/${ASM}.${ASM_EXT})
      list(APPEND ASM_OBJS ${ASM_OUT})
      add_custom_command(
        OUTPUT ${ASM_OUT}
        COMMAND ${ASM_COMPILER}
        ARGS ${ASM_FLAGS} ${ASM_IN} -o ${ASM_OUT} -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
        DEPENDS ${ASM_IN}
      )  
    endforeach()
  else()
    message(FATAL_ERROR "X264 source must be set with -DX264_SOURCE_DIR=/path/to/x264 source")
  endif()
else()
  set(ENABLE_ASM OFF)
endif(ENABLE_ASM)

set(xavs2_SRC ${SRC_COM} ${SRC_ENC} ${SRC_VEC} ${ASM_C})

file(GLOB xavs2_HDR
  config.h
  source/*.h
  source/common/*.h
  source/encoder/*.h
  ${HDR_VEC}
  ${HDR_ASM}
)

add_definitions(-DBIT_DEPTH=${XAVS2_BIT_DEPTH})

if (${XAVS2_BIT_DEPTH} GREATER 8)
  add_definitions(-DHIGH_BIT_DEPTH=1)
endif()

if (DISABLE_WARNINGS)
  set(WFLAGS "${WFLAGS} -Wno-macro-redefined -Wno-unused-but-set-variable -Wno-typedef-redefinition")
  set(WFLAGS "${WFLAGS} -Wno-unused-const-variable -Wno-unused-parameter -Wno-unused-function")
  set(WFLAGS "${WFLAGS} -Wno-tautological-overlap-compare -Wno-tautological-bitwise-compare")
  set(WFLAGS "${WFLAGS} -Wno-sign-compare -Wno-format -Wno-shift-negative-value -Wno-missing-braces")
  set(WFLAGS "${WFLAGS} -Wno-missing-field-initializers -Wno-incompatible-pointer-types-discards-qualifiers")
  set(WFLAGS "${WFLAGS} -Wno-unused-variable -Wno-incompatible-pointer-types")
else()
  set(WFLAGS)
endif()

set(CMAKE_C_FLAGS "-std=c99 ${CPP} ${CMAKE_C_FLAGS} -Wall -Wextra ${WFLAGS}")

add_library(xavs2_obj OBJECT ${xavs2_SRC} ${xavs2_HDR} )
add_library(xavs2 $<TARGET_OBJECTS:xavs2_obj>)

set_target_properties(xavs2 PROPERTIES VERSION ${XAVS2_LIB_VERSION} SOVERSION ${XAVS2_SO_VERSION})
target_link_libraries(xavs2 ${XAVS2_LIBS})

set(xavs2_targets xavs2)

if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
  add_library(xavs2_static STATIC $<TARGET_OBJECTS:xavs2_obj>)
  set_target_properties(xavs2_static PROPERTIES
    VERSION ${XAVS2_LIB_VERSION}
    SOVERSION ${XAVS2_SO_VERSION}
    OUTPUT_NAME xavs2
    RUNTIME_OUTPUT_NAME xavs2
    ARCHIVE_OUTPUT_NAME xavs2)
  target_link_libraries(xavs2_static ${XAVS2_LIBS})
  list(APPEND xavs2_targets xavs2_static)
endif()

install(TARGETS ${xavs2_targets}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib${LIB_SUFFIX}
  ARCHIVE DESTINATION lib${LIB_SUFFIX}
)

# Headers
install(FILES source/xavs2.h source/xavs2_config.h DESTINATION include)

# Pkg-config file
set(PCFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/pkg-config.pc.in)
configure_file(${PCFILE_IN} ${PROJECT_NAME}.pc @ONLY)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc DESTINATION lib/pkgconfig)

# xavs2_app Executable
if(BUILD_EXECUTABLE)
  add_executable(xavs2_app ${xavs2_CLI} source/xavs2.h source/xavs2_config.h source/common/cpu.h)
  target_link_libraries(xavs2_app xavs2)
  install(TARGETS xavs2_app RUNTIME DESTINATION bin)
endif()