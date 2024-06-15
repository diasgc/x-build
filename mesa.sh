#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='mesa'
dsc='Mesa 3D graphics library'
lic='Free'
src='https://gitlab.freedesktop.org/mesa/mesa.git'
tls='flex'
dep='libdrm'

cfg='meson'
build_strip=false

dev_bra='main'
dev_vrs='22.0.1123'
pkg_deb=''
eta='0'

on_config_ndk(){
    meson_cfg='-Dplatforms=android -Degl-native-platform=android -Dandroid-stub=true -Dgallium-drivers=freedreno -Dvulkan-drivers=freedreno'
    CPPFLAGS+=' -D_GNU_SOURCE=1'
    export API=26 #vulkan sync_merge
}

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

. xbuild && start

# Filelist
# --------
# share/drirc.d/00-mesa-defaults.conf
# share/vulkan/icd.d/freedreno_icd.aarch64.json
# include/GLES/glplatform.h
# include/GLES/gl.h
# include/GLES/egl.h
# include/GLES/glext.h
# include/KHR/khrplatform.h
# include/GL/glcorearb.h
# include/GL/gl.h
# include/GL/glext.h
# include/GLES2/gl2platform.h
# include/GLES2/gl2ext.h
# include/GLES2/gl2.h
# include/GLES3/gl3platform.h
# include/GLES3/gl3.h
# include/GLES3/gl31.h
# include/GLES3/gl3ext.h
# include/GLES3/gl32.h
# lib/pkgconfig/glesv2.pc
# lib/pkgconfig/glesv1_cm.pc
# lib/libvulkan_freedreno.so
# lib/libGLESv2.so
# lib/libglapi.so
# lib/libGLESv1_CM.so
