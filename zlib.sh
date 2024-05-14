#!/bin/bash
# cpu av8 av7 x86 x64
# NDK SYS------------ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='zlib'
apt='zlib1g'
dsc='zlib compression library'
lic='Zlib'
src='https://github.com/madler/zlib.git'
cfg='cmake'
eta='22'
cmake_bin="ZLIB_BUILD_EXAMPLES"

dev_vrs='1.3.1.1'

lst_inc='zlib.h zconf.h'
lst_lib='libz'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='zlib.pc'

compiler_config(){
    $host_gnu && $host_arm && use_clang=false
}

. xbuild


on_end(){
    $host_mingw && {
        ln -s ${dir_install_lib}/libzlib.dll.a ${dir_install_lib}/libz.a 2>/dev/null
        ln -s ${dir_install_lib}/libzlibstatic.a ${dir_install_lib}/libzstatic.a 2>/dev/null
    }
    return 0
}

if $host_ndk;then
    pc_libdir="/lib/${arch}"
    create_pkgconfig_file zlib '-lz' "${SYSROOT}/usr"
else
    start
fi

# Filelist
# --------
# include/zlib.h
# include/zconf.h
# lib/pkgconfig/zlib.pc
# lib/libz.a
# lib/libz.so.1.2.11
# share/man/man3/zlib.3
