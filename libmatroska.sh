#!/bin/bash

lib='libmatroska'
dsc='a C++ libary to parse Matroska files (.mkv and .mka)'
lic='LGPL-2.1'
src="https://github.com/Matroska-Org/libmatroska.git"
cfg='cmake'
dep='libebml'
eta='10'
cmake_static='BUILD_STATIC_LIBS'
patch='libmatroska-01'

dev_bra='master'
dev_vrs='1.6.3'
sta_rel='release-1.6.3'

lst_inc='matroska/*.h matroska/c/*.h'
lst_lib='libmatroska'
lst_bin=''
lst_lic='LICENSE.LGPL README'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/matroska/FileKax.h
# include/matroska/KaxAttached.h
# include/matroska/KaxAttachments.h
# include/matroska/KaxBlock.h
# include/matroska/KaxBlockData.h
# include/matroska/KaxChapters.h
# include/matroska/KaxCluster.h
# include/matroska/KaxClusterData.h
# include/matroska/KaxConfig.h
# include/matroska/KaxContentEncoding.h
# include/matroska/KaxContexts.h
# include/matroska/KaxCues.h
# include/matroska/KaxCuesData.h
# include/matroska/KaxDefines.h
# include/matroska/KaxInfo.h
# include/matroska/KaxInfoData.h
# include/matroska/KaxSeekHead.h
# include/matroska/KaxSegment.h
# include/matroska/KaxSemantic.h
# include/matroska/KaxTag.h
# include/matroska/KaxTags.h
# include/matroska/KaxTrackAudio.h
# include/matroska/KaxTrackEntryData.h
# include/matroska/KaxTrackVideo.h
# include/matroska/KaxTracks.h
# include/matroska/KaxTypes.h
# include/matroska/KaxVersion.h
# include/matroska/c/libmatroska.h
# include/matroska/c/libmatroska_t.h
# include/matroska/matroska_export.h
# lib/cmake/Matroska/MatroskaConfig.cmake
# lib/cmake/Matroska/MatroskaConfigVersion.cmake
# lib/cmake/Matroska/MatroskaTargets-release.cmake
# lib/cmake/Matroska/MatroskaTargets.cmake
# lib/libmatroska.a
# lib/libmatroska.so
# lib/pkgconfig/libmatroska.pc
# share/doc/libmatroska/LICENSE.LGPL
# share/doc/libmatroska/README

