#!/bin/bash
# cpu av8 av7 x86 x64
# NDK PP+  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='sndfile'
apt='libsndfile1'
dsc='A library for reading and writing audio files'
lic='LGPL-3.0'
src='https://github.com/libsndfile/libsndfile.git'
cfg='ag'
tls='python'
dep='ogg vorbis opus flac speex sqlite3 lame'
eta='78'
mki='install'

cmake_static=''
cmake_bin='BUILD_PROGRAMS'
cmake_config="-DENABLE_PACKAGE_CONFIG=ON -DBUILD_TESTING=OFF -DINSTALL_MANPAGES=OFF"

ac_nosysroot=true

dev_bra='main'
dev_vrs='1.1.0beta2'
stb_bra='tags/v1.0.30'
stb_vrs='1.0.30'

lst_inc='sndfile.h sndfile.hh'
lst_lib='libsndfile'
lst_bin='sndfile-convert
	sndfile-play
	sndfile-deinterleave
	sndfile-interleave
	sndfile-cmp
	sndfile-concat
	sndfile-info
	sndfile-metadata-set
	sndfile-metadata-get
	sndfile-salvage'
lst_lic='COPYING AUTHORS'
lst_pc='sndfile.pc'

. xbuilder.sh

before_make(){
	$host_clang && sed -i 's/-Wno-format-truncation//g' Makefile
}

start

# Filelist
# --------
# include/sndfile.h
# include/sndfile.hh
# lib/pkgconfig/sndfile.pc
# lib/libsndfile.so
# lib/libsndfile.a
# lib/libsndfile.la
# share/man/man1/sndfile-cmp.1
# share/man/man1/sndfile-convert.1
# share/man/man1/sndfile-play.1
# share/man/man1/sndfile-salvage.1
# share/man/man1/sndfile-interleave.1
# share/man/man1/sndfile-concat.1
# share/man/man1/sndfile-metadata-set.1
# share/man/man1/sndfile-metadata-get.1
# share/man/man1/sndfile-info.1
# share/man/man1/sndfile-deinterleave.1
# share/doc/sndfile/AUTHORS
# share/doc/sndfile/COPYING
# share/doc/libsndfile/bugs.md
# share/doc/libsndfile/new_file_type_howto.md
# share/doc/libsndfile/formats.md
# share/doc/libsndfile/embedded_files.md
# share/doc/libsndfile/command.md
# share/doc/libsndfile/sndfile_info.md
# share/doc/libsndfile/api.md
# share/doc/libsndfile/libsndfile.jpg
# share/doc/libsndfile/win32.md
# share/doc/libsndfile/lists.md
# share/doc/libsndfile/FAQ.md
# share/doc/libsndfile/index.md
# share/doc/libsndfile/octave.md
# share/doc/libsndfile/libsndfile.css
# share/doc/libsndfile/print.css
# share/doc/libsndfile/tutorial.md
# bin/sndfile-convert
# bin/sndfile-play
# bin/sndfile-deinterleave
# bin/sndfile-interleave
# bin/sndfile-cmp
# bin/sndfile-concat
# bin/sndfile-info
# bin/sndfile-metadata-set
# bin/sndfile-metadata-get
# bin/sndfile-salvage
