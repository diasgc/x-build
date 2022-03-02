#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +F   .   .   .  clang
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
cmake_config='-DFREEGLUT_BUILD_DEMOS=OFF'

dev_bra='main'
dev_vrs='3.2.2'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

eta='20'

. xbuild

on_config_ndk(){
    cmake_config+=' -DFREEGLUT_GLES=ON'
    pkg='freeglut-gles'
    return 0
}

start

# ndk: https://sourceforge.net/p/freeglut/bugs/257/

# Filelist
# --------
# share/doc/freeglut/AUTHORS
# share/doc/freeglut/COPYING
# lib/cmake/FreeGLUT/FreeGLUTConfigVersion.cmake
# lib/cmake/FreeGLUT/FreeGLUTConfig.cmake
# lib/cmake/FreeGLUT/FreeGLUTTargets-release.cmake
# lib/cmake/FreeGLUT/FreeGLUTTargets.cmake
# lib/pkgconfig/freeglut-gles.pc
# include/GL/glut.h
# include/GL/freeglut_std.h
# include/GL/freeglut_ext.h
# include/GL/freeglut_ucall.h
# include/GL/freeglut.h
# lib/libfreeglut-gles.a
# 
