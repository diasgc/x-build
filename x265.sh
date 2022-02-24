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

. xbuild

$build_shared && cmake_config="-DENABLE_SHARED=ON" || cmake_config="-DENABLE_SHARED=OFF"
$host_mingw && cmake_config+=" -DENABLE_PIC=OFF"
$host_arm && cmake_config+=" -DCROSS_COMPILE_ARM=ON -DENABLE_ASSEMBLY=OFF" || cmake_config+=" -DCMAKE_ASM_NASM_FLAGS=-w-macro-params-legacy"
$host_native && cmake_config+=' -DNATIVE_BUILD=ON'

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

start

# patch 01 on source/CMakeLists.txt to support arm mingw32 archs
# Do NOT edit---------------------------------------------------------------
<<'XB64_PATCH'
LS0tIHNvdXJjZS9DTWFrZUxpc3RzLnR4dAkyMDIyLTAyLTA5IDIzOjA1OjQ5LjUxODQwNTAwMCAr
MDAwMAorKysgc291cmNlL0NNYWtlTGlzdHMudHh0CTIwMjItMDItMDkgMjM6MTE6MDkuMjY4NDA1
MDAwICswMDAwCkBAIC0yMjgsOSArMjI4LDEwIEBACiAgICAgZWxzZSgpCiAgICAgICAgIGFkZF9k
ZWZpbml0aW9ucygtc3RkPWdudSsrOTgpCiAgICAgZW5kaWYoKQotICAgIGlmKEVOQUJMRV9QSUMp
CisgICAgaWYoTk9UIFdJTjMyIEFORCBFTkFCTEVfUElDKQogICAgICAgICAgYWRkX2RlZmluaXRp
b25zKC1mUElDKQotICAgIGVuZGlmKEVOQUJMRV9QSUMpCisgICAgICAgICBzZXQoZnBpYyAtZlBJ
QykKKyAgICBlbmRpZigpCiAgICAgaWYoTkFUSVZFX0JVSUxEKQogICAgICAgICBpZihJTlRFTF9D
WFgpCiAgICAgICAgICAgICBhZGRfZGVmaW5pdGlvbnMoLXhob3N0KQpAQCAtMjQ5LDE4ICsyNTAs
MTggQEAKICAgICBlbmRpZigpCiAgICAgaWYoQVJNIEFORCBDUk9TU19DT01QSUxFX0FSTSkKICAg
ICAgICAgbWVzc2FnZShTVEFUVVMgImNyb3NzIGNvbXBpbGUgYXJtIikKLQkJc2V0KEFSTV9BUkdT
IC1tYXJjaD1hcm12NiAtbWZsb2F0LWFiaT1zb2Z0IC1tZnB1PXZmcCAtbWFybSAtZlBJQykKKwkJ
c2V0KEFSTV9BUkdTIC1tYXJjaD1hcm12NiAtbWZsb2F0LWFiaT1zb2Z0IC1tZnB1PXZmcCAtbWFy
bSAke2ZwaWN9KQogICAgIGVsc2VpZihBUk0pCiAgICAgICAgIGZpbmRfcGFja2FnZShOZW9uKQog
ICAgICAgICBpZihDUFVfSEFTX05FT04pCi0gICAgICAgICAgICBzZXQoQVJNX0FSR1MgLW1jcHU9
bmF0aXZlIC1tZmxvYXQtYWJpPWhhcmQgLW1mcHU9bmVvbiAtbWFybSAtZlBJQykKKyAgICAgICAg
ICAgIHNldChBUk1fQVJHUyAtbWNwdT1uYXRpdmUgLW1mbG9hdC1hYmk9aGFyZCAtbWZwdT1uZW9u
IC1tYXJtICR7ZnBpY30pCiAgICAgICAgICAgICBhZGRfZGVmaW5pdGlvbnMoLURIQVZFX05FT04p
CiAgICAgICAgIGVsc2UoKQogICAgICAgICAgICAgc2V0KEFSTV9BUkdTIC1tY3B1PW5hdGl2ZSAt
bWZsb2F0LWFiaT1oYXJkIC1tZnB1PXZmcCAtbWFybSkKICAgICAgICAgZW5kaWYoKQogICAgIGVu
ZGlmKCkKIAlpZihBUk02NCBPUiBDUk9TU19DT01QSUxFX0FSTTY0KQotCSAgICBzZXQoQVJNX0FS
R1MgLWZQSUMgLWZsYXgtdmVjdG9yLWNvbnZlcnNpb25zKQorCSAgICBzZXQoQVJNX0FSR1MgJHtm
cGljfSAtZmxheC12ZWN0b3ItY29udmVyc2lvbnMpCiAgICAgICAgIGZpbmRfcGFja2FnZShOZW9u
KQogICAgICAgICBpZihDUFVfSEFTX05FT04pCiAgICAgICAgICAgICBhZGRfZGVmaW5pdGlvbnMo
LURIQVZFX05FT04pCgotLS0gc291cmNlL2VuY29kZXIvQ01ha2VMaXN0cy50eHQJMjAyMi0wMi0y
MyAwMTowNDo0Ny41NDMxODI4MDAgKzAwMDAKKysrIHNvdXJjZS9lbmNvZGVyL0NNYWtlTGlzdHMu
dHh0CTIwMjItMDItMjMgMDE6MDM6MzYuMTIzMTgyODAwICswMDAwCkBAIC0xMCw3ICsxMCw3IEBA
CiBpZihNU1ZDKQogICAgYWRkX2RlZmluaXRpb25zKC93ZDQ3MDEpICMgcG90ZW50aWFsbHkgdW5p
bml0aWFsaXplZCBsb2NhbCB2YXJpYWJsZSAnZm9vJyB1c2VkCiBlbmRpZigpCi0KK2FkZF9kZWZp
bml0aW9ucygtV25vLWFic29sdXRlLXZhbHVlIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUg
LVduby1zaGFkb3cpCiBpZihFWFRSQV9MSUIpCiAgICAgaWYoTElOS0VEXzhCSVQpCiAgICAgICAg
IGxpc3QoQVBQRU5EIEFQSUZMQUdTICItRExJTktFRF84QklUPTEiKQo=
XB64_PATCH

# Filelist
# --------
# include/x265.h
# include/x265_config.h
# lib/pkgconfig/x265.pc
# lib/libx265.so
# lib/libx265.a
# share/doc/x265/COPYING
# bin/x265
