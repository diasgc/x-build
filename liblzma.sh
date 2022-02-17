#!/bin/bash

lib='liblzma'
apt="${lib}-dev"
dsc='General purpose data compression library'
lic='GPL-3 LGPL-2.1'
vrs='v5.2.5' #stable
src='https://git.tukaani.org/xz.git'
cfg='ac'
eta='110'
mki='install'
automake_cmd='./autogen.sh --no-po4a'

lst_inc='lzma.h lzma/*.h'
lst_lib='liblzma'
lst_bin='xzmore xzdec xzgrep xz lzmainfo xzless lzmadec xzdiff'
lst_lic='COPYING AUTHORS'
lst_pc='liblzma.pc'

. xbuilder.sh

ac_config="--disable-doc"
WFLAGS="-Wno-macro-redefined"

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/lzma/stream_flags.h
# include/lzma/index.h
# include/lzma/check.h
# include/lzma/container.h
# include/lzma/vli.h
# include/lzma/hardware.h
# include/lzma/delta.h
# include/lzma/base.h
# include/lzma/bcj.h
# include/lzma/filter.h
# include/lzma/version.h
# include/lzma/lzma12.h
# include/lzma/block.h
# include/lzma/index_hash.h
# include/lzma.h
# lib/pkgconfig/liblzma.pc
# lib/liblzma.a
# lib/liblzma.la
# lib/liblzma.so
# share/man/man1/xz.1
# share/man/man1/xzless.1
# share/man/man1/xzgrep.1
# share/man/man1/lzmainfo.1
# share/man/man1/xzdec.1
# share/man/man1/xzmore.1
# share/man/man1/xzdiff.1
# share/doc/liblzma/AUTHORS
# share/doc/liblzma/COPYING
# bin/xzmore
# bin/xzdec
# bin/xzgrep
# bin/xz
# bin/lzmainfo
# bin/xzless
# bin/lzmadec
# bin/xzdiff
