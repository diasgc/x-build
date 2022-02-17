#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .  +++ gcc
# WIN  .   .   .   .  clang/gcc

<<'JHEAD'
{
    "lib": "libicu",
    "pkg": "icu-io",
    "dsc": "International Components for Unicode library",
    "src": "https://github.com/unicode-org/icu.git",
    "dir_config": "icu4c/source",
    "mki": "install"
}
JHEAD

lib='libicu'
pkg='icu-io'
dsc='International Components for Unicode library'
lic='BSD'
src='https://github.com/unicode-org/icu.git'
cfg='ac'
config_dir='icu4c/source'
mki='install'
eta='580'

lst_inc='unicode/*.h'
lst_lib='libicutu libicuuc libicuio libicutest libicui18n libicudata'
lst_bin='genrb makeconv icuexportdata pkgdata gencnval gencfu gendict uconv icu-config derb genbrk icuinfo'
lst_lic='COPYING'
lst_pc='icu-i18n.pc icu-uc.pc icu-io.pc'

. xbuilder.sh

dir_build="${dir_src}/${config_dir}/build_${arch}"
ac_config="--with-data-packaging=archive"

if $host_cross; then
    dir_cross="${dir_src}/${config_dir}/build_${build_arch}"
    a=${arch}
    if [ ! -d "${dir_cross}" ];then
        ./libicu.sh lx64 --both --bin
    fi
    arch=$a
    ac_config+=" --with-cross-build=${dir_cross}"
fi

start

# Filelist
# --------
# include/unicode/curramt.h
# include/unicode/sortkey.h
# include/unicode/unorm.h
# include/unicode/putil.h
# include/unicode/measfmt.h
# include/unicode/fieldpos.h
# include/unicode/uobject.h
# include/unicode/udata.h
# include/unicode/search.h
# include/unicode/udat.h
# include/unicode/numberformatter.h
# include/unicode/normlzr.h
# include/unicode/numberrangeformatter.h
# include/unicode/gregocal.h
# include/unicode/umisc.h
# include/unicode/basictz.h
# include/unicode/upluralrules.h
# include/unicode/stringtriebuilder.h
# include/unicode/umachine.h
# include/unicode/symtable.h
# include/unicode/urename.h
# include/unicode/uregex.h
# include/unicode/rbtz.h
# include/unicode/measure.h
# include/unicode/umsg.h
# include/unicode/bytestriebuilder.h
# include/unicode/unorm2.h
# include/unicode/rep.h
# include/unicode/ucnv_err.h
# include/unicode/uregion.h
# include/unicode/dcfmtsym.h
# include/unicode/ucptrie.h
# include/unicode/idna.h
# include/unicode/ustdio.h
# include/unicode/ubidi.h
# include/unicode/utrace.h
# include/unicode/platform.h
# include/unicode/compactdecimalformat.h
# include/unicode/uldnames.h
# include/unicode/dtfmtsym.h
# include/unicode/bytestream.h
# include/unicode/ucharstrie.h
# include/unicode/parseerr.h
# include/unicode/uchar.h
# include/unicode/tznames.h
# include/unicode/edits.h
# include/unicode/uiter.h
# include/unicode/stsearch.h
# include/unicode/strenum.h
# include/unicode/utf_old.h
# include/unicode/localematcher.h
# include/unicode/caniter.h
# include/unicode/unimatch.h
# include/unicode/tzrule.h
# include/unicode/urep.h
# include/unicode/icudataver.h
# include/unicode/ucnv.h
# include/unicode/currunit.h
# include/unicode/numfmt.h
# include/unicode/char16ptr.h
# include/unicode/coleitr.h
# include/unicode/calendar.h
# include/unicode/uspoof.h
# include/unicode/localpointer.h
# include/unicode/unumsys.h
# include/unicode/tmutamt.h
# include/unicode/ucasemap.h
# include/unicode/ucal.h
# include/unicode/appendable.h
# include/unicode/stringpiece.h
# include/unicode/filteredbrk.h
# include/unicode/stringoptions.h
# include/unicode/parsepos.h
# include/unicode/rbbi.h
# include/unicode/udateintervalformat.h
# include/unicode/translit.h
# include/unicode/dbbi.h
# include/unicode/ufieldpositer.h
# include/unicode/region.h
# include/unicode/udatpg.h
# include/unicode/locdspnm.h
# include/unicode/utf32.h
# include/unicode/uscript.h
# include/unicode/alphaindex.h
# include/unicode/ucharstriebuilder.h
# include/unicode/bytestrie.h
# include/unicode/rbnf.h
# include/unicode/std_string.h
# include/unicode/ulistformatter.h
# include/unicode/ucnv_cb.h
# include/unicode/choicfmt.h
# include/unicode/timezone.h
# include/unicode/ulocdata.h
# include/unicode/normalizer2.h
# include/unicode/format.h
# include/unicode/uloc.h
# include/unicode/utrans.h
# include/unicode/smpdtfmt.h
# include/unicode/uidna.h
# include/unicode/docmain.h
# include/unicode/tmunit.h
# include/unicode/tztrans.h
# include/unicode/dtptngen.h
# include/unicode/utf.h
# include/unicode/msgfmt.h
# include/unicode/udisplaycontext.h
# include/unicode/dtitvfmt.h
# include/unicode/uset.h
# include/unicode/ureldatefmt.h
# include/unicode/utypes.h
# include/unicode/selfmt.h
# include/unicode/localebuilder.h
# include/unicode/uversion.h
# include/unicode/ucat.h
# include/unicode/simpletz.h
# include/unicode/ustream.h
# include/unicode/coll.h
# include/unicode/uchriter.h
# include/unicode/formattedvalue.h
# include/unicode/currpinf.h
# include/unicode/fmtable.h
# include/unicode/uformattedvalue.h
# include/unicode/ucnvsel.h
# include/unicode/gender.h
# include/unicode/listformatter.h
# include/unicode/ubiditransform.h
# include/unicode/uconfig.h
# include/unicode/unistr.h
# include/unicode/unifilt.h
# include/unicode/ptypes.h
# include/unicode/uformattable.h
# include/unicode/ucol.h
# include/unicode/dtintrv.h
# include/unicode/ures.h
# include/unicode/decimfmt.h
# include/unicode/usprep.h
# include/unicode/resbund.h
# include/unicode/locid.h
# include/unicode/unum.h
# include/unicode/errorcode.h
# include/unicode/vtzone.h
# include/unicode/unirepl.h
# include/unicode/ucpmap.h
# include/unicode/ucoleitr.h
# include/unicode/ushape.h
# include/unicode/uenum.h
# include/unicode/simpleformatter.h
# include/unicode/scientificnumberformatter.h
# include/unicode/brkiter.h
# include/unicode/plurrule.h
# include/unicode/reldatefmt.h
# include/unicode/ubrk.h
# include/unicode/uclean.h
# include/unicode/usearch.h
# include/unicode/dtitvinf.h
# include/unicode/dtrule.h
# include/unicode/plurfmt.h
# include/unicode/tmutfmt.h
# include/unicode/umutablecptrie.h
# include/unicode/utmscale.h
# include/unicode/schriter.h
# include/unicode/ucurr.h
# include/unicode/enumset.h
# include/unicode/ustringtrie.h
# include/unicode/utf8.h
# include/unicode/measunit.h
# include/unicode/uvernum.h
# include/unicode/ucsdet.h
# include/unicode/datefmt.h
# include/unicode/chariter.h
# include/unicode/unumberformatter.h
# include/unicode/regex.h
# include/unicode/utext.h
# include/unicode/casemap.h
# include/unicode/usetiter.h
# include/unicode/ustring.h
# include/unicode/fpositer.h
# include/unicode/icuplug.h
# include/unicode/unumberrangeformatter.h
# include/unicode/messagepattern.h
# include/unicode/tblcoll.h
# include/unicode/nounit.h
# include/unicode/uniset.h
# include/unicode/tzfmt.h
# include/unicode/unifunct.h
# include/unicode/ugender.h
# include/unicode/utf16.h
# include/unicode/numsys.h
# lib/pkgconfig/icu-i18n.pc
# lib/pkgconfig/icu-uc.pc
# lib/pkgconfig/icu-io.pc
# lib/libicutu.so.70.1
# lib/libicuio.so.70.1
# lib/libicutest.a
# lib/libicuuc.so.70.1
# lib/libicuuc.a
# lib/libicui18n.so.70.1
# lib/icu/70.1/pkgdata.inc
# lib/icu/70.1/Makefile.inc
# lib/libicui18n.a
# lib/libicutu.a
# lib/libicudata.so.70.1
# lib/libicuio.a
# lib/libicutest.so.70.1
# lib/libicudata.a
# share/man/man1/uconv.1
# share/man/man1/gendict.1
# share/man/man1/pkgdata.1
# share/man/man1/genbrk.1
# share/man/man1/icu-config.1
# share/man/man1/genrb.1
# share/man/man1/makeconv.1
# share/man/man1/gencnval.1
# share/man/man1/derb.1
# share/man/man1/gencfu.1
# share/man/man1/icuexportdata.1
# share/man/man8/icupkg.8
# share/man/man8/gencmn.8
# share/man/man8/gensprep.8
# share/man/man8/genccode.8
# share/icu/70.1/LICENSE
# share/icu/70.1/config/mh-linux
# share/icu/70.1/mkinstalldirs
# share/icu/70.1/install-sh
# sbin/gensprep
# sbin/gencmn
# sbin/gennorm2
# sbin/icupkg
# sbin/escapesrc
# sbin/genccode
# bin/genrb
# bin/makeconv
# bin/icuexportdata
# bin/pkgdata
# bin/gencnval
# bin/gencfu
# bin/gendict
# bin/uconv
# bin/icu-config
# bin/derb
# bin/genbrk
# bin/icuinfo
