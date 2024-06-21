#!/bin/bash

lib='libcares'
dsc='A C library for asynchronous DNS requests'
lic='MIT'
src='https://github.com/c-ares/c-ares.git'

cfg='ar'
cmake_config='-DCARES_STATIC_PIC=ON'
cmake_static='CARES_STATIC'
cmake_shared='CARES_SHARED'
cmake_bin='CARES_BUILD_TOOLS'

make_clean='distclean'
make_install='install-strip'

dev_bra='main'
dev_vrs='1.18.1'
pkg_deb='libc-ares2'
eta='10'

on_editpack(){
    $build_man || rm -rf share/man
}

lst_inc='ares_version.h ares.h ares_nameser.h ares_dns.h ares_rules.h ares_build.h'
lst_lib='libcares'
lst_bin=''
lst_lic='LICENSE.md AUTHORS'
lst_pc='libcares.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/ares_version.h
# include/ares.h
# include/ares_nameser.h
# include/ares_dns.h
# include/ares_rules.h
# include/ares_build.h
# lib/pkgconfig/libcares.pc
# lib/libcares.so
# lib/libcares.a
# lib/libcares.la
# share/doc/libcares/AUTHORS
# share/doc/libcares/LICENSE.md
