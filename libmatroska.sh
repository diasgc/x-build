#!/bin/bash

lib='libmatroska'
dsc='a C++ libary to parse Matroska files (.mkv and .mka)'
lic='LGPL-2.1'
src="https://github.com/Matroska-Org/libmatroska.git"
cfg='cmake'
dep='libebml'
eta='10'
cmake_static='BUILD_STATIC_LIBS'

dev_bra='master'
dev_vrs='1.6.3'
sta_rel='release-1.6.3'

lst_inc='matroska/*.h matroska/c/*.h'
lst_lib='libmatroska'
lst_bin=''
lst_lic='LICENSE.LGPL README'
lst_pc=''

. xbuild

start

# patch 01 on CMakeLists.txt: support dual static/shared build
<<'LZS_PATCH'
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
UBa2GpqIQXfzyU0vmULBbCzhQikSAZNhAA
LZS_PATCH


# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
#
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

