#!/bin/bash

lib='wavpack'
dsc='WavPack encode/decode library, command-line programs, and several plugins'
lic='BSD 3-clause'
src='https://github.com/dbry/WavPack.git'
cfg='ar'
dep='libiconv'
eta='30'
cbk="able-apps"

cfg_bin='--disable-apps|--enable-apps'

dev_bra='master'
dev_vrs=''
stb_bra='tags/5.4.0'
stb_vrs='5.4.0'

lst_inc='wavpack/wavpack.h'
lst_lib='libwavpack'
lst_bin='wavpack wvgain wvtag wvunpack'
lst_lic='COPYING AUTHORS'
lst_pc='wavpack.pc'

mki='install'

. xbuilder.sh

# cli has glob header that requires api28 for ndk
$build_bin && $host_ndk && [ $API -lt 28 ] && set_ndk_api 28

CFG="--enable-maintainer-mode"

$host_arm && CFG+=" --disable-asm"

source_config(){
    test -f config.rpath || cp /usr/share/gettext/config.rpath . 2>/dev/null || touch config.rpath || exit 1
    doAutoreconf .
}

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .  +++ clang/gcc


# Filelist
# --------
# include/wavpack/wavpack.h
# lib/pkgconfig/wavpack.pc
# lib/libwavpack.a
# lib/libwavpack.la
# lib/libwavpack.so
# share/man/man1/wvtag.1
# share/man/man1/wvgain.1
# share/man/man1/wvunpack.1
# share/man/man1/wavpack.1
# share/doc/wavpack/AUTHORS
# share/doc/wavpack/COPYING
# bin/wavpack
# bin/wvgain
# bin/wvtag
# bin/wvunpack
