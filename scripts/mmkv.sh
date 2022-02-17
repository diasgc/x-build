#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# fail to build demo

lib='mmkv'
dsc='An efficient, small mobile key-value storage framework developed by WeChat. Works on Android, iOS, macOS, Windows, and POSIX.'
lic='Other'
src='https://github.com/Tencent/MMKV.git'
cfg='cmake'
eta='0'
config_dir='POSIX'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE.TXT'
lst_pc=''

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs='v1.2.12'

. xbuilder.sh

$host_ndk && CPPFLAGS+=" -DMMKV_ANDROID" && LDFLAGS+=" -L/usr/${arch}/lib -llog"

start