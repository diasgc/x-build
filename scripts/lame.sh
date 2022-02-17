#!/bin/bash

lib='lame'
dsc='LAME is a high quality MPEG Audio Layer III (MP3) encoder'
lic='LGPL'
svn='https://svn.code.sf.net/p/lame/svn' #sty='svn'
src="${svn}/trunk/lame" #src='https://github.com/despoa/LAME.git'
cfg='ac'
dep='libiconv'
eta='180'
mki='install-strip'
mkc='distclean'
cbk="able-frontend"
pc_llib="-lmp3lame"
API=26 # required for frontends build

ac_bin='--disable-frontend|--enable-frontend'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc='lame/lame.h'
lst_lib='libmp3lame'
lst_bin='lame'
lst_lic='LICENSE COPYING'
lst_pc='lame.pc'

. xbuilder.sh

# update latest version
vrs=$(svn log ${svn}/tags --limit 1 | grep 'tag' | sed "s/tag \(\) release/\1/")

ac_config="--disable-gtktest --disable-decoder --disable-debug"
$host_mingw && ac_config+=" --enable-expopt=full"
# make shared executable so
! $build_static && $build_bin && CBN="--enable-dynamic-frontends"
$host_ndk && [ ${API} -lt 26 ] && unset CBN

before_make(){
	#no docs
	sed -i '/^SUBDIRS/ {s/ doc//}' Makefile
}

start

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++ +++  .   .  gcc
# WIN +++ +++  .   .  clang/gcc


# Filelist
# --------
# include/lame/lame.h
# lib/pkgconfig/lame.pc
# lib/libmp3lame.so
# lib/libmp3lame.a
# lib/libmp3lame.la
# share/doc/lame/LICENSE
# share/doc/lame/COPYING
# bin/lame
