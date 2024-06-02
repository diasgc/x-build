#!/bin/bash

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .  +++ clang/gcc

lib='x265'
dsc='x265 is an open source HEVC encoder'
lic='GPL-2.0'
tls='yasm libnuma-dev'
src='https://bitbucket.org/multicoreware/x265_git.git' # mirror at 'https://github.com/videolan/x265.git'
src_latest=false
config_dir='source'

cfg='cmake'
cmake_config_10bit='-DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF'
cmake_config_12bit="${cmake_config_10bit} -DMAIN12=ON"
multilib=false

lst_inc='x265.h x265_config.h'
lst_lib='libx265'
lst_bin='x265'
lst_lic='COPYING source/dynamicHDR10/LICENSE.txt'
lst_pc='x265.pc'

#patch="x265-01"
dev_bra='master'
dev_vrs='3.6'
eta='130'

# keeping the log clean
cmake_add_compile_options=( 
    -Wno-absolute-value 
    -Wno-unused-but-set-variable 
    -Wno-shadow 
    -Wno-unused-parameter 
    -Wno-unused-variable 
    -Wno-bitwise-instead-of-logical
)

extraOpts(){
    case $1 in
        --multilib) multilib=true; eta=810;;
        --12bit) cmake_config="${cmake_config_12bit}";;
        --10bit) cmake_config="${cmake_config_10bit}";;
    esac
    return 0
}

set_x265_releasefile(){
    vrs="$(curl -s 'http://ftp.videolan.org/pub/videolan/x265/' | grep -oP 'x265_[0-9\.]+.tar.gz' | tail -n1)"
    src="http://ftp.videolan.org/pub/videolan/x265/${vrs}"
    vrs="$(sed 's/x265_//;s/\.tar\.gz//' <<<"${vrs}")"
}

on_config(){
    ${src_latest} && set_x265_releasefile
    if ${host_mingw}; then
        cmake_add_compile_options+=( -Wno-sign-compare )
        cmake_config+=" -DENABLE_PIC=OFF"
    else
        dep='libnuma'
    fi
    if ${host_arm}; then
        cmake_config+=" -DCROSS_COMPILE_ARM=ON -DENABLE_ASSEMBLY=OFF"
    else
        cmake_config+=" -DCMAKE_ASM_NASM_FLAGS=-w-macro-params-legacy"
    fi
    
    $host_native && cmake_config+=' -DNATIVE_BUILD=ON'
}

build_nbit(){
    local n="${1}" && shift
    mkdir -p "${n}bit" && cd "${n}bit"
    do_log "${n}bit" cmake ../../../source ${cmake_config} $@ -Wno-dev
    do_progress 'make' make -j${HOST_NPROC}
    cd ..
    ln -sf "${n}bit/libx265.a" "libx265_main${n}.a"
}

build_config(){
    
    local link="-DENABLE_SHARED=$(bool2str ${build_shared} ON OFF)"
    local bin="-DENABLE_CLI=$(bool2str ${build_bin} ON OFF)"
    cd ${dir_build}
    cmake_create_toolchain ${dir_build}
    cmake_config+=" -DCMAKE_TOOLCHAIN_FILE=${cmake_toolchain_file} -DCMAKE_INSTALL_PREFIX=${dir_install} -DCMAKE_BUILD_TYPE=${cmake_build_type} -DSTATIC_LINK_CRT=ON"
    if ${multilib}; then
        build_nbit 12 ${cmake_config_12bit}
        build_nbit 10 ${cmake_config_10bit}
        do_log '8bit' cmake ../../source ${cmake_config} -DEXTRA_LIB="x265_main10.a;x265_main12.a" -DEXTRA_LINK_FLAGS=-L. -DLINKED_10BIT=ON -DLINKED_12BIT=ON ${link} ${bin} -Wno-dev
        do_progress 'make' make -j${HOST_NPROC}
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
        do_log 'cmake' cmake ${dir_config} ${cmake_config} ${link} ${bin} -Wno-dev
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
