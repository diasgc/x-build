#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='freeglut'
dsc='Free-software/open-source alternative to the OpenGL Utility Toolkit (GLUT) library'
lic='GLP-2.0'
src='https://github.com/dcnieho/FreeGLUT.git'
cfg='cmake'
eta='0'
config_dir='freeglut/freeglut'
cmake_static='FREEGLUT_BUILD_STATIC_LIBS'
cmake_shared='FREEGLUT_BUILD_SHARED_LIBS'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

eta='20'

. xbuilder.sh

start