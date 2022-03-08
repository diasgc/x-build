#!/bin/bash

lib='simdjson'
dsc='Parsing gigabytes of JSON per second'
lic='Apache-2.0'
src='https://github.com/simdjson/simdjson.git'
cfg='cmake'
eta='0'

cmake_static='BUILD_STATIC_LIBS'

pc_llib='-lsimdjson'

dev_vrs='1.0.2'
lst_inc='simdjson.h'
lst_lib='libsimdjson'
lst_bin=''
lst_pc='simdjson.pc'
lst_lic='LICENSE AUTHORS README.md'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/simdjson.h
# lib/cmake/simdjson/simdjson-config-version.cmake
# lib/cmake/simdjson/simdjson-config.cmake
# lib/cmake/simdjson/simdjsonTargets-release.cmake
# lib/cmake/simdjson/simdjsonTargets.cmake
# lib/libsimdjson.a
# lib/libsimdjson.so
# lib/pkgconfig/libsimdjson.pc
# share/doc/simdjson/AUTHORS
# share/doc/simdjson/LICENSE
# share/doc/simdjson/README.md

<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJABMADEUcCQMyVWhFUBcJAbIwIwAcWLLJA7ABZO/EiVABqMWIBQE+RBgIUGb
HkKlytWvSZEArIyLssATjFCRYydJIyAAvdDAW+gDTsWk124OhHMqCBAMTOIMCgqMgAtgAmAFaoAPYAdqAANsgARgBO
0DkAnmEggTLA0LGxAPqZufkFABRRcYmpkTkAxgD0zQnJKVgdAA5DAJRyAGYArikd6MipDRXVtZETuBkpsOMSoKDLNd
l5hU0xfakAJADeqOsAvqDX6VsPqJ09Z60Dw2NycnuoeDoKrofIAcyBVSGOSSQ3gOXm8FQDX+ezRvS+11uuAeAAUAEo
AeVxAFF8QAVACSJIAyqi0aAAGpkmmUwkAOVAACJrqzIAARABSNI5VUQlIAQlVmfjWRy7lz6WiRTK5ZyeVc+UKReyxZ
KqiqWWz2QqlXtQgAxSkADUgJMYkQK0SySXSqEiAAsklN0rFQFl4KAPchKvA0lkirF4BNoD70GbQAB1Sns/mExM0qok
624wkUqoAQUQiANAE1IBLCYgaaBS7SE4SAKrk3HNqrsgt2yKffqonZh2LTWbzRY7OQHWoNLlc7lc8b7SqHOonDH9Ri
MVdtIuUgs1zcpHbICYNCWNymIfkGgASBfxJMv4olNYLqdAp/Pl5p5ILVPAeqfOx7BO2RTsAGDQPMHQzl+P6UuA/YpL
ER4NPOZSAsCoI5BCwLQrC8KIsiZQMvuoAEsSZJUvWERoqqxrcrylICsKoqPtKRryoq1F7Iasp0RqWrMbqrE8Wqppca
Alo2naDqoE6Lpup63q+v6gbBqG4aRtGsbpPG4nJqm6aZtmub5kWJY0uWlbVrWVGoRJoBWra9qgI2gKgLhcI5IocCBs
gKToPAYJ5COaQTEkXnwLgQzhZggTIZANKMuAoAvvyb5nhe163ve/40uMjjOOwRVuF4EjsKQHjiAEoADshdn7lU0AjO
kBRQjCQzIvuh7Hu+mUwb+uUpa+vWfjed4PpKeWog1TVDC1bWwp1PapGBoKQYBkRAg0fngek6RVOBkHdi0/SrRByAdA
hSHHnZoThBElIpLt6SgDkPpIsUwClAVwDlYIbj8JI7BUPwAP+PYgR2TtoJ7Si4nfviADiJLknuy0pEqCPI6jx3nGk1
zQ9Ae0HWtF13IEDLGXm5K4185LgkCqAU2i+KNuyVJduAhKQLm7IkuztP9FU+IzPM0TwMzeyPvit6lhA3O8/zNMNSL/
kxBLQA==
LZS_PATCH
