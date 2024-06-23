cmake_minimum_required(VERSION 2.8)

project(jxrlib C)

set(CMAKE_INSTALL_LIBDIR lib)
set(CMAKE_INSTALL_INCLUDEDIR include)

set(PROJECT_NAME jxrlib)
set(CMAKE_PROJECT_DESCRIPTION "JPEG XR Image Codec reference implementation library released by Microsoft")
set(CMAKE_PROJECT_HOMEPAGE_URL "https://github.com/4creators/jxrlib.git")
set(PROJECT_VERSION "v2019.10.9")
set(LIBS_PUBLIC "-ljpegxr -ljxrglue")
set(REQ_PRIVATE)
set(REQ_PUBLIC)

set(JXRLIB_MAJOR "2019")
set(JXRLIB_MINOR "10")

set(JXRLIB_LIB_VERSION ${JXRLIB_MAJOR}.${JXRLIB_MINOR}.0)
set(JXRLIB_SO_VERSION ${JXRLIB_MAJOR})

include(TestBigEndian)
test_big_endian(ISBIGENDIAN)
if(ISBIGENDIAN)
  set(DEF_ENDIAN -D_BIG__ENDIAN_)
endif()

add_definitions(-D__ANSI__ -DDISABLE_PERF_MEASUREMENT ${DEF_ENDIAN})

set(WFLAGS "-Wno-implicit-int -Wno-implicit-function-declaration -Wno-endif-labels -Wno-dangling-else")
set(WFLAGS "${WFLAGS} -Wno-missing-field-initializers -Wno-deprecated-declarations -Wno-constant-conversion")
set(WFLAGS "${WFLAGS} -Wno-incompatible-pointer-types -Wno-shift-negative-value -Wno-sign-compare")
set(WFLAGS "${WFLAGS} -Wno-unused-value -Wno-unused-but-set-variable -Wno-unused-function -Wno-unused-const-variable")
set(WFLAGS "${WFLAGS} -Wno-unknown-pragmas -Wno-comment -Wno-extra-tokens -Wno-misleading-indentation")


set(CMAKE_C_FLAGS "-std=c99 -Wall -Wextra ${WFLAGS}")

include_directories(
  common/include
  image/sys
  jxrgluelib
  jxrtestlib
)

# JXR Library
file(GLOB jpegxr_SRC image/sys/*.c image/decode/*.c image/encode/*.c)
file(GLOB jpegxr_HDR image/sys/*.h image/decode/*.h image/encode/*.h)

add_library(jpegxr_obj OBJECT ${jpegxr_SRC} ${jpegxr_HDR})

add_library(jpegxr $<TARGET_OBJECTS:jpegxr_obj>)
set_host_properties(jpegxr PROPERTIES VERSION ${JXRLIB_LIB_VERSION} SOVERSION ${JXRLIB_SO_VERSION})

# JXR-GLUE Library
file(GLOB jxrglue_SRC jxrgluelib/*.c jxrtestlib/*.c)
file(GLOB jxrglue_HDR jxrgluelib/*.h jxrtestlib/*.h)

add_library(jxr_obj OBJECT ${jxrglue_SRC} ${jxrglue_HDR})
add_library(jxrglue $<TARGET_OBJECTS:jxr_obj>)
set_host_properties(jxrglue PROPERTIES
  VERSION ${JXRLIB_LIB_VERSION}
  SOVERSION ${JXRLIB_SO_VERSION})
target_link_libraries(jxrglue PRIVATE jpegxr m)
set(jpegxr_targets jpegxr jxrglue)

if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
  add_library(jpegxr_static STATIC $<TARGET_OBJECTS:jpegxr_obj>)
  set_host_properties(jpegxr_static PROPERTIES
    VERSION ${JXRLIB_LIB_VERSION}
    SOVERSION ${JXRLIB_SO_VERSION}
    OUTPUT_NAME jpegxr
    RUNTIME_OUTPUT_NAME jpegxr
    ARCHIVE_OUTPUT_NAME jpegxr)

  add_library(jxrglue_static STATIC $<TARGET_OBJECTS:jxr_obj>)
  set_host_properties(jxrglue_static PROPERTIES
    VERSION ${JXRLIB_LIB_VERSION}
    SOVERSION ${JXRLIB_SO_VERSION}
    OUTPUT_NAME jxrglue
    RUNTIME_OUTPUT_NAME jxrglue
    ARCHIVE_OUTPUT_NAME jxrglue)
  target_link_libraries(jxrglue_static jpegxr_static m)
  list(APPEND jpegxr_targets jpegxr_static jxrglue_static)
endif()

install(TARGETS ${jpegxr_targets}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib${LIB_SUFFIX}
  ARCHIVE DESTINATION lib${LIB_SUFFIX}
)

# Executables
if(BUILD_EXECUTABLES)
  # JxrEncApp Executable
  add_executable(JxrEncApp jxrencoderdecoder/JxrEncApp.c)
  target_link_libraries(JxrEncApp jxrglue)
  install(TARGETS JxrEncApp RUNTIME DESTINATION bin)

  # JxrDecApp Executable
  add_executable(JxrDecApp jxrencoderdecoder/JxrDecApp.c)
  target_link_libraries(JxrDecApp jxrglue)
  install(TARGETS JxrDecApp RUNTIME DESTINATION bin)
endif()

# Headers
file(GLOB HEADERS_DEC "image/decode/*.h")
file(GLOB HEADERS_ENC "image/encode/*.h")
file(GLOB HEADERS_SYS "image/sys/*.h")
file(GLOB HEADERS_GLUE "jxrgluelib/*.h")
file(GLOB HEADERS_TEST "jxrtestlib/*.h")

install(FILES ${HEADERS_DEC} ${HEADERS_ENC} ${HEADERS_SYS}
  DESTINATION include/jxrlib
)
install(FILES ${HEADERS_GLUE} ${HEADERS_TEST}
  DESTINATION include/jxrgluelib
)

# Pkg-config file
set(PCFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/../../cmake/pkg-config.pc.in)
configure_file(${PCFILE_IN} jpegxr.pc @ONLY)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jpegxr.pc DESTINATION lib/pkg-pkgconfig)
