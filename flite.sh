#!/bin/bash

# ERROR: /usr/bin/install: cannot stat '../bin/flite_time': No such file or directory

lib='flite'
apt='flite'
dsc='A small fast portable speech synthesis system'
lic='GPL-2+'
#src='https://github.com/festvox/flite.git' cfg='ac'
vrs='v2.2'
src="https://github.com/festvox/flite/archive/refs/tags/${vrs}.tar.gz" cfg='ac'
eta='80'
pc_llibs='-lflite -lflite_cmu_grapheme_lang \
		 -lflite_cmu_grapheme_lex -lflite_cmu_indic_lang \
		 -lflite_cmu_indic_lex -lflite_cmulex -lflite_cmu_time_awb \
		 -lflite_cmu_us_awb -lflite_cmu_us_kal16 -lflite_cmu_us_kal \
		 -lflite_cmu_us_rms -lflite_cmu_us_slt -lflite_usenglish'
pc_libsprivate='-lm'
dev_bra='main'
dev_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='copying'
lst_pc=''

. xbuild

$host_ndk && ac_config="--with-langvox=android --with-audio=linux --target=${arch}"

dir_build=${dir_src}

_on_make(){
    make && make get_voices
}

start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc