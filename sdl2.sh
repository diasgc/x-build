#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

# run with --nodev option

lib='sdl2'
apt='libsdl2-dev'
dsc='Simple Directmedia Layer'
lic='BSD'
src='https://github.com/libsdl-org/SDL.git'
cfg='cmake'
eta='60'
cmake_static='SDL_STATIC'
cmake_config="-DRPATH=OFF -DASAN=ON -DASSEMBLY=ON"

lst_inc='SDL2/*.h'
lst_lib='libSDL2main libSDL2 libhidapi'
lst_bin='sdl2-config'
lst_lic='LICENSE AUTHORS'
lst_pc=''

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

. xbuilder.sh

$host_ndk && CFG+=" -DANDROID=ON"
$host_arm && CFG+=" -DARMNEON=ON -DARMSIMD=ON -DMMX=OFF"
$host_mingw && CFG+=" -DCMAKE_COMPILER_IS_MINGW=TRUE" || CFG+=" -DSDL_STATIC_PIC=ON"

_source_get(){
    pushdir $SOURCES
    wget_tar SDL
    popdir
}

start

# Filelist
# --------
# include/SDL2/SDL_test_random.h
# include/SDL2/SDL_timer.h
# include/SDL2/SDL_audio.h
# include/SDL2/SDL_loadso.h
# include/SDL2/SDL_power.h
# include/SDL2/SDL.h
# include/SDL2/SDL_video.h
# include/SDL2/SDL_scancode.h
# include/SDL2/SDL_joystick.h
# include/SDL2/SDL_gamecontroller.h
# include/SDL2/SDL_test_md5.h
# include/SDL2/SDL_config_iphoneos.h
# include/SDL2/SDL_keycode.h
# include/SDL2/SDL_log.h
# include/SDL2/SDL_gesture.h
# include/SDL2/SDL_sensor.h
# include/SDL2/SDL_revision.h
# include/SDL2/SDL_clipboard.h
# include/SDL2/SDL_metal.h
# include/SDL2/SDL_thread.h
# include/SDL2/SDL_surface.h
# include/SDL2/SDL_opengles.h
# include/SDL2/SDL_touch.h
# include/SDL2/SDL_config_android.h
# include/SDL2/SDL_copying.h
# include/SDL2/SDL_bits.h
# include/SDL2/SDL_atomic.h
# include/SDL2/SDL_config_psp.h
# include/SDL2/SDL_opengl.h
# include/SDL2/SDL_haptic.h
# include/SDL2/SDL_test_fuzzer.h
# include/SDL2/SDL_opengles2_gl2ext.h
# include/SDL2/SDL_config_os2.h
# include/SDL2/SDL_error.h
# include/SDL2/SDL_test_log.h
# include/SDL2/SDL_mutex.h
# include/SDL2/SDL_render.h
# include/SDL2/SDL_config_macosx.h
# include/SDL2/SDL_rwops.h
# include/SDL2/SDL_rect.h
# include/SDL2/SDL_config_wiz.h
# include/SDL2/SDL_events.h
# include/SDL2/SDL_config_windows.h
# include/SDL2/SDL_test.h
# include/SDL2/SDL_opengl_glext.h
# include/SDL2/SDL_main.h
# include/SDL2/SDL_pixels.h
# include/SDL2/SDL_hints.h
# include/SDL2/SDL_version.h
# include/SDL2/SDL_vulkan.h
# include/SDL2/SDL_system.h
# include/SDL2/SDL_types.h
# include/SDL2/SDL_keyboard.h
# include/SDL2/SDL_test_memory.h
# include/SDL2/SDL_mouse.h
# include/SDL2/SDL_test_compare.h
# include/SDL2/SDL_filesystem.h
# include/SDL2/SDL_misc.h
# include/SDL2/SDL_locale.h
# include/SDL2/SDL_config_minimal.h
# include/SDL2/SDL_opengles2.h
# include/SDL2/SDL_quit.h
# include/SDL2/SDL_name.h
# include/SDL2/SDL_test_crc32.h
# include/SDL2/SDL_blendmode.h
# include/SDL2/SDL_test_harness.h
# include/SDL2/SDL_config.h
# include/SDL2/SDL_assert.h
# include/SDL2/SDL_opengles2_khrplatform.h
# include/SDL2/SDL_test_common.h
# include/SDL2/SDL_platform.h
# include/SDL2/SDL_test_images.h
# include/SDL2/begin_code.h
# include/SDL2/SDL_opengles2_gl2.h
# include/SDL2/SDL_cpuinfo.h
# include/SDL2/SDL_config_pandora.h
# include/SDL2/SDL_test_font.h
# include/SDL2/SDL_opengles2_gl2platform.h
# include/SDL2/SDL_syswm.h
# include/SDL2/SDL_test_assert.h
# include/SDL2/close_code.h
# include/SDL2/SDL_messagebox.h
# include/SDL2/SDL_config_winrt.h
# include/SDL2/SDL_stdinc.h
# include/SDL2/SDL_shape.h
# include/SDL2/SDL_endian.h
# include/SDL2/SDL_egl.h
# lib/libSDL2main.a
# lib/pkgconfig/sdl2.pc
# lib/cmake/SDL2/SDL2Targets-release.cmake
# lib/cmake/SDL2/SDL2Targets.cmake
# lib/cmake/SDL2/SDL2ConfigVersion.cmake
# lib/cmake/SDL2/SDL2Config.cmake
# lib/libSDL2.a
# lib/libSDL2.so
# lib/libhidapi.so
# share/aclocal/sdl2.m4
# bin/sdl2-config
