cmake_minimum_required(VERSION 2.8.8) 
project(jxrlib)
set(jxrlib_VERSION 1.1.0)
set(jxrlib_SOVERSION 1)

set(bindir bin)
set(incdir include)
set(libdir lib)

set(CMAKE_SKIP_BUILD_RPATH OFF)
set(CMAKE_BUILD_WITH_INSTALL_RPATH OFF)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/${libdir}")
set(CMAKE_INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/${libdir}")

# suppress warnings...
set(SUPPRESS_WARNING_FLAGS "-Wno-comment -Wno-extra-tokens -Wno-unknown-pragmas -Wno-implicit-function-declaration")
set(SUPPRESS_WARNING_FLAGS "${SUPPRESS_WARNING_FLAGS} -Wno-implicit-int -Wno-endif-labels -Wno-dangling-else")
set(SUPPRESS_WARNING_FLAGS "${SUPPRESS_WARNING_FLAGS} -Wno-incompatible-pointer-types -Wno-shift-negative-value -Wno-unused-value")

set(CMAKE_C_FLAGS "-std=c99 -Wall -Wextra ${SUPPRESS_WARNING_FLAGS}")
add_definitions(-D__ANSI__ -DDISABLE_PERF_MEASUREMENT)
include_directories(common/include image/sys jxrgluelib jxrtestlib)

# sources
file(GLOB SRC_DEC "image/decode/*.c")
file(GLOB SRC_ENC "image/encode/*.c")
file(GLOB SRC_SYS "image/sys/*.c")
file(GLOB SRC_GLUE "jxrgluelib/*.c")
file(GLOB SRC_TEST "jxrtestlib/*.c")

# libraries
add_library(libjpegxr_shared SHARED ${SRC_SYS} ${SRC_ENC} ${SRC_DEC})
add_library(libjpegxr_static STATIC ${SRC_SYS} ${SRC_ENC} ${SRC_DEC})
add_library(libjxrglue_shared SHARED ${SRC_GLUE} ${SRC_TEST})
add_library(libjxrglue_static STATIC ${SRC_GLUE} ${SRC_TEST})

set(jxrlib_SHARED_LIBRARIES libjpegxr_shared libjxrglue_shared)
set(jxrlib_STATIC_LIBRARIES libjpegxr_static libjxrglue_static)

# executables
add_executable(JxrEncApp jxrencoderdecoder/JxrEncApp.c)
add_executable(JxrDecApp jxrencoderdecoder/JxrDecApp.c)

set(jxrlib_EXECUTABLES JxrEncApp JxrDecApp)

# link
target_link_libraries(libjxrglue_shared m libjpegxr_shared)
target_link_libraries(JxrEncApp m ${jxrlib_SHARED_LIBRARIES})
target_link_libraries(JxrDecApp m ${jxrlib_SHARED_LIBRARIES})

# set names and versions of libraries
set_target_properties(libjpegxr_shared PROPERTIES
    OUTPUT_NAME jpegxr
    VERSION ${jxrlib_VERSION}
    SOVERSION ${jxrlib_SOVERSION}
)

set_target_properties(libjpegxr_static PROPERTIES
    OUTPUT_NAME jpegxr
)

set_target_properties(libjxrglue_shared PROPERTIES
    OUTPUT_NAME jxrglue
    VERSION ${jxrlib_VERSION}
    SOVERSION ${jxrlib_SOVERSION}
)

set_target_properties(libjxrglue_static PROPERTIES
    OUTPUT_NAME jxrglue
)

# install
install(TARGETS
    ${jxrlib_EXECUTABLES}
    ${jxrlib_SHARED_LIBRARIES}
    ${jxrlib_STATIC_LIBRARIES}
    RUNTIME DESTINATION ${bindir}
    LIBRARY DESTINATION ${libdir}
    ARCHIVE DESTINATION ${libdir}
)

file(GLOB HEADERS_DEC "image/decode/*.h")
file(GLOB HEADERS_ENC "image/encode/*.h")
file(GLOB HEADERS_SYS "image/sys/*.h")
file(GLOB HEADERS_GLUE "jxrgluelib/*.h")
file(GLOB HEADERS_TEST "jxrtestlib/*.h")

install(FILES ${HEADERS_DEC} ${HEADERS_ENC} ${HEADERS_SYS}
  DESTINATION "${incdir}/jxrlib"
)
install(FILES ${HEADERS_GLUE} ${HEADERS_TEST}
  DESTINATION "${incdir}/jxrgluelib"
)