#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +F   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='freeglut'
dsc='Free-software/open-source alternative to the OpenGL Utility Toolkit (GLUT) library'
lic='GLP-2.0'
url='https://sourceforge.net/projects/freeglut'
cfg='cmake'
eta='0'
pkg_deb="freeglut3-dev"

patch='freeglut-3.4.0'
cmake_config='-DFREEGLUT_BUILD_DEMOS=OFF'
cmake_shared='FREEGLUT_BUILD_SHARED_LIBS'
cmake_static='FREEGLUT_BUILD_STATIC_LIBS'


dev_bra='main'
dev_vrs='3.2.2'

lst_inc='GL/freeglut.h
 GL/freeglut_ucall.h
 GL/freeglut_ext.h
 GL/freeglut_std.h
 GL/glut.h'
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

eta='20'
pkg_deb="freeglut3-dev"


on_config(){
    local f="$(sourceforge_json freeglut | jq -r .release.filename)"
    vrs=$(grep -oP '[0-9]+\.[0-9]+\.[0-9]' <<<${f} | tail -n1)
    src='https://downloads.sourceforge.net/freeglut/freeglut-'${vrs}'.tar.gz'
}

on_config_ndk(){
    pkg='freeglut-gles'
    lst_lib='libfreeglut-gles.a'
}

. xbuild && start

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
