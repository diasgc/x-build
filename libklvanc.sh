#!/bin/bash

lib='libklvanc'
apt=''
dsc='VANC Processing Framework'
lic='LGPL-2.1'
vrs='0' # no version
src='https://github.com/stoth68000/libklvanc.git'
cfg='ac'
eta='60'

CFG="--disable-tests --enable-rpath --disable-dsd --enable-legacy --with-pic=1"

pc_llib="-lklvanc"

lst_inc='libklvanc/*.h'
lst_lib='libklvanc'
lst_bin='klvanc_eia708 klvanc_genscte104
         klvanc_scte104 klvanc_util klvanc_afd
         klvanc_smpte12_2 klvanc_smpte2038 klvanc_parse'
lst_pc='libklvanc.pc'

. xbuilder.sh

source_patch(){
    ./autogen.sh --build
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------

# include/libklvanc/cache.h
# include/libklvanc/vanc-afd.h
# include/libklvanc/vanc.h
# include/libklvanc/vanc-eia_708b.h
# include/libklvanc/vanc-sdp.h
# include/libklvanc/vanc-eia_608.h
# include/libklvanc/vanc-kl_u64le_counter.h
# include/libklvanc/vanc-lines.h
# include/libklvanc/klrestricted_code_path.h
# include/libklvanc/vanc-scte_104.h
# include/libklvanc/vanc-smpte_12_2.h
# include/libklvanc/vanc-checksum.h
# include/libklvanc/vanc-packets.h
# include/libklvanc/pixels.h
# include/libklvanc/smpte2038.h
# include/libklvanc/did.h
# lib/libklvanc.la
# lib/libklvanc.so
# lib/libklvanc.a
# bin/klvanc_eia708
# bin/klvanc_genscte104
# bin/klvanc_scte104
# bin/klvanc_util
# bin/klvanc_afd
# bin/klvanc_smpte12_2
# bin/klvanc_smpte2038
# bin/klvanc_parse
