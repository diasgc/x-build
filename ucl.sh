#!/bin/bash

lib='ucl'
dsc='UCL is a portable lossless data compression library written in ANSI C'
lic='GPL-2.0'
src='https://github.com/korczis/ucl.git'
url='http://www.oberhumer.com/opensource/ucl'

cfg='cmake'
cmake_static='BUILD_STATIC_LIBS'
cmake_bin='BUILD_PROGRAM'

dev_vrs='1.03'

#cfg='ac'
#pc_llib='-lucl'

lst_inc='ucl/*.h'
lst_lib='libucl'
lst_bin=''
lst_lic='COPYING README'
lst_pc='ucl.pc'
build_strip=false
eta='14'

. xbuild

start

# patch 01 create CMakeLists.txt with dual static/shared build support and
# patch 02 create ucl.pc.in for pkgconfig support
<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJACMAnAOwAMwFR1RoNAXBRcxVi516ANQ0sAoHsIgwEKDNjyEATBRkzqAZmAy
loIgA5GMssyJYyAVhmkSANha8uAgAK3Q1ADQVeRJ0qOh7QgMYBbOHgAfX9kADtkfwBXf2CAJ3gAR2jkRIATAAoANQB
RACUAZQBJAHkAOVAlLCMASiEAB3iAewAreF90TOjfABtQRABBcoBxAFVBkdzCiHqeVHguvKKyyoMaOeaG9GRm8MyAI
THixAARYMKAFUHL4vBgxGKDmYAiACNU3vTQDGgd31AvWQb1QoGgvT2AHNQAB3ZDoAAWPwR0AyL1AFU2212+yOJ3OAA
V8qURvlBpBQO9Pt8ms1IfFoP5QPBcB1ouhoG9evB0ZihEIAGbIbmZEaIUoHH7xXzBIEfPpS3wAegAVFgkahpaqsADN
cq1b4EXMhSKxRLFcEEfBoOl4PFQRE+tFbUqer1tUb+TxHb1nSF0mkOuhmvFkPBUJkfX7jdFwp0cZkbelZcC3T8BbhA
eFYHNQHmwelk3KGfEAJ6ZAAkAG8iaUAFK5cCXYLlcm5AC+1dQGfboGrvWzva70pT8t67dz+YW6GCHPikMWwVpDTtO3
DlZrxIbTZbbc7Ve7uF7tYJBVu0wxY0uBKvu8guT7m/rjebrfvE6E+dAEV+vV6mWufIpkuGZq1rbdXz3Lse0/L980eA
4yXyABNUBTmmW5W1uCpAWBWC4NAQZ8nAAAJYo8jQjDiiw1ZcLefC4PyMZylue9KKuaiblot4IgYuZ4HCdIBVjeM9ky
OYhCTUc3UyF50TkuZkAFQ5jjOC4SKI3JzgQmZhlOUA8TUq4uPuHTJzzKS5Rk4Bfn+UBjNucB+MEpTxK9VzDMJYlSXJ
cyC2TFk2Q5Ll4G6PoGmgXxYGZXBGQablUFdcLItgHUYrihKlV9HZenVPy5wXGcgWzUcSzDCM3QiqLQDdPyfw5P8AKI
4CZkqlLQCYljijY9COJonCePCZyA2UiSeF8PYhUhaJEmCE1QrArcXzvDssAaXwsAiR8oEGABpXJggOTiUOCU5inyds
lUW58dzfVb1u8CpEGQxTwl/f8ADETgvasdv2w7juQ07zsu66IJW9s1oBXrMK4nC5SVBpYEhCbwim173syL7EAvcBSg
JZDqJGDrckGU4eqo/rKlQFFEiVdJmmVMHlruj9vTehrPu+0CDxHK0bTtVBexhzjsMqKMXWZ2693qAAdUBymaUBwngG
FivgMF0GZQTQGaAVQHmgQQGAGq+ihzbwmIcgqBoOgGCINg2A4LhuD4IhBGEHhTdy9aLYIOQFGUVR1C0RgiHMfRDE0U
wSAsKw+E4OwHGcVweHcIgvB8HgmngIVcAAXlsP6Duo4zEEQYIiVyL6AA1bCEQKZRzvP8+rZvkCPIQ5QDeJW6rRul0S
PPLrlIQJfgHu+/bo8lXHr1ykZeBGG9oRTnDXxQ2xPZl7GcBEG/UFoFABoQ2C7lAWaVBUAS0F0j+I+Jv8HOr5xOiS1L
WFQ3QdABO/cJCPKCUCAQgxj5EQMvBE38GioEYEqJUkJ4QImiG8HUzR/BKlgCGXwAAvNAQhsiCxxMvWwywSgVHrjwfI
yRUiJBgaAIQVCUiBmwE0ZAAA3P4S96E8BQCCZewBED9mBD3XswBfR9CELwlhoYOE/2XkIcAApejQEhHQ4AxRqzjxEb
BAQQA=
LZS_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# bin/uclpack
# include/ucl/ucl.h
# include/ucl/uclconf.h
# include/ucl/uclutil.h
# lib/libucl.a
# lib/libucl.so
# lib/pkgconfig/ucl.pc
# share/doc/ucl/COPYING
# share/doc/ucl/README