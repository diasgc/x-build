#!/bin/bash

lib='flite'
apt='flite'
dsc='A small fast portable speech synthesis system'
lic='GPL-2+'
# src='https://github.com/festvox/flite.git' cfg='ar'
src='https://github.com/Barath-Kannan/flite.git'
cfg='cmake'
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

cmake_config="-DBoost_INCLUDE_DIR=${dir_install_include} -DBoost_LIBRARY_DIR=${dir_install_lib}"
#unset CPPFLAGS CSH
#ac_nosysroot=true
#ac_nopic=true

_source_patch(){
	sed -i 's/MINGWPREF=\"i386-mingw32-\"/MINGWPREF=\"x86_64-w64-mingw32-\"/g' configure
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc