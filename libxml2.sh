#!/bin/bash

lib='libxml2'
apt="${lib}-dev"
dsc='GNOME XML library'
lic='GPL'
src='https://gitlab.gnome.org/GNOME/libxml2.git'
cfg='am'
dep='liblzma'
pkg='libxml-2.0'
eta='90'

cmake_config='-DLIBXML2_WITH_TESTS=OFF -DLIBXML2_WITH_PYTHON=OFF'
cmake_bin='LIBXML2_WITH_PROGRAMS'
ac_config='--without-debug --without-python'

dev_bra='master'
dev_vrs='2.9.12'
stb_bra=''
stb_vrs='2.9.12'

lst_inc='libxml2/libxml/*.h'
lst_lib='libxml2'
lst_bin='xmllint xmlcatalog xml2-config'
lst_lic='Copyright'
lst_pc='libxml-2.0.pc'

. xbuilder.sh

before_make(){
  case $build_tool in
    cmake)    sed -i 's/xdocumentationx/xx/g' cmake_install.cmake;;
    automake) sed -i -E '/SUBDIRS/ {s/(doc |examples )//}' Makefile
  esac
}

on_editpack(){
  rm -rf share/doc/libxml2/examples
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/libxml2/libxml/globals.h
# include/libxml2/libxml/parserInternals.h
# include/libxml2/libxml/xmlreader.h
# include/libxml2/libxml/dict.h
# include/libxml2/libxml/relaxng.h
# include/libxml2/libxml/xmlmemory.h
# include/libxml2/libxml/nanoftp.h
# include/libxml2/libxml/xlink.h
# include/libxml2/libxml/xmlautomata.h
# include/libxml2/libxml/xpointer.h
# include/libxml2/libxml/entities.h
# include/libxml2/libxml/SAX2.h
# include/libxml2/libxml/chvalid.h
# include/libxml2/libxml/xpath.h
# include/libxml2/libxml/xmlschemastypes.h
# include/libxml2/libxml/xmlunicode.h
# include/libxml2/libxml/threads.h
# include/libxml2/libxml/parser.h
# include/libxml2/libxml/tree.h
# include/libxml2/libxml/nanohttp.h
# include/libxml2/libxml/HTMLtree.h
# include/libxml2/libxml/list.h
# include/libxml2/libxml/HTMLparser.h
# include/libxml2/libxml/xmlsave.h
# include/libxml2/libxml/encoding.h
# include/libxml2/libxml/SAX.h
# include/libxml2/libxml/xmlschemas.h
# include/libxml2/libxml/xmlexports.h
# include/libxml2/libxml/xmlwriter.h
# include/libxml2/libxml/xmlversion.h
# include/libxml2/libxml/c14n.h
# include/libxml2/libxml/xmlmodule.h
# include/libxml2/libxml/schemasInternals.h
# include/libxml2/libxml/valid.h
# include/libxml2/libxml/xmlIO.h
# include/libxml2/libxml/xpathInternals.h
# include/libxml2/libxml/DOCBparser.h
# include/libxml2/libxml/pattern.h
# include/libxml2/libxml/xmlstring.h
# include/libxml2/libxml/schematron.h
# include/libxml2/libxml/xinclude.h
# include/libxml2/libxml/hash.h
# include/libxml2/libxml/xmlerror.h
# include/libxml2/libxml/uri.h
# include/libxml2/libxml/catalog.h
# include/libxml2/libxml/xmlregexp.h
# include/libxml2/libxml/debugXML.h
# lib/libxml2.so
# lib/pkgconfig/libxml-2.0.pc
# lib/libxml2.la
# lib/cmake/libxml2/libxml2-config.cmake
# lib/libxml2.a
# lib/xml2Conf.sh
# share/man/man1/xml2-config.1
# share/man/man3/libxml.3
# share/doc/libxml2/Copyright
# share/aclocal/libxml.m4
# bin/xmllint
# bin/xmlcatalog
# bin/xml2-config
