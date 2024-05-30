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
cfg='cmake'
patch="x265-01"
tls='yasm libnuma-dev'
eta='130'
cmake_bin="ENABLE_CLI"
config_dir='source'
cshk='ENABLE_SHARED'

lst_inc='x265.h x265_config.h'
lst_lib='libx265'
lst_bin='x265'
lst_lic='COPYING source/dynamicHDR10/LICENSE.txt'
lst_pc='x265.pc'

dev_bra='master'
dev_vrs='3.5'
stb_bra='stable'
stb_vrs='3.5'
multilib=false
WFLAGS='-Wno-absolute-value -Wno-unused-but-set-variable -Wno-shadow'

extraOpts(){
    case $1 in
        --multilib) multilib=true; eta=810;;
        --12bit) cmake_config='-DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF -DMAIN12=ON';;
        --10bit) cmake_config='-DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF';;
    esac
    return 0
}

on_config(){
    $build_shared && cmake_config="-DENABLE_SHARED=ON" || cmake_config="-DENABLE_SHARED=OFF"
    $host_mingw && cmake_config+=" -DENABLE_PIC=OFF"
    $host_arm && cmake_config+=" -DCROSS_COMPILE_ARM=ON -DENABLE_ASSEMBLY=OFF" || cmake_config+=" -DCMAKE_ASM_NASM_FLAGS=-w-macro-params-legacy"
    $host_native && cmake_config+=' -DNATIVE_BUILD=ON'
}

build_config(){
    cd ${dir_build}
    [ -z "${cmake_toolchain_file}" ] && cmake_create_toolchain ${dir_build}
    [ -f "${cmake_toolchain_file}" ] && cmake_config+=" -DCMAKE_TOOLCHAIN_FILE=${cmake_toolchain_file} $CFG -DCMAKE_INSTALL_PREFIX=${dir_install} -DCMAKE_BUILD_TYPE=${cmake_build_type} -DSTATIC_LINK_CRT=ON"
    if $multilib; then
        mkdir -p 10bit 12bit
        cd 12bit
        do_log '12bit' cmake ../../../source $cmake_config -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF -DMAIN12=ON
        do_progress 'make' make ${mkf} -j${HOST_NPROC}
        cd ../10bit
        do_log '10bit' cmake ../../../source $cmake_config -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF
        do_progress 'make' make ${mkf} -j${HOST_NPROC}
        cd ..
        ln -sf 10bit/libx265.a libx265_main10.a
        ln -sf 12bit/libx265.a libx265_main12.a
        do_log '8bit' cmake ../../source $cmake_config -DEXTRA_LIB="x265_main10.a;x265_main12.a" -DEXTRA_LINK_FLAGS=-L. -DLINKED_10BIT=ON -DLINKED_12BIT=ON $CSH $CBN
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
