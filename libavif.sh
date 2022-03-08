#!/bin/bash

lib='libavif'
dsc='Library for encoding and decoding .avif files'
lic='BSD?'
src='https://github.com/AOMediaCodec/libavif.git'
cfg='cmake'
dep='libpng libjpeg libyuv aom'
eta='30'
cmake_bin='AVIF_BUILD_APPS'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='avif/avif.h'
lst_lib='libavif'
lst_bin='avifenc avifdec'
lst_lic='LICENSE README.md'
lst_pc='libavif.pc'
dev_vrs='0.9.3'

. xbuild

CFG="-DAVIF_ENABLE_WERROR=OFF -DAVIF_BUILD_EXAMPLES=OFF -DAVIF_BUILD_TESTS=OFF -DAVIF_CODEC_AOM=ON"
$host_mingw && CPPFLAGS+=" -D__USE_MINGW_ANSI_STDIO=1"
LDFLAGS+=" -lpthread"

start

# patch 01 on CMakeLists.txt to support dual static-shared build
<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJABMADEUcCQMyUDso5AXFVYwIxFZsBsVZArHxKgA1CXEkAUCJkQYCFBmx5Cp
cpRol6TACwlGJblgCcADj5FB40RKkABO6GA6ipgDREqol+76gHkqDIAGYAFAByAPIAKqAAggBqAJIAYgD64JEAIgCi
4GlxkZDx4VmgUbGJqRnZeWlZiWxlcaXlMfHJ6Zm5+YhJAEIA4o0AlIGgE6AAtvCoqNAA5vChAOpxAErhSeGDoABEAD
bIAEbQAG4hjOUA9qAAJvAAxtd3yAB2C6BHxwBO0D8ATyCqFA8De0GOB3gdywezGoLerzCY2AkmA0DudzS3z+gNC5xC
oAAJABvKrpADK63AFIAvijUPB0Gl0P8lsyAA4/a4c+A/dDIWb4i7BaTBACub0eAuub3xmOxJ1AqGCuC+b1gYxEk1AG
KxOP+AOFIVJKtwtOJJIOGotpPJaSpNPp0h1jOZrJ+7LSXJ5fIFQoJwVNqtp4x14YjEYACutIlGcutokkchSw5H0xmE
gmKUlIuFLX1+usNgBNNJZ9Y5vOhjO19MUyIVqv50mF4vrMsNpu58Kh4B1geTfLJHP9JJ9aJlmMpnKxAAWyExYJRHq9
zymHOQULSD2C72QMreqGNou1g4Hw6So/HSUnaWnFNnoAXS7eLvPdciAFVolGf2lwjiSAcl1EUtR1VcmTSddN23Xd90
PY9A2Dc00w/DMYySBI4miEC7U6e9EBwlJInWSB6hyFJtlvHs6Ute1ujqXIqK2JM8zpFc2Sgo4NUVX5/kFJCRXfCZIO
ZHjYD43FBJPFCa3Q6N1iwnC8LJAjGN6AZ22TOj8OqKMiOiEiyLSNsNh051gDEtJ3keA5xQeHdkB+J50GuH4ZMDETQG
s2z7Mc14XOldzPJFOS0IU6Mv36PpwGJAAefov3HLI0m2XD1hSOJwByRhSW+QMHW/akcnqJJ1lpAB6PyHPgAA+CLIrr
Il4u2ClojiRBEDS8IMqynLGBqh4GqajClOw3D6IIgziNI8jtnARAv1yXS1OqDSesW5aU2dEQwTuCUpUPUItT1PjQj2
PZ9jhQI3VCe0owAaUGGpwiol6cgADWiYsMhSIjBgpa74RCUIkpSh0AAkNhyVLCwpcDJlB8HEFS9qcKSTT+gR7ydTO7
4LuADBoAFR4rvRpNwERiM7sK4nSf2QMidZUmbrPCZ9tB+EIK45kYK3eAd3gPc3gPZBZSEwk/xizGOmqLIusa0ba0wi
aQPtFGsm2F6KWh9ZYdMgYcfDO6Hue173rSL6friP6AaBq7gAaAiFcQG6HCcbgSH4Nx6BEbgOF9/w7ECTnkUCQJQYqU
AKUepIox69GusNotzJTEoymj2P48Tjrk86xAUR1d5iYOA5Qg69ZBlnIGvPZoIj1ZMuK42avolrkVLTplnkEeeTIy+q
NSNiUkY0iAApPJogAoCclpYBnjePcFiV0B1i/XqkmA0AVqTQC2PzPZSSgOJHtKtq8+6sdSnK2k9lXjZwEhrCQN37YM
bzfZj8gU/z/CJPuqFi1hVe+QA=
LZS_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .   clang
# GNU  .   .   .  ++++ gcc
# WIN  .   .   .  +++F clang/gcc


# Filelist
# --------
#
# bin/avifdec
# bin/avifenc
# include/avif/avif.h
# lib/cmake/libavif/libavif-config-release.cmake
# lib/cmake/libavif/libavif-config-version.cmake
# lib/cmake/libavif/libavif-config.cmake
# lib/libavif.a
# lib/libavif.so
# lib/pkgconfig/libavif.pc
# share/doc/libavif/LICENSE
# share/doc/libavif/README.md
