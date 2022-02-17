#!/bin/bash
# cpu av8 av7 x86 x64
# NDK PP+ PP   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='taglib'
apt='libtag1v5'
dsc='TagLib Audio Meta-Data Library'
lic='LGPL-2.1 MPL'
src='https://github.com/taglib/taglib.git'
cfg='cmake'
eta='60'
cbk='BUILD_EXAMPLES'

lst_pc='taglib.pc taglib_c.pc'
lst_inc='taglib/id3v2framefactory.h taglib/id3v2extendedheader.h 
	taglib/taglib.h taglib/mp4item.h taglib/vorbisproperties.h 
	taglib/relativevolumeframe.h taglib/s3mfile.h taglib/speexproperties.h 
	taglib/mpegfile.h taglib/mp4tag.h taglib/chapterframe.h 
	taglib/rifffile.h taglib/mpcproperties.h taglib/mp4file.h 
	taglib/modfile.h taglib/tfilestream.h taglib/unsynchronizedlyricsframe.h 
	taglib/mpegheader.h taglib/apefile.h taglib/mp4atom.h 
	taglib/id3v2.h taglib/tlist.tcc taglib/generalencapsulatedobjectframe.h 
	taglib/unknownframe.h taglib/opusfile.h taglib/eventtimingcodesframe.h 
	taglib/modproperties.h taglib/oggflacfile.h taglib/trueaudiofile.h 
	taglib/wavpackproperties.h taglib/aifffile.h taglib/apeitem.h 
	taglib/commentsframe.h taglib/tableofcontentsframe.h taglib/mp4properties.h 
	taglib/modtag.h taglib/tmap.tcc taglib/podcastframe.h 
	taglib/taglib_export.h taglib/fileref.h taglib/textidentificationframe.h 
	taglib/tstring.h taglib/vorbisfile.h taglib/flacmetadatablock.h 
	taglib/asfpicture.h taglib/attachedpictureframe.h taglib/tfile.h 
	taglib/tbytevectorstream.h taglib/tmap.h taglib/tstringlist.h 
	taglib/flacfile.h taglib/tdebuglistener.h taglib/audioproperties.h 
	taglib/xiphcomment.h taglib/id3v1tag.h taglib/mpcfile.h 
	taglib/oggfile.h taglib/urllinkframe.h taglib/asfattribute.h 
	taglib/wavfile.h taglib/aiffproperties.h taglib/apeproperties.h 
	taglib/id3v1genres.h taglib/tag_c.h taglib/privateframe.h 
	taglib/mp4coverart.h taglib/flacproperties.h taglib/uniquefileidentifierframe.h 
	taglib/xmproperties.h taglib/id3v2frame.h taglib/flacpicture.h 
	taglib/trefcounter.h taglib/itfile.h taglib/infotag.h 
	taglib/synchronizedlyricsframe.h taglib/ownershipframe.h taglib/asffile.h 
	taglib/wavpackfile.h taglib/id3v2tag.h taglib/asftag.h 
	taglib/tlist.h taglib/s3mproperties.h taglib/tiostream.h 
	taglib/id3v2synchdata.h taglib/tag.h taglib/asfproperties.h 
	taglib/id3v2header.h taglib/popularimeterframe.h taglib/trueaudioproperties.h 
	taglib/id3v2footer.h taglib/itproperties.h taglib/apefooter.h 
	taglib/xmfile.h taglib/tpropertymap.h taglib/opusproperties.h 
	taglib/oggpage.h taglib/oggpageheader.h taglib/wavproperties.h 
	taglib/modfilebase.h taglib/speexfile.h taglib/mpegproperties.h 
	taglib/taglib_config.h taglib/apetag.h taglib/xingheader.h 
	taglib/tbytevector.h taglib/tbytevectorlist.h'
st_lib='libtag libtag_c'
lst_bin='tagreader 
  taglib-config 
  strip-id3v1 
  framelist 
  tagreader_c 
  tagwriter'

. xbuilder.sh

start

