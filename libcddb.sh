#!/bin/bash

#vrs='1.3.2'
lib='libcddb'
apt='libcddb2-dev'
dsc='CDDB server access library'
lic='GPL?'
src='https://salsa.debian.org/nickg/libcddb.git'
cfg='ac'
dep='libiconv libcdio' # optional
eta='10'

lst_inc='cddb/*.h'
lst_lib='libcddb'
lst_bin='cddb_query'
lst_lic='COPYING AUTHORS'
lst_pc='libcddb.pc'

dev_bra='master'
dev_vrs='1.3.2'
stb_bra=''
stb_vrs=''

CFG="--without-cdio"
WFLAGS='-Wno-header-guard'

source_patch(){
    # ix clang undefined symbol rpl_malloc error by disabling AC_FUNC_MALLOC
    sed -i 's|AC_FUNC_MALLOC|#AC_FUNC_MALLOC|' configure.ac
    # regenerate
    doAutoreconf ${dir_src}
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/cddb/cddb_error.h
# include/cddb/cddb_track.h
# include/cddb/cddb_disc.h
# include/cddb/cddb_cmd.h
# include/cddb/cddb.h
# include/cddb/cddb_config.h
# include/cddb/cddb_conn.h
# include/cddb/cddb_site.h
# include/cddb/version.h
# include/cddb/cddb_log.h
# lib/libcddb.a
# lib/pkgconfig/libcddb.pc
# lib/libcddb.so
# lib/libcddb.la
# share/doc/libcddb/AUTHORS
# share/doc/libcddb/COPYING
# bin/cddb_query

<<'CMakeLists.txt'

set(chk_hdr1
    HAVE_SYS_SOCKET_H # > CDDB_NEED_SYS_SOCKET_H
    HAVE_UNISTD_H     # > CDDB_NEED_UNISTD_H
    HAVE_ARPA_INET_H
    HAVE_ERRNO_H
    HAVE_FCNTL_H
    HAVE_ICONV_H
    HAVE_MEMORY_H
    HAVE_NETDB_H
    HAVE_NETINET_IN_H
    HAVE_REGEX_H
    HAVE_SYS_SELECT_H
    HAVE_SYS_SOCKET_H
    HAVE_SYS_STAT_H
    HAVE_SYS_TIME_H
    HAVE_SYS_TYPES_H
    HAVE_TIME_H
    HAVE_UNISTD_H
    HAVE_WINDOWS_H
    HAVE_WINSOCK2_H
)

check_stdcheaders()
if(NOT STDC_HEADERS)
    list(APPEND chk_hdr1
        HAVE_DLFCN_H
        HAVE_INTTYPES_H
        HAVE_STDINT_H
        HAVE_STDLIB_H
        HAVE_STRINGS_H
        HAVE_STRING_H
    )
endif()
check_headers(${chk_hdr1})

if(NOT HAVE_SYS_TYPES_H)
    set(size_t "unsigned int") # Define to `unsigned int' if <sys/types.h> does not define.
endif()

set(CDDB_NEED_SYS_SOCKET_H ${HAVE_SYS_SOCKET_H})
set(CDDB_NEED_UNISTD_H ${HAVE_UNISTD_H})

set(fn1 # Define to 1 if you have the function.
    HAVE_ALARM
    HAVE_MEMSET
    HAVE_MKDIR
    HAVE_REALLOC
    HAVE_REGCOMP
    HAVE_SELECT
    HAVE_SOCKET
    HAVE_STRCHR
    HAVE_STRDUP
    HAVE_STRTOL
    HAVE_VPRINTF
)

set(fn # Define if you have the function and it works.
    HAVE_ICONV      
)

set(fm10 # Define to 1 if you have the function, and to 0 otherwise.
    HAVE_MALLOC     
)
check_functions(${fn} ${fn1} ${fn10})

set(libs # Define this if you have the library installed
    HAVE_LIBCDIO
)
set(libs1 # Define to 1 if you have the library
    HAVE_LIBNETWORK
    HAVE_LIBNSL
    HAVE_LIBSOCKET
)
check_libraries(${libs} ${libs1})

add_config(FILE config.h DEFONLY VARS ${fn} ${libs})
add_config(FILE config.h DEF1 VARS ${fn1} ${chk_hdr1} ${libs1})
add_config(FILE config.h DEF10 VARS ${fn10})


/* config.h.in.  Generated from configure.ac by autoheader.  */

#undef BEOS                 /* Define if compiling on BeOS system. */
#undef HAIKU                /* Define if compiling on Haiku system. */
#undef HAVE_DOPRNT          /* Define to 1 if you don't have `vprintf' but do have `_doprnt.' */

#undef ICONV_CONST          /* Define as const if the declaration of iconv() needs const. */
#undef LOGLEVEL             /* Set to default log level */
#undef LT_OBJDIR            /* Define to the sub-directory in which libtool stores uninstalled libraries.*/

#undef LSTAT_FOLLOWS_SLASHED_SYMLINK    /* Define to 1 if `lstat' dereferences a symlink specified with a trailing slash. */
#undef HAVE_STAT_EMPTY_STRING_BUG   /* Define to 1 if `stat' has the bug that it succeeds when given the zero-length file name argument. */

#undef PACKAGE              /* Name of package */
#undef PACKAGE_BUGREPORT    /* Define to the address where bug reports for this package should be sent. */
#undef PACKAGE_NAME         /* Define to the full name of this package. */
#undef PACKAGE_STRING       /* Define to the full name and version of this package. */
#undef PACKAGE_TARNAME      /* Define to the one symbol short name of this package. */
#undef PACKAGE_VERSION      /* Define to the version of this package. */
#undef VERSION              /* Version number of package */

#undef SELECT_TYPE_ARG1     /* Define to the type of arg 1 for `select'. */
#undef SELECT_TYPE_ARG234   /* Define to the type of args 2, 3 and 4 for `select'. */
#undef SELECT_TYPE_ARG5     /* Define to the type of arg 5 for `select'. */

#undef STDC_HEADERS         /* Define to 1 if you have the ANSI C header files. */
#undef TIME_WITH_SYS_TIME   /* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#undef const                /* Define to empty if `const' does not conform to ANSI C. */
#undef malloc               /* Define to rpl_malloc if the replacement function should be used. */
#undef realloc              /* Define to rpl_realloc if the replacement function should be used. */

CMakeLists.txt