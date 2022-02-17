#!/bin/bash

lib='file-signature'
dsc='Check file format'
lic='MIT'
src='https://github.com/jinhr9801/filename-extension-signature.git'
cfg='cmake'
eta='30'
skip_pc=true

# cpu av8 av7 x86 x64
# NDK --+  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .  --+ clang/gcc

# Filelist
# --------
# include/ff_file_formats.h
# bin/file-signature
