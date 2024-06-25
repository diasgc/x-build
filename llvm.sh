#!/bin/bash

lib='llvm'
dsc='Low-Level Virtual Machine (LLVM)'
lic='GPL-2.0'
src='https://github.com/llvm/llvm-project.git'

cfg="cmake"
cmake_shared='LIBCXX_ENABLE_SHARED'
cmake_static='LIBCXX_ENABLE_STATIC'
cmake_config='-DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_DOCS=OFF'
build_strip=false
MAKE_EXECUTABLE=ninja

dev_bra='main'
dev_vrs='18.1.7'
pkg_deb='llvm-dev'
eta='30'

extra_options(){
    case "${1}" in
        --15)     bra='fir-dev';;
        --14)     bra='release/14.x';;
        --13)     bra='release/13.x';;
        --cxx)    runtimes+=(libcxx);;
        --cxxabi) runtimes+=(libcxxabi);;
        --unwind) runtimes+=(libunwind);;
        --crt)    runtimes+=(compiler-rt);;
        --openmp) runtimes+=(openmp);;
        --all)    runtimes=(all);;
    esac
}

#pc_llib=void

on_config(){
    dir_build="${dir_src}"
    cmake_builddir="-G Ninja -S runtimes -B build_${arch}"
    cmake_config+=" -DLLVM_ENABLE_RUNTIMES=$(str_concat ';' "${runtimes[@]}")"
    make_args="-C build_${arch} $(echo "${runtimes[@]//lib/ }")"
    make_install="-C build_${arch} $(echo "${runtimes[@]//lib/install-}")"
}

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic=''
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc