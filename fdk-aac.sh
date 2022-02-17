#!/bin/bash

lib='fdk-aac'
apt='fdkaac'
dsc='A standalone library of the Fraunhofer FDK AAC code from Android'
lic='Other'
src='https://github.com/mstorsjo/fdk-aac.git'
cfg='ag'
eta='180'
cb1="--enable-example"

lst_inc=' fdk-aac/*.h'
lst_lib='libfdk-aac'
lst_bin='aac-enc'
lst_lic='MODULE_LICENSE_FRAUNHOFER OWNERS NOTICE'
lst_pc='fdk-aac.pc'

. xbuilder.sh
  
case $build_tool in
  cmake) cbk="BUILD_PROGRAMS";;
esac

source_patch(){
	local logd="${SRCDIR}/libSBRdec/include/log"
	if [ ! -f "${logd}/log.h" ];then
		mkdir -p ${logd}
		curl "https://android.googlesource.com/platform/system/bt/+/master/linux_include/log/log.h?format=TEXT" | base64 --decode | sed 's/OS_GENERIC/__ANDROID__/' >${logd}/log.h
	fi
}

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU  .  +++  .   .  gcc
# WIN  .   .   .   .  clang/gcc
