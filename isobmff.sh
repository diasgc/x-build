#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  clang/gcc
# WIN  .   .   .   .  clang/gcc

lib='isobmff'
dsc='ISO Base Media File Format Reference Software'
lic='?'
src='https://github.com/MPEGGroup/isobmff.git'
cfg='cmake'

dev_bra='main'
dev_vrs=''
pkg_deb=''
eta='60'


source_patch(){
    git submodule update --init --recursive
}

. xbuild && start

#case $host_sys in
#    linux)   xinclude="-I${dir_src}/IsoLib/libisomediafile/linux";;
#    windows) xinclude="-I${dir_src}/IsoLib/libisomediafile/win32";;
#esac
#xinclude="$xinclude -I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/modules/uniDrcModules/uniDrcBitstreamDecoderLib/include \
#-I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/modules/uniDrcModules/uniDrcCommon -I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/tools/readonlubitbuf/include \
#-I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/tools/wavIO/include -I/${dir_src}/external/Part04-Dynamic_Range_Control/trunk/tools/writeonlubitbuf/include"
#CFLAGS+=" $xinclude" CXXFLAGS+=" $xinclude" CPPFLAGS+=" $xinclude"
#make_args="libisoiff isoiff_tool"