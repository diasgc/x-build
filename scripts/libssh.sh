#!/bin/bash
# cpu av8 av7 x86 x64
# NDK PP+  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libssh'
dsc='The SSH library'
lic='GLP-2.0'
src='https://git.libssh.org/projects/libssh.git'
bra='stable-0.9'
cfg='cmake'
eta='170'

cfg_static='BUILD_STATIC_LIB'
#cfg_shared=''
#cfg_bin=''

dev_bra='master'
dev_vrs=''
stb_bra='stable-0.9'
stb_vrs='0.9'

lst_inc='libssh/*.h libssh/*.hpp'
lst_lib='libssh'  
lst_bin=''
lst_lic='COPYING BSD AUTHORS'
lst_pc='libssh.pc'

. xbuilder.sh

start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/libssh/sftp.h
# include/libssh/libssh_version.h
# include/libssh/server.h
# include/libssh/libssh.h
# include/libssh/ssh2.h
# include/libssh/legacy.h
# include/libssh/callbacks.h
# include/libssh/libsshpp.hpp
# lib/pkgconfig/libssh.pc
# lib/cmake/libssh/libssh-config-release.cmake
# lib/cmake/libssh/libssh-config.cmake
# lib/cmake/libssh/libssh-config-version.cmake
# lib/libssh.so
# share/doc/libssh/BSD
# share/doc/libssh/AUTHORS
# share/doc/libssh/COPYING
