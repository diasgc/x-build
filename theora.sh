#!/bin/bash

lib='theora'
apt='libtheora-dev'
dsc='Theora video compression format'
lic='BSD'
src='https://github.com/xiph/theora.git'
#bra='tags/v1.1.1'
cfg='ag'
dep='ogg vorbis'
eta='391'

dev_bra='master'
dev_vrs='1.1.1'
stb_bra=''
stb_vrs=''

lst_inc='theora/*.h'
lst_lib='libvorbisfile libvorbisenc libvorbis'
lst_bin='libtheoraenc libtheoradec libtheora'
lst_lic='COPYING LICENCE AUTHORS'
lst_pc='theora.pc theoraenc.pc theoradec.pc'

. xbuild

_source_config(){
    # dont run configure on autogen
    sed -i 's/^cd \$olddir/exit 0;&/' autogen.sh
    ./autogen.sh
}

ac_config="--disable-doc --disable-spec --disable-examples --disable-oggtest --disable-vorbistest"

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/theora/theoraenc.h
# include/theora/theora.h
# include/theora/theoradec.h
# include/theora/codec.h
# lib/pkgconfig/theoraenc.pc
# lib/pkgconfig/theoradec.pc
# lib/pkgconfig/theora.pc
# lib/libtheoraenc.so
# lib/libtheora.la
# lib/libtheoradec.la
# lib/libtheora.so
# lib/libtheora.a
# lib/libtheoradec.a
# lib/libtheoraenc.a
# lib/libtheoraenc.la
# lib/libtheoradec.so
# share/doc/libtheora/color.html
# share/doc/libtheora/draft-ietf-avt-rtp-theora-00.txt
# share/doc/libtheora/draft-ietf-avt-rtp-theora-00.xml
# share/doc/libtheora/doxygen-build.stamp
# share/doc/libtheora/vp3-format.txt
# share/doc/theora/AUTHORS
# share/doc/theora/COPYING
