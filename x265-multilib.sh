#!/bin/bash

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .  +++ clang/gcc

lib='x265'
dsc='x265 is an open source HEVC encoder'
lic='GPL-2.0'
#src='https://github.com/videolan/x265.git'
src='https://bitbucket.org/multicoreware/x265_git.git'
src_latest=false
cfg='cmake'
#patch="x265-01"
tls='yasm libnuma-dev'
eta='130'
cmake_bin="ENABLE_CLI"
cmake_shared='-DENABLE_SHARED=ON'
cmake_static='-DENABLE_SHARED=OFF'
cmake_config_10bit='-DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF'
cmake_config_12bit="${cmake_config_10bit} -DMAIN12=ON"
config_dir='source'

lst_inc='x265.h x265_config.h'
lst_lib='libx265'
lst_bin='x265'
lst_lic='COPYING source/dynamicHDR10/LICENSE.txt'
lst_pc='x265.pc'

dev_bra='master'
dev_vrs='3.6'
multilib=false
WFLAGS='-Wno-absolute-value -Wno-unused-but-set-variable -Wno-shadow'

extraOpts(){
    case $1 in
        --multilib) multilib=true; eta=60;;
        --12bit) cmake_config="${cmake_config_12bit}";;
        --10bit) cmake_config="${cmake_config_10bit}";;
    esac
    return 0
}

on_config(){
    $host_mingw && cmake_config+=" -DENABLE_PIC=OFF"
    $host_arm && cmake_config+=" -DCROSS_COMPILE_ARM=ON -DENABLE_ASSEMBLY=OFF" || cmake_config+=" -DCMAKE_ASM_NASM_FLAGS=-w-macro-params-legacy"
    $host_native && cmake_config+=' -DNATIVE_BUILD=ON'
}

build_nbit(){
    local n="${1}"
    local v="cmake_config_${n}bit"
    mkdir -p "${dir_build}/${n}bit" && cd "${dir_build}/${n}bit"
    do_log "${n}bit" cmake ../../../source ${cmake_config} ${!v} -Wno-dev
    do_progress 'make' make ${mkf} -j${HOST_NPROC}
    ln -sf libx265.a "${dir_build}/libx265_main${n}.a"
    cd "${dir_build}"
}

build_config(){
    cd ${dir_build}
    [ -z "${cmake_toolchain_file}" ] && cmake_create_toolchain ${dir_build}
    [ -f "${cmake_toolchain_file}" ] && cmake_config+=" -DCMAKE_TOOLCHAIN_FILE=${cmake_toolchain_file} $CFG -DCMAKE_INSTALL_PREFIX=${dir_install} -DCMAKE_BUILD_TYPE=${cmake_build_type} -DSTATIC_LINK_CRT=ON"
    if $multilib; then
        build_nbit 12
        build_nbit 10
        do_log '8bit' cmake ../../source $cmake_config -DEXTRA_LIB="x265_main10.a;x265_main12.a" -DEXTRA_LINK_FLAGS=-L. -DLINKED_10BIT=ON -DLINKED_12BIT=ON ${CSH} ${CBN} -Wno-dev
        do_progress 'make' make ${mkf} -j${HOST_NPROC}
        mv libx265.a libx265_main.a
        ${AR} -M <<-EOF
            CREATE libx265.a
            ADDLIB libx265_main.a
            ADDLIB libx265_main10.a
            ADDLIB libx265_main12.a
            SAVE
            END
			EOF
        skip_make=true
    else
        do_log 'cmake' cmake ${dir_config} ${cmake_config} ${CSH} ${CBN}
        case $cfg in ccm|ccmake) tput sc; ccmake ..; tput rc;; esac
    fi
    
}

. xbuild && start

# Filelist
# --------
# include/x265.h
# include/x265_config.h
# lib/pkgconfig/x265.pc
# lib/libx265.so
# lib/libx265.a
# share/doc/x265/COPYING
# bin/x265
