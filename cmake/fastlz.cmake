cmake_minimum_required(VERSION 3.10)

project(fastlz C)
option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_EXAMPLES "Build examples" ON)
option(BUILD_TESTS "Build tests" OFF)
option(INSTALL_MAN "Install man" OFF)
option(INSTALL_DOCS "Install docs" ON)

if(WIN32)
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -flto")
else()
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -flto -fPIC -fPIE")
endif()

include_directories(${CMAKE_SOURCE_DIR})

add_library(fastlz fastlz.c fastlz.h)

if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_library(fastlz_static STATIC fastlz.c fastlz.h)
    set_target_properties(fastlz_static PROPERTIES OUTPUT_NAME fastlz)
endif()

if(BUILD_EXAMPLES)
    add_executable(6pack examples/6pack.c)
    target_link_libraries(6pack fastlz)
    add_executable(6unpack examples/6unpack.c)
    target_link_libraries(6unpack fastlz)
endif()

install(TARGETS fastlz
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib\${LIB_SUFFIX}
    LIBRARY DESTINATION lib\${LIB_SUFFIX})

if(BUILD_STATIC_LIBS AND BUILD_SHARED_LIBS)
  install(TARGETS fastlz_static ARCHIVE DESTINATION lib\${LIB_SUFFIX})
endif()

install(FILES fastlz.h DESTINATION include)

if(BUILD_EXAMPLES)
  install(TARGETS 6pack 6unpack RUNTIME DESTINATION bin)
endif()

if(INSTALL_DOCS)
  install(FILES LICENSE.MIT README.md DESTINATION share/docs/fastlz)
endif()