#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   +   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='isobmff'
dsc='ISO Base Media File Format Reference Software'
lic='?'
src='https://github.com/MPEGGroup/isobmff.git'
cfg='cmake'
eta='60'

. xbuilder.sh

#case $host_sys in
#    linux)   xinclude="-I${dir_src}/IsoLib/libisomediafile/linux";;
#    windows) xinclude="-I${dir_src}/IsoLib/libisomediafile/win32";;
#esac
#xinclude="$xinclude -I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/modules/uniDrcModules/uniDrcBitstreamDecoderLib/include \
#-I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/modules/uniDrcModules/uniDrcCommon -I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/tools/readonlubitbuf/include \
#-I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/tools/wavIO/include -I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/tools/writeonlubitbuf/include"
#CFLAGS+=" $xinclude" CXXFLAGS+=" $xinclude" CPPFLAGS+=" $xinclude"
#mkf="libisoiff isoiff_tool"
 
source_patch(){
    git submodule update --init --recursive
}

start
