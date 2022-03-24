#!/bin/bash

lib='vo-amrwbenc'
apt='libvo-amrwbenc-dev'
dsc='VisualOn Adaptive Multi-Rate Wideband speech codec library'
lic='Apache-2.0'
src='https://github.com/mstorsjo/vo-amrwbenc.git'
cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='EXAMPLE'

ac_bin='--disable-example|--enable-example'
ac_config='--disable-maintainer-mode'

lst_inc='vo-amrwbenc/enc_if.h'
lst_lib='libvo-amrwbenc'
lst_bin='amrwb-enc'
lst_lic='COPYING NOTICE'
lst_pc='vo-amrwbenc.pc'

dev_vrs='0.1.3'

eta='17'

. xbuild

[ "$arch" == "arm-linux-androideabi" ] && ac_config+=" --enable-armv7neon=yes"

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++  .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# Filelist
# --------
# include/vo-amrwbenc/enc_if.h
# lib/pkgconfig/vo-amrwbenc.pc
# lib/libvo-amrwbenc.so
# lib/libvo-amrwbenc.a
# lib/libvo-amrwbenc.la
# share/doc/vo-amrwbenc/NOTICE
# share/doc/vo-amrwbenc/COPYING
# bin/amrwb-enc

<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJACMAnAOwAMwFR1RoNAXBRcxVi516ANQ0sAoHsIgwEKDNjyEATBRkzqAZmAy
ALKCIAORmp1EyWAGxqKJI1qVXeXAQAE7oagBoKvIs6NuHQgMYBbOHgAfX9kADtkfwBXf2CAJ3gAR2jkRIATAAoANQB
RACUAZQBJAHkAOVAlLABWAEohAAd4gHsAK3hfdEyANxbgaH94gHcAI3hw3waeVHhuvKKy8uDIAEEAKVL8hmnZ+YKSi
pXi8q3NXbmcg6XggAVVgBVwAAkqi/3FitAAIgASAG8FodlmtNvkAL5YAFAm6QE5bSHQ65He5PZ7g77TIQtRroZAtcK
ZABCAFViogACLBQoPR7FcDBRDFImFH5E1IAG3SoAw0DxvlAHOQo1Q31AFWmOLxBOJZMp1Oeq3yuSpTJZbM53NQAAto
BlBcLReLypLcfjCbkABqrSC3RC5DXILmgeC4QaNDnwUDNFoAc3igzFEqEQgivg50XSIXSaU66Ba8WQ8FQmV8LX8/gJ
AHowxGo6BBiNxpMc5NptB0ulglGAGYRZDS8Ip4AAdXC/Uaeom6G1yeTwGS0WgQvQAE8sTw657MgBxRClIk8+K+YITA
XDAONRrweJYAVpjPZgLhSDwTPxUd7gtDMZrrOoZdZgBUe/emW16XiwUa0VGQoFa7BMgNZYNqE7AZkUCrAA0rk1IAJo
0rkkB3PkpTgLkhSFGcaxophPwAHp6v4Qb5EIoCiDBcGFIhDzIah6GYdh2y4S8+HfEReq+NqJiYuRFEFpW1bwHWkSNs
2FJKpATiSfkkDZGQMmrIUKGlLcDzTAJoBTvAs7zouD4roBxE9GQ4TwAS15FnehlZtAqD+FmUkKc+WCoJpAlChgmSrL
cty5OUFJLkZkygAChmrpMwQmWZFnhOC0wTDGNaZOBKXOTUuQeRRFZVrW9biZkwCydJxXKap6nZdpTq6XOC7BZFK4mT
UXqFreJa2fZjkZbkrnuUISUQROADEeyZFyNYctAvqoE4PQ7qg5rABENYtKAdjZKUwQ2vkLZEgFDIwhUjjAO2wDROE+
XmdyA64I0CboMAqCjv4owtBys2/Jk8aNMEhkxvEdRZn0Aw3sWvhuS90yjegibhL6Pl+QFQVQbBCpKiqjInLB+TBAAY
ogqwzqyYqthyzggGdF1XfA3J8TwuXBEKowBhemQtKMbTM+KRLrLk4APGF/wRWuCVCHswToHqvpzN+rTbvEeLJuznPc
7caH+fkDzFPhtylCU2tHCcFK5P5gUBQ8wTgKUJvGhONYXV05qZIz3OoDWuCCuEsBVa7wqs6OmQAurpR8wLwTlDauTg
uFHvgkLHLe/HvwADy0vkM65JbC5hw8hSMBzXPCgAfFVEtS/EMvoHLOI7krKbB2hucR1HMfC3HoAh5r2uYfxWkUUdlR
Ip85Tgn3/fYYPQuDysGwIuPWmlCSDy3MvLeQA6jeh/zluRxvY88FpVXDRXVdMxEsDBFK5oN/8IfN3v0ex7g8fq8U2S
PA63wtuTlP9NTIkIi0wprde6isnovTeh9IWqNqJL3yBhYIFJigQmBv0Nq4NIYkSqhEXkHIOSZHTpnPOQt7473Xk/du
L8F4CTVPkJU8FQAmxpCcOkXxmY0IokqF478HTMO1pHQ2lQOGH37hRfIJJyjaw3kwzCAi2GVFGBEceiVLoO0mI2VKIY
GZCWZpkb4YoDHTAgqSckVJCiKmVKqZkrJViBVAKY+UNI6QMjVIUX2ujhRFV5PyUAzjtbgFUclLRPBQwpStDaO0WVx6
M1dJ0aIUs/y6QwQOUKKS1xXmGNAHoiQKw7lfOPU+sshTe3PizPUSYUzpNClvB+rcqpFOrrmSM0ZYxdATJUl2YNUkCj
fh/OiMC1ho2wiSBBcFkEQhwU2KW+DCFKmIayapAoJFSOKDI/hrChGgCUeEIJQ0BBAA
LZS_PATCH
