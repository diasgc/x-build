#!/bin/bash

lib='density'
dsc='Small & portable byte-aligned LZ77 compression'
lic='BSD-3c'
#vrs='0.14.2'
src='https://github.com/k0dai/density.git'
cfg='cmake'
eta='30'
pc_llib='-ldensity'
pc_url='https://github.com/k0dai/density'

dev_bra='main'
dev_vrs='density-0.14.2'
stb_bra=''
stb_vrs=''

lst_inc='density/*.h'
lst_lib='libdensity'
lst_bin='benchmark'
lst_lic='LICENSE.md'
lst_pc='density.pc'

cmake_static='BUILD_STATIC_LIBS'
cmake_config="-DBUILD_BENCHMARK=ON"

. xbuilder.sh

source_config(){
  git submodule update --init --recursive
}

start

# patch 01: create CMakeLists with dual static shared build support
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjItMDEtMzEgMjE6MjM6MzYuNzAyMjQ1ODAwICswMDAwCisrKyBDTWFrZUxpc3
RzLnR4dAkyMDIyLTAxLTMxIDIxOjIyOjI4LjA0MjI0NTgwMCArMDAwMApAQCAtMCwwICsxLDQxIEBACitjbWFrZV9t
aW5pbXVtX3JlcXVpcmVkKFZFUlNJT04gMy4xMCkKKworcHJvamVjdChkZW5zaXR5IEMpCisKK29wdGlvbihCVUlMRF
9TVEFUSUNfTElCUyAiQnVpbGQgc3RhdGljIGxpYnMiIE9OKQorb3B0aW9uKEJVSUxEX0JFTkNITUFSSyAiQnVpbGQg
YmVuY2htYXJrIiBPRkYpCisKK2FkZF9jb21waWxlX29wdGlvbnMoIi1Xbm8tZm9ybWF0IikKKworZmlsZShHTE9CX1
JFQ1VSU0UgU1JDIHNyYy8qLmMpCitmaWxlKEdMT0JfUkVDVVJTRSBIRFIgc3JjLyouaCkKKworc2V0KGRlbnNpdHlf
dGFyZ2V0cyBkZW5zaXR5KQorYWRkX2xpYnJhcnkoZGVuc2l0eSAke1NSQ30pCisKK2lmKEJVSUxEX1NIQVJFRF9MSU
JTIEFORCBCVUlMRF9TVEFUSUNfTElCUykKKyAgYWRkX2xpYnJhcnkoZGVuc2l0eV9zdGF0aWMgU1RBVElDICR7U1JD
fSkKKyAgc2V0X3RhcmdldF9wcm9wZXJ0aWVzKGRlbnNpdHlfc3RhdGljIFBST1BFUlRJRVMgT1VUUFVUX05BTUUgZG
Vuc2l0eSkKKyAgbGlzdChBUFBFTkQgZGVuc2l0eV90YXJnZXRzIGRlbnNpdHlfc3RhdGljKQorZW5kaWYoKQorCitp
ZihCVUlMRF9CRU5DSE1BUkspCisgIGZpbGUoR0xPQl9SRUNVUlNFIHNyY19jcHV0aW1lIGJlbmNobWFyay9saWJzL2
NwdXRpbWUvc3JjLyouYykKKyAgYWRkX2xpYnJhcnkoY3B1dGltZSBTVEFUSUMgJHtzcmNfY3B1dGltZX0pCisgIGZp
bGUoR0xPQl9SRUNVUlNFIHNyY19zcG9va3loYXNoIGJlbmNobWFyay9saWJzL3Nwb29reWhhc2gvc3JjLyouYykKKy
AgYWRkX2xpYnJhcnkoc3Bvb2t5aGFzaCBTVEFUSUMgJHtzcmNfc3Bvb2t5aGFzaH0pCisgIGFkZF9leGVjdXRhYmxl
KGJlbmNobWFyayBiZW5jaG1hcmsvc3JjL2JlbmNobWFyay5jKQorICB0YXJnZXRfbGlua19saWJyYXJpZXMoYmVuY2
htYXJrIGRlbnNpdHkgY3B1dGltZSBzcG9va3loYXNoKQorZW5kaWYoKQorCitpbnN0YWxsKFRBUkdFVFMgJHtkZW5z
aXR5X3RhcmdldHN9CisgIFJVTlRJTUUgREVTVElOQVRJT04gYmluCisgIEFSQ0hJVkUgREVTVElOQVRJT04gbGliJH
tMSUJfU1VGRklYfQorICBMSUJSQVJZIERFU1RJTkFUSU9OIGxpYiR7TElCX1NVRkZJWH0pCisKK2luc3RhbGwoRklM
RVMgJHtIRFJ9IERFU1RJTkFUSU9OIGluY2x1ZGUvZGVuc2l0eSkKKworaWYoQlVJTERfQkVOQ0hNQVJLKQorICBpbn
N0YWxsKFRBUkdFVFMgYmVuY2htYXJrIFJVTlRJTUUgREVTVElOQVRJT04gYmluKQorZW5kaWYoKQorCg==
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++ .   .  clang
# GNU +++ +++ .  +++ gcc
# WIN +++ .   .  +++ clang/gcc



# Filelist
# --------
# include/density/lion_encode.h
# include/density/globals.h
# include/density/algorithms.h
# include/density/buffer.h
# include/density/dictionaries.h
# include/density/lion_decode.h
# include/density/cheetah_encode.h
# include/density/lion.h
# include/density/lion_form_model.h
# include/density/chameleon_dictionary.h
# include/density/chameleon_encode.h
# include/density/cheetah.h
# include/density/cheetah_decode.h
# include/density/cheetah_dictionary.h
# include/density/lion_dictionary.h
# include/density/header.h
# include/density/chameleon_decode.h
# include/density/chameleon.h
# include/density/density_api.h
# lib/pkgconfig/density.pc
# lib/libdensity.a
# lib/libdensity.so
# share/doc/density/LICENSE.md
# bin/benchmark
