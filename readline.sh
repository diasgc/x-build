#!/bin/bash

lib='readline'
dsc='The GNU Readline library'
lic='GLP-2.0'
src='https://git.savannah.gnu.org/git/readline.git'

cfg='ac'
am_config="--disable-install-examples"

dev_bra=''
dev_vrs=''
pkg_deb='libreadline-dev'
eta='0'

lst_inc='readline/rltypedefs.h
 readline/rlstdc.h
 readline/history.h
 readline/keymaps.h
 readline/rlconf.h
 readline/chardefs.h
 readline/readline.h
 readline/tilde.h'
lst_lib='libhistory libreadline'
lst_bin='readline.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/readline/rltypedefs.h
# include/readline/rlstdc.h
# include/readline/history.h
# include/readline/keymaps.h
# include/readline/rlconf.h
# include/readline/chardefs.h
# include/readline/readline.h
# include/readline/tilde.h
# lib/pkgconfig/readline.pc
# lib/libhistory.a
# lib/libreadline.so.8.1
# lib/libhistory.so.8.1
# lib/libreadline.a
# share/man/man3/history.3
# share/man/man3/readline.3
# share/doc/readline/INSTALL
# share/doc/readline/README
# share/doc/readline/CHANGES
# share/info/history.info
# share/info/readline.info
# share/info/dir
# share/info/rluserman.info
