#!/bin/bash

lib='zix'
pkg='zix-0'
dsc='A lightweight C library of portability wrappers and data structures'
lic='ISC License'
src="https://github.com/drobilla/zix.git"

cfg='meson'
meson_cfg='-Dbenchmarks=disabled -Ddocs=disabled -Dhtml=disabled -Dtests=disabled -Dtests_cpp=disabled' 

dev_bra='master'
dev_vrs='0.4.2'
pkg_deb='libzix-dev'
eta='64'

lst_inc=' zix/allocator.h zix/attributes.h 
 zix/btree.h zix/bump_allocator.h zix/digest.h
 zix/filesystem.h zix/hash.h zix/path.h zix/ring.h
 zix/sem.h zix/status.h zix/string_view.h
 zix/thread.h zix/tree.h zix/zix.h'
lst_lib='libzix-0'
lst_bin=''
lst_lic=''
lst_pc='zix-0.pc'

#$host_ndk   && meson_cfg+=' -Dthreads=disabled' || meson_cfg+=' -Dthreads=enabled'
#$host_mingw && meson_cfg+=' -Dposix=disabled'   || meson_cfg+=' -Dposix=enabled'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