# Filelist
# --------
# include/taglib/id3v2framefactory.h
# include/taglib/id3v2extendedheader.h
# include/taglib/taglib.h
# include/taglib/mp4item.h
# include/taglib/vorbisproperties.h
# include/taglib/relativevolumeframe.h
# include/taglib/s3mfile.h
# include/taglib/speexproperties.h
# include/taglib/mpegfile.h
# include/taglib/mp4tag.h
# include/taglib/chapterframe.h
# include/taglib/rifffile.h
# include/taglib/mpcproperties.h
# include/taglib/mp4file.h
# include/taglib/modfile.h
# include/taglib/tfilestream.h
# include/taglib/unsynchronizedlyricsframe.h
# include/taglib/mpegheader.h
# include/taglib/apefile.h
# include/taglib/mp4atom.h
# include/taglib/id3v2.h
# include/taglib/tlist.tcc
# include/taglib/generalencapsulatedobjectframe.h
# include/taglib/unknownframe.h
# include/taglib/opusfile.h
# include/taglib/eventtimingcodesframe.h
# include/taglib/modproperties.h
# include/taglib/oggflacfile.h
# include/taglib/trueaudiofile.h
# include/taglib/wavpackproperties.h
# include/taglib/aifffile.h
# include/taglib/apeitem.h
# include/taglib/commentsframe.h
# include/taglib/tableofcontentsframe.h
# include/taglib/mp4properties.h
# include/taglib/modtag.h
# include/taglib/tmap.tcc
# include/taglib/podcastframe.h
# include/taglib/taglib_export.h
# include/taglib/fileref.h
# include/taglib/textidentificationframe.h
# include/taglib/tstring.h
# include/taglib/vorbisfile.h
# include/taglib/flacmetadatablock.h
# include/taglib/asfpicture.h
# include/taglib/attachedpictureframe.h
# include/taglib/tfile.h
# include/taglib/tbytevectorstream.h
# include/taglib/tmap.h
# include/taglib/tstringlist.h
# include/taglib/flacfile.h
# include/taglib/tdebuglistener.h
# include/taglib/audioproperties.h
# include/taglib/xiphcomment.h
# include/taglib/id3v1tag.h
# include/taglib/mpcfile.h
# include/taglib/oggfile.h
# include/taglib/urllinkframe.h
# include/taglib/asfattribute.h
# include/taglib/wavfile.h
# include/taglib/aiffproperties.h
# include/taglib/apeproperties.h
# include/taglib/id3v1genres.h
# include/taglib/tag_c.h
# include/taglib/privateframe.h
# include/taglib/mp4coverart.h
# include/taglib/flacproperties.h
# include/taglib/uniquefileidentifierframe.h
# include/taglib/xmproperties.h
# include/taglib/id3v2frame.h
# include/taglib/flacpicture.h
# include/taglib/trefcounter.h
# include/taglib/itfile.h
# include/taglib/infotag.h
# include/taglib/synchronizedlyricsframe.h
# include/taglib/ownershipframe.h
# include/taglib/asffile.h
# include/taglib/wavpackfile.h
# include/taglib/id3v2tag.h
# include/taglib/asftag.h
# include/taglib/tlist.h
# include/taglib/s3mproperties.h
# include/taglib/tiostream.h
# include/taglib/id3v2synchdata.h
# include/taglib/tag.h
# include/taglib/asfproperties.h
# include/taglib/id3v2header.h
# include/taglib/popularimeterframe.h
# include/taglib/trueaudioproperties.h
# include/taglib/id3v2footer.h
# include/taglib/itproperties.h
# include/taglib/apefooter.h
# include/taglib/xmfile.h
# include/taglib/tpropertymap.h
# include/taglib/opusproperties.h
# include/taglib/oggpage.h
# include/taglib/oggpageheader.h
# include/taglib/wavproperties.h
# include/taglib/modfilebase.h
# include/taglib/speexfile.h
# include/taglib/mpegproperties.h
# include/taglib/taglib_config.h
# include/taglib/apetag.h
# include/taglib/xingheader.h
# include/taglib/tbytevector.h
# include/taglib/tbytevectorlist.h
# lib/pkgconfig/taglib_c.pc
# lib/pkgconfig/taglib.pc
# lib/libtag_c.so
# lib/libtag.so
# bin/tagreader
# bin/taglib-config
# bin/strip-id3v1
# bin/framelist
# bin/tagreader_c
# bin/tagwriter
