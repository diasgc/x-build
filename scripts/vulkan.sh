#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='vulkan'
dsc='Khronos Vulkan-Headers'
lic='Apache-2.0'
src='https://github.com/KhronosGroup/Vulkan-Headers.git'
cfg='cmake'
eta='0'

pc_llib=' '
lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# include/vulkan/vulkan.hpp
# include/vulkan/vulkan_ios.h
# include/vulkan/vulkan_funcs.hpp
# include/vulkan/vulkan_metal.h
# include/vulkan/vulkan_structs.hpp
# include/vulkan/vulkan_xcb.h
# include/vulkan/vulkan_xlib_xrandr.h
# include/vulkan/vulkan_core.h
# include/vulkan/vulkan_enums.hpp
# include/vulkan/vulkan_xlib.h
# include/vulkan/vulkan_win32.h
# include/vulkan/vulkan.h
# include/vulkan/vulkan_raii.hpp
# include/vulkan/vulkan_android.h
# include/vulkan/vulkan_vi.h
# include/vulkan/vulkan_handles.hpp
# include/vulkan/vk_icd.h
# include/vulkan/vulkan_beta.h
# include/vulkan/vulkan_fuchsia.h
# include/vulkan/vulkan_wayland.h
# include/vulkan/vulkan_screen.h
# include/vulkan/vulkan_ggp.h
# include/vulkan/vulkan_directfb.h
# include/vulkan/vk_layer.h
# include/vulkan/vulkan_macos.h
# include/vulkan/vk_sdk_platform.h
# include/vulkan/vk_platform.h
# include/vk_video/vulkan_video_codecs_common.h
# include/vk_video/vulkan_video_codec_h264std.h
# include/vk_video/vulkan_video_codec_h264std_encode.h
# include/vk_video/vulkan_video_codec_h264std_decode.h
# include/vk_video/vulkan_video_codec_h265std_encode.h
# include/vk_video/vulkan_video_codec_h265std_decode.h
# include/vk_video/vulkan_video_codec_h265std.h
# share/vulkan/registry/vkconventions.py
# share/vulkan/registry/generator.py
# share/vulkan/registry/spec_tools/util.py
# share/vulkan/registry/conventions.py
# share/vulkan/registry/cgenerator.py
# share/vulkan/registry/genvk.py
# share/vulkan/registry/validusage.json
# share/vulkan/registry/reg.py
# share/vulkan/registry/vk.xml
