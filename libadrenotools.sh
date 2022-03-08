#!/bin/bash

lib='libadrenotools'
dsc='A library for applying rootless Adreno GPU driver modifications/replacements'
lic='BSD-2c'
src='https://github.com/bylaws/libadrenotools.git'
src_opt='--recursive'
cfg='cmake'
eta='575'

cmake_static='BUILD_STATIC_LIBS'
pc_llib='-ladrenotools'

lst_inc=''
lst_lib='libadrenotools'
lst_bin=''
lst_lic='LICENSE README.md'
lst_pc='adrenotools.pc'

dev_vrs=''

. xbuild

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/adrenotools/bcenabler.h
# include/adrenotools/driver.h
# include/adrenotools/priv.h
# lib/libadrenotools.a
# lib/libadrenotools.so
# lib/pkgconfig/libadrenotools.pc
# share/doc/libadrenotools/LICENSE
# share/doc/libadrenotools/README.md

<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJABMADEUcCQMyUAcoJAjAFxECcrArFgOwBsVMp0ElQAahKSSAKDFyIMBCgzY
8hUuUo0S9JswAsJZiR5ZOwoSPFSZAAVuhgbADSM+4l0R6h700NAATAIB9VABXACMA5AAneABjdAB7GIBPAAoAG2QIg
HpsgDsEGILUCNSAB2hUVABKPz9UeHR0xABJACFggGUAeQBVACVwAFFu0FQY+NyI+PgC6AjM+BiseIqK6WBQHd29/Ym
p3ICY5AA3FbWNrYPb3eQC+MywgPhcwLiCpOSkzNQZuYLJaXAAWsjud0m0xO50u6wq9TETRa7S6AAkRgBBAAiI0G4we
Txebw+82+SV+/1m80Wy1WYIhd0Jz1e7xOZJ+f2Opwu9L8jIOzOJbM+5MpuQqPKwIPqwC2gRC2QiMWgaXSpK+nNQoAA
JABvVE9AbDMYAX1lW3QqoA5s1gkLXsFonFEilkPBUOr2ZqKX9QAAFfoddrgUAO+Cyq0xW3oe2PFnwJ2xBLJU4er2ir
UBwZtABqmIAKiNQFhIza7fEkgBbCrIZbBJIVdDIJKlDMc33a/05/NFxwAdWgmUyA/g+BVZejdsKsGCSpVac9GrFfrO
YUysGgBX8BROSWQAVAM5WpXKVRqFrEADMwo9m62vYqchMr7gj0VEXsFXOcguMsutX1VBX1NXU9UyIpQP1Q0+iGUZui
gg1OmCDEcTxBDP12KMYzjIlHWdFM3XTADOyAkCAyDEMw3jYlMJ2bC7XDJMXVTd0l29FdUDI3BQO7PNC2LUtwSw8tY0
rGs60TRt7zbEjKW43iewEgchxHYB+zHdAJ2E+jRJ/Iof2VVU2PbH15L1YCeNANcNy3Hc9wPI8HmKU9KmqOodImO0GN
jSVGxWZtiI4wCLPI7ten9PECzaMZQAGAtAwLYIADlMUgYs5L+OjqIwVT0gLTFBgAcRGAtxkyrjQp4zy9hGAANf1ekG
AswPCgApEZwCS1L0tNBTgErAor2Qa0at2QZ+mS6L0tAXFumi1Lot6ZLQAAIn1KBMQAaRGYI2mS+bMUQRBgg6fbsTaQ
ZTVWsadkK8A0TzYs5oWws2mWtaNsgbbdv2w7juCVELqum6xDuVFBkKgBNWaxlepaVvWvVNp2vaDoKgGgcu67btARF5
gCG87xbAp0kRb8lXSVbVrW1bEWQK90g6fo2kQbEegK6LwEBzpxkxZLsVAZnWfZ7o0UKkZ2dRbpsopnIqeAXLm3iGnD
q5/HdwZsm/G/cIomTV01ShXIQQpWB6dKK1h3SAAxVnYug5DUNxfFQJe/a3o+8MRQ7Sl6iAA=
LZS_PATCH
