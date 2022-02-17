#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc

lib='open-vcdiff'
dsc='An encoder/decoder for the VCDIFF (RFC3284) format'
lic='Apache-2.0'
src='https://github.com/google/open-vcdiff.git'
src_opt='--recursive'
cfg='cmake'

ls_pcf='vcdenc vcdcom vcddec'
ls_lib='vcdenc vcdcom vcddec'
ls_inc='google/output_string.h google/vcencoder.h
        google/encodetable.h google/vcdecoder.h
        google/codetablewriter_interface.h
        google/format_extension_flags.h jsonwriter.h'
ls_bin='vcdiff'
eta='0'

. xbuilder.sh

start

# Filelist
# --------
# include/google/output_string.h
# include/google/vcencoder.h
# include/google/encodetable.h
# include/google/vcdecoder.h
# include/google/codetablewriter_interface.h
# include/google/format_extension_flags.h
# include/google/jsonwriter.h
# lib/libvcdenc.a
# lib/libvcdcom.a
# lib/libvcdcom.so
# lib/libvcddec.a
# lib/libvcddec.so
# lib/libvcdenc.so
# share/man/man1/vcdiff.1
# bin/vcdiff
