#!/bin/bash

lib='taglib'
apt='libtag1v5'
dsc='TagLib Audio Meta-Data Library'
lic='LGPL-2.1 MPL'
src='https://github.com/taglib/taglib.git'
cfg='cmake'
eta='60'
cmake_bin='BUILD_EXAMPLES'
cmake_static='BUILD_STATIC_LIBS'

lst_inc='taglib/*.h'
lst_lib='libtag libtag_c'
lst_bin='tagreader 
  taglib-config 
  strip-id3v1 
  framelist 
  tagreader_c 
  tagwriter'
lst_lic='COPYING.LGPL COPYING.MPL'
lst_pc='taglib.pc taglib_c.pc'

. xbuild

start

# patch 01 on taglib/CMakeLists.txt and
# patch 02 on bindings/c/CMakeLists.txt to support dual static/shared builds
<<'LZS_PATCH'
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
LZS_PATCH

# cpu av8 av7 x86 x64
# NDK +++ +++  .  +++ clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# bin/framelist
# bin/strip-id3v1
# bin/taglib-config
# bin/tagreader
# bin/tagreader_c
# bin/tagwriter
# include/taglib/aifffile.h
# include/taglib/aiffproperties.h
# include/taglib/apefile.h
# include/taglib/apefooter.h
# include/taglib/apeitem.h
# include/taglib/apeproperties.h
# include/taglib/apetag.h
# include/taglib/asfattribute.h
# include/taglib/asffile.h
# include/taglib/asfpicture.h
# include/taglib/asfproperties.h
# include/taglib/asftag.h
# include/taglib/attachedpictureframe.h
# include/taglib/audioproperties.h
# include/taglib/chapterframe.h
# include/taglib/commentsframe.h
# include/taglib/eventtimingcodesframe.h
# include/taglib/fileref.h
# include/taglib/flacfile.h
# include/taglib/flacmetadatablock.h
# include/taglib/flacpicture.h
# include/taglib/flacproperties.h
# include/taglib/generalencapsulatedobjectframe.h
# include/taglib/id3v1genres.h
# include/taglib/id3v1tag.h
# include/taglib/id3v2.h
# include/taglib/id3v2extendedheader.h
# include/taglib/id3v2footer.h
# include/taglib/id3v2frame.h
# include/taglib/id3v2framefactory.h
# include/taglib/id3v2header.h
# include/taglib/id3v2synchdata.h
# include/taglib/id3v2tag.h
# include/taglib/infotag.h
# include/taglib/itfile.h
# include/taglib/itproperties.h
# include/taglib/modfile.h
# include/taglib/modfilebase.h
# include/taglib/modproperties.h
# include/taglib/modtag.h
# include/taglib/mp4atom.h
# include/taglib/mp4coverart.h
# include/taglib/mp4file.h
# include/taglib/mp4item.h
# include/taglib/mp4properties.h
# include/taglib/mp4tag.h
# include/taglib/mpcfile.h
# include/taglib/mpcproperties.h
# include/taglib/mpegfile.h
# include/taglib/mpegheader.h
# include/taglib/mpegproperties.h
# include/taglib/oggfile.h
# include/taglib/oggflacfile.h
# include/taglib/oggpage.h
# include/taglib/oggpageheader.h
# include/taglib/opusfile.h
# include/taglib/opusproperties.h
# include/taglib/ownershipframe.h
# include/taglib/podcastframe.h
# include/taglib/popularimeterframe.h
# include/taglib/privateframe.h
# include/taglib/relativevolumeframe.h
# include/taglib/rifffile.h
# include/taglib/s3mfile.h
# include/taglib/s3mproperties.h
# include/taglib/speexfile.h
# include/taglib/speexproperties.h
# include/taglib/synchronizedlyricsframe.h
# include/taglib/tableofcontentsframe.h
# include/taglib/tag.h
# include/taglib/tag_c.h
# include/taglib/taglib.h
# include/taglib/taglib_config.h
# include/taglib/taglib_export.h
# include/taglib/tbytevector.h
# include/taglib/tbytevectorlist.h
# include/taglib/tbytevectorstream.h
# include/taglib/tdebuglistener.h
# include/taglib/textidentificationframe.h
# include/taglib/tfile.h
# include/taglib/tfilestream.h
# include/taglib/tiostream.h
# include/taglib/tlist.h
# include/taglib/tlist.tcc
# include/taglib/tmap.h
# include/taglib/tmap.tcc
# include/taglib/tpropertymap.h
# include/taglib/trefcounter.h
# include/taglib/trueaudiofile.h
# include/taglib/trueaudioproperties.h
# include/taglib/tstring.h
# include/taglib/tstringlist.h
# include/taglib/uniquefileidentifierframe.h
# include/taglib/unknownframe.h
# include/taglib/unsynchronizedlyricsframe.h
# include/taglib/urllinkframe.h
# include/taglib/vorbisfile.h
# include/taglib/vorbisproperties.h
# include/taglib/wavfile.h
# include/taglib/wavpackfile.h
# include/taglib/wavpackproperties.h
# include/taglib/wavproperties.h
# include/taglib/xingheader.h
# include/taglib/xiphcomment.h
# include/taglib/xmfile.h
# include/taglib/xmproperties.h
# lib/libtag.a
# lib/libtag.so
# lib/libtag_c.a
# lib/libtag_c.so
# lib/pkgconfig/taglib.pc
# lib/pkgconfig/taglib_c.pc
# share/doc/taglib/COPYING.LGPL
# share/doc/taglib/COPYING.MPL
