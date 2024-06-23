cmake_minimum_required(VERSION 3.5)

project(rtmp LANGUAGES C VERSION 2.4.0)

include(GNUInstallDirs)

option(BUILD_STATIC_LIBS "Build static libs" ON)
option(BUILD_SHARED_LIBS "Build shared libs" ON)
option(BUILD_EXECUTABLES "Build executables" ON)
option(INSTALL_DOCS      "Install Manpages"  ON)

set(SRCS
	librtmp/bytes.h
	librtmp/dh.h
	librtmp/dhgroups.h
	librtmp/handshake.h
	librtmp/rtmp_sys.h
	librtmp/amf.c
	librtmp/hashswf.c
	librtmp/log.c
	librtmp/parseurl.c
	librtmp/rtmp.c
)

set(HDRS
    librtmp/amf.h
    librtmp/http.h
    librtmp/log.h
    librtmp/rtmp.h
)

find_package(OpenSSL REQUIRED)
find_package(ZLIB REQUIRED)

add_definitions(
    -DUSE_OPENSSL
    -D_CRT_SECURE_NO_WARNINGS
    -DNO_CRYPTO
    -DRTMPDUMP_VERSION=\"${PROJECT_VERSION}\"
    -Wno-tautological-constant-out-of-range-compare
    -Wno-deprecated-declarations
)

include_directories(
	${CMAKE_SOURCE_DIR}/librtmp
	${OPENSSL_INCLUDE_DIR}
	${ZLIB_INCLUDE_DIRS}
)

macro(add_lib sfx lnk)
    add_library(rtmp${sfx} ${lnk} ${SRCS} ${HDRS})
    set_host_properties(rtmp${sfx} PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        OUTPUT_NAME rtmp
    )
    target_link_libraries(rtmp${sfx}
        ${OPENSSL_LIBRARIES}
        ${ZLIB_LIBRARIES}
    )
    target_compile_options(rtmp${sfx} PRIVATE -DEXPORT)
    install(TARGETS rtmp${sfx}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    )
endmacro()

add_lib("" "")
if(BUILD_SHARED_LIBS AND BUILD_STATIC_LIBS)
    add_lib(-static STATIC)
endif()

install(FILES ${HDRS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/librtmp)

set(prefix       "${CMAKE_INSTALL_PREFIX}")
set(libdir       "\${prefix}/${CMAKE_INSTALL_LIBDIR}")
set(CRYPTO_REQ   "libssl,libcrypto")
set(PUBLIC_LIBS  "-lssl -lcrypto")
set(PRIVATE_LIBS "")
set(VERSION      "${PROJECT_VERSION}")
configure_file(librtmp/librtmp.pc.in librtmp.pc @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/librtmp.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)

if(BUILD_EXECUTABLES)
    add_executable(rtmpdump rtmpdump.c)
    target_link_libraries(rtmpdump rtmp)
    add_executable(rtmpsrv rtmpsrv.c thread.c thread.h)
    target_link_libraries(rtmpsrv rtmp)
    add_executable(rtmpgw rtmpgw.c thread.c thread.h)
    target_link_libraries(rtmpgw rtmp)
    add_executable(rtmpsuck rtmpsuck.c thread.c thread.h)
    target_link_libraries(rtmpsuck rtmp)
    install(TARGETS rtmpdump rtmpsrv rtmpgw rtmpsuck
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
    install(FILES COPYING README DESTINATION share/doc/rtmpdump)
    if(INSTALL_DOCS)
        install(FILES rtmpgw.8 rtmpgw.8.html DESTINATION share/man/man8)
        install(FILES rtmpdump.1 rtmpdump.1.html DESTINATION share/man/man1)
    endif()
endif()

install(FILES librtmp/COPYING DESTINATION share/doc/librtmp)
if(INSTALL_DOCS)
    install(FILES librtmp/librtmp.3 librtmp/librtmp.3.html DESTINATION share/man/man3)
endif()
