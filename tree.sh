#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  .   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='tree'
dsc='Tree is a recursive directory listing command'
lic='GPL-2'
vrs='1.8.0'
src="http://mama.indstate.edu/users/ice/tree/src/tree-${vrs}.tgz"
sty='tgz'
cfg='mk'
eta='45'
API=26

. xbuilder.sh
# todo clean & simplify

OBJS="tree.o unix.o html.o xml.o json.o hash.o color.o file.o"
CFLAGS+=' -std=c11 -O3 -flto -Wall' LDFLAGS+=" -s"

case $host_os in
  android) CFLAGS+=" -D__ANDROID" LDFLAGS+=" -lc" OBJS+=" strverscmp.o";;
  gnu) CFLAGS=" -DLINUX";;
  *) doErr "  $arch is unsupported";;
esac

$host_64 && CFLAGS+=" -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"

CFG="prefix=$INSTALL_DIR CC=$CC"
mki="prefix=$INSTALL_DIR install"

source_patch(){
    # clear defaults
    sed -i "s,OBJS=tree.o,#OBJS=tree.o," Makefile
    sed -i "s,CFLAGS=-ggdb,#CFLAGS=-ggdb," Makefile
}

build_all(){
    pushd ${dir_src} >/dev/null
    do_log 'clean' make clean
    log 'make '
    LDFLAGS=$LDFLAGS CFLAGS=$CFLAGS OBJS=$OBJS make $CFG -j4 >>"${log_file}" || err
    logok
    do_log 'install' install -s -D -m 700 ${dir_src}/tree ${dir_install}/bin
    popd >/dev/null 
}

start