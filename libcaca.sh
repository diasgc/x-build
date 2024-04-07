#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .   clang
# GNU  F   .   .   F   gcc
# WIN  .   .   .   F   clang/gcc

lib='libcaca'
dsc='Colour AsCii Art library'
lic='GPL'
src='https://github.com/cacalabs/libcaca.git'
cfg='ac'
pkg='caca'
eta='80'

ac_config='--disable-doc --disable-java --disable-python --disable-ruby'

dev_bra='main'
dev_vrs='0.99.beta20'
stb_bra='tags/v0.99.beta20'
stb_vrs='v0.99.beta20'

lst_inc='caca++.h caca.h caca0.h caca_types.h caca_conio.h'
lst_lib='libcaca libcaca++'
lst_bin='caca-config cacafire cacaserver img2txt cacaclock cacademo cacaview cacaplay'
lst_lic='COPYING COPYING.GPL COPYING.LGPL COPYING.ISC AUTHORS'
lst_pc='caca++.pc caca.pc'

. xbuild

$host_mingw || ac_config+=" --disable-win32"

source_config(){
  sed -i 's/^AC_PREREQ/# &/' configure.ac
  ./bootstrap
  sed -i 's/if defined _WIN32/if defined _MSC_VER/g' caca/caca.h \
    caca/caca0.h caca/caca0.h caca/figfont.c \
    caca/string.c
  sed -i 's/if defined(_WIN32)/if defined(_MSC_VER)/g' cxx/caca++.h
  $use_clang && sed -i 's/-O2 -fno-strength-reduce/-O3 -flto/g' configure
}

#CFLAGS+=" -Wno-ignored-optimization-argument -Wno-absolute-value -Wno-unused-but-set-variable -Wno-int-conversion"

start

# Filelist
# --------
# include/caca++.h
# include/caca.h
# include/caca0.h
# include/caca_types.h
# include/caca_conio.h
# lib/pkgconfig/caca++.pc
# lib/pkgconfig/caca.pc
# lib/libcaca.so
# lib/libcaca++.so
# lib/libcaca++.la
# lib/libcaca.a
# lib/libcaca.la
# lib/libcaca++.a
# share/man/man1/img2txt.1
# share/man/man1/cacaserver.1
# share/man/man1/cacaview.1
# share/man/man1/cacafire.1
# share/man/man1/caca-config.1
# share/man/man1/cacaplay.1
# share/libcaca/caca.txt
# bin/caca-config
# bin/cacafire
# bin/cacaserver
# bin/img2txt
# bin/cacaclock
# bin/cacademo
# bin/cacaview
# bin/cacaplay