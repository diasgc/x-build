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
