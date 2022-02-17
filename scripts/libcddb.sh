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

CFG="--without-cdio"
WFLAGS='-Wno-header-guard'

. xbuilder.sh

source_patch(){
    # ix clang undefined symbol rpl_malloc error by disabling AC_FUNC_MALLOC
    sed -i 's|AC_FUNC_MALLOC|#AC_FUNC_MALLOC|' configure.ac
    # regenerate
    doAutoreconf ${dir_src}
}

start

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
