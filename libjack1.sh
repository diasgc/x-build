#!/bin/bash

lib='libjack'
pkg_deb="${lib}-dev"
dsc='Jack Audio Connection Kit: a low-latency synchronous callback-based media server'
lic='GPL-2.0'
src='https://github.com/jackaudio/jack1.git'
cfg='ag'
eta='30'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc