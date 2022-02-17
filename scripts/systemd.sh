#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   ... ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='systemd'
apt='systemd-dev'
dsc='The systemd System and Service Manager'
lic='GPL-2.0'
src='https://github.com/systemd/systemd.git'
cfg='meson'
#dep='crypt'
eta='60'

lst_inc=''
lst_lib=''

. xbuilder.sh

CFG="-Drootprefix=${ROOTDIR}/builds"

start