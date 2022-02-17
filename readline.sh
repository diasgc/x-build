#!/bin/bash
# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='readline'
dsc='The GNU Readline library'
lic='GLP-2.0'
src='https://git.savannah.gnu.org/git/readline.git'
cfg='ac'
mki='install'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

CFG="--disable-install-examples"

start

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
