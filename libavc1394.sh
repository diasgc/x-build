#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# NDK: configure: error: argp not found. Consider installing argp-standalone

lib='libavc1394'
dsc='libavc1394 is a programming interface for the 1394 Trade Association AV/C (Audio/Video Control) Digital Interface Command Set.'
lic='GNU Lesser General Public License v2.1'
src="https://svn.code.sf.net/p/libavc1394/code/trunk/libavc1394"
cfg='ab'
eta='0'
dep='libraw1394'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

start