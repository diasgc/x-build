#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# NDK: missing gnulib argp

lib='libavc1394'
dsc='libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set.'
lic='GNU Lesser General Public License v2.1'
src="https://svn.code.sf.net/p/libavc1394/code/trunk/libavc1394"
dep='libraw1394'

cfg='ar' # consider create cmake build

dev_bra='master'
dev_vrs=''
pkg_deb='libavc1394-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

on_config(){
    CPPFLAGS+=" -I${dir_root}/sources/gnulib/native/argp/gllib"
    LDFLAGS+=" -L${dir_root}/sources/gnulib/native/argp/gllib -lgnu"
}

. xbuild && start