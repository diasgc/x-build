#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='glut'
dsc='OpenGL Utility Toolkit'
lic='GLP-2.0'
src='https://github.com/markkilgard/glut.git'
eta='0'

#https://github.com/dcnieho/FreeGLUT.git

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuilder.sh

start