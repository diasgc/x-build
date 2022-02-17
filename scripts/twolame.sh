#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU ...  .   .   .  gcc
# WIN ...  .   .   .  clang/gcc

lib='twolame'
dsc='MPEG Audio Layer 2 (MP2) encoder'
lic='LGPL-2.1'
src='https://github.com/njh/twolame.git'
cfg='ac'
dep='sndfile'
eta='225'

. xbuilder.sh

CFG="--disable-maintainer-mode"

source_patch(){
	# Exclude 'doc' from SUBDIRS = .... list in Makefile.am , or build LibTwoLAME fails.
	sed -i.bak "/^SUBDIRS/s/ doc//" Makefile.am
	doAutoreconf ${dir_src}
	popdir
}

start

# Filelist
# --------
# include/twolame.h
# lib/pkgconfig/twolame.pc
# lib/libtwolame.so
# lib/libtwolame.la
# lib/libtwolame.a
# share/doc/twolame/NEWS
# share/doc/twolame/AUTHORS
# share/doc/twolame/COPYING
# share/doc/twolame/README
# bin/twolame
