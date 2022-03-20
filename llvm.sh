#!/bin/bash

lib='llvm'
dsc='High quality encoder and decoder of the Audio Video Standard of China (AVS)'
lic='GPL-2.0'
src='https://github.com/llvm/llvm-project.git'
bra='fir-dev'
eta='30'

cfg="cmake"
cmake_shared='LIBCXX_ENABLE_SHARED'
cmake_static='LIBCXX_ENABLE_STATIC'
#cmake_config='-G Ninja -S runtimes -B build -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind"'

extraOpts(){
    case $1 in
        --llvm15)   bra='fir-dev';;
        --llvm14)   bra='release/14.x';;
        --llvm13)   bra='release/13.x';;
        --cxx)      runtimes+=(libcxx);;
        --cxxabi)   runtimes+=(libcxxabi);;
        --unwind)   runtimes+=(libunwind);;
    esac
}

dev_vrs=''
lst_inc=''
lst_lib=''
lst_bin=''
lst_lic=''
lst_pc=''

. xbuild

build_strip=false
MAKE_EXECUTABLE=ninja
dir_build="${dir_src}"
cmake_bdir="-G Ninja -S runtimes -B build_${arch}"
cmake_config="-DLLVM_ENABLE_RUNTIMES=$(str_concat ';' "${runtimes[@]}")"
mkf="-C build_${arch} $(echo "${runtimes[@]//lib/ }")"
mki="-C build_${arch} $(echo "${runtimes[@]//lib/install-}")"

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc