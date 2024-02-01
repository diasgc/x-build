#!/bin/bash

lib='flite'
apt='flite'
dsc='A small fast portable speech synthesis system'
lic='GPL-2+'
#src='https://github.com/festvox/flite.git' cfg='ac'
src='https://github.com/Barath-Kannan/flite.git' cfg='cmake'
#src='http://www.festvox.org/flite/packed/flite-2.1/flite-2.1-release.tar.bz2' cfg='ac'
eta='80'
#pc_llibs='-lflite -lflite_cmu_grapheme_lang \
#		 -lflite_cmu_grapheme_lex -lflite_cmu_indic_lang \
#		 -lflite_cmu_indic_lex -lflite_cmulex -lflite_cmu_time_awb \
#		 -lflite_cmu_us_awb -lflite_cmu_us_kal16 -lflite_cmu_us_kal \
#		 -lflite_cmu_us_rms -lflite_cmu_us_slt -lflite_usenglish'
#pc_libsprivate='-lm'
dev_bra='main'
dev_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='copying'
lst_pc=''

. xbuild

#$host_ndk && ac_config="--with-langvox=android --target=$arch"


start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc