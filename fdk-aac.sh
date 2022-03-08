#!/bin/bash

lib='fdk-aac'
apt='fdkaac'
dsc='A standalone library of the Fraunhofer FDK AAC code from Android'
lic='Other'
src='https://github.com/mstorsjo/fdk-aac.git'
cfg='ag'
eta='180'
ac_bin=" |--enable-example"
cmake_bin='BUILD_PROGRAMS'

lst_inc='fdk-aac/*.h'
lst_lib='libfdk-aac'
lst_bin='aac-enc'
lst_lic='MODULE_LICENSE_FRAUNHOFER OWNERS NOTICE'
lst_pc='fdk-aac.pc'

dev_vrs='2.0.2'

. xbuild

start

# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU  .  +++  .   .  gcc
# WIN  .   .   .   .  clang/gcc

<<'LZS_PATCH'
LQgEBsEsCMGUCEBKATApgYwPSQHbvAK5qbgD2A5iRQHQAWAkAIwCcA7AAzDuNeOjcAuduyHtqwiZNABqbsIBQ0pRBg
IUGbHkLEylXXXoAmdocNcAzF1ahDjAS3vNqAVlbmTz9+xmT5AAT9QLgAab2lGYMZDUADFAGIABwAnAENyAFsU0FI8V
EVMACpQABVaSABnUAAzSHBUUGTSADdINErUdISAFwBPUEhOuvTUHC6Ursgc7KrQFJxkJNJWgH1UJMWkgHUkyC7UABk
KYNAAdzL0Wn7yxVAinFIu0CTUAEcCSGfkbJwVHAIAD2ooAAko9yrRSARwF9oPUprh8ER6glxpccuA+lVSElfgDQNB3
tCgQVMPFIDM0DUcKhkAAKZbLACCADkACKIADywNZDIAlGStEjQAAedDlLrIXBdAB8ilwUGp/VGs3mixWaw2212Bwot
Klx3QOXFoAuKSSBV5oAA3k9UF0CEkfuwANygAC+zrlOAV9SlKoWS2Qq3W2K1e02u1owJwWMO5D1yrG5ANRsepvNoHK
BGgxTSwRuoELReLJdLZfLxal5kMy0e72QKZwxvTRWQ4xS+ekFe7PZ771G1droDbY32I0tVoLz3tjv4nukHviI0lVXk
QA
LZS_PATCH


# Filelist
# --------
# share/doc/fdk-aac/OWNERS
# share/doc/fdk-aac/NOTICE
# share/doc/fdk-aac/MODULE_LICENSE_FRAUNHOFER
# include/fdk-aac/FDK_audio.h
# include/fdk-aac/aacdecoder_lib.h
# include/fdk-aac/genericStds.h
# include/fdk-aac/syslib_channelMapDescr.h
# include/fdk-aac/aacenc_lib.h
# include/fdk-aac/machine_type.h
# lib/pkgconfig/fdk-aac.pc
# lib/libfdk-aac.a
# lib/libfdk-aac.la
# lib/libfdk-aac.so
