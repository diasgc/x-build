#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  ++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libaribcaption'
dsc='Portable ARIB STD-B24 Caption Decoder/Renderer'
lic='MIT License'
src="https://github.com/xqq/libaribcaption.git"
cfg='cmake'
cmake_shared='ARIBCC_SHARED_LIBRARY'
dep='fontconfig'
eta='0'

dev_bra='master'
dev_vrs='1.1.1'

lst_inc='aribcaption/*.h aribcaption/*.hpp'
lst_lib='libaribcaption'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='libaribcaption.pc'

eta='20'

. xbuild && start

# Filelist
# --------
# include/aribcaption/aribcc_config.h
# include/aribcaption/aribcc_export.h
# include/aribcaption/aribcaption.h
# include/aribcaption/aribcaption.hpp
# include/aribcaption/caption.h
# include/aribcaption/caption.hpp
# include/aribcaption/color.h
# include/aribcaption/color.hpp
# include/aribcaption/context.h
# include/aribcaption/context.hpp
# include/aribcaption/decoder.h
# include/aribcaption/decoder.hpp
# include/aribcaption/aligned_alloc.hpp
# include/aribcaption/image.h
# include/aribcaption/image.hpp
# include/aribcaption/renderer.h
# include/aribcaption/renderer.hpp
# lib/libaribcaption.a
# lib/cmake/aribcaption/aribcaption-targets.cmake
# lib/cmake/aribcaption/aribcaption-targets-release.cmake
# lib/cmake/aribcaption/aribcaption-config.cmake
# lib/cmake/aribcaption/aribcaption-config-version.cmake
# lib/pkgconfig/libaribcaption.pc