#!/bin/bash

lib='skcms'
dsc='PNG encoder and decoder in C and C++'
lic='BSD-3c'
src='https://skia.googlesource.com/skcms.git'
tls='bazel-bootstrap'

cfg='bazel'
bazel_config='--platforms=//platform:android_arm64'

dev_bra=''
dev_vrs=''
pkg_deb=''
eta='10'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ... ... ... ... CLANG
# GNU ... ... ... ... GCC
# WIN ... ... ... ... CLANG/GCC