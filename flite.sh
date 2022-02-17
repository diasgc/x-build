#!/bin/bash

lib='flite'
apt='flite'
dsc='A small fast portable speech synthesis system'
lic='GPL-2+'
src='https://github.com/festvox/flite.git'
cfg='ac'
eta='80'
ac_nosysroot=true
ac_nopic=true
pc_llibs='-lflite -lflite_cmu_grapheme_lang \
		 -lflite_cmu_grapheme_lex -lflite_cmu_indic_lang \
		 -lflite_cmu_indic_lex -lflite_cmulex -lflite_cmu_time_awb \
		 -lflite_cmu_us_awb -lflite_cmu_us_kal16 -lflite_cmu_us_kal \
		 -lflite_cmu_us_rms -lflite_cmu_us_slt -lflite_usenglish'
pc_libsprivate='-lm'

dev_bra='main'
dev_vrs=''
stb_bra='tags/v2.2'
stb_vrs='v2.2'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

. xbuilder.sh

unset CPPFLAGS CSH
ac_config='--with-pic'

source_patch(){
	sed -i 's/MINGWPREF=\"i386-mingw32-\"/MINGWPREF=\"x86_64-w64-mingw32-\"/g' configure
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc