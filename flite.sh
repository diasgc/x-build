#!/bin/bash

# ERROR: /usr/bin/install: cannot stat '../bin/flite_time': No such file or directory

lib='flite'
dsc='A small fast portable speech synthesis system'
lic='GPL-2+'
src='https://github.com/festvox/flite.git'

cfg='ac'
WFLAGS='-Wno-void-pointer-to-int-cast
 -Wno-int-to-void-pointer-cast
 -Wno-absolute-value'

dev_bra='main'
dev_vrs=''
pkg_deb='flite'
eta='80'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='copying'
lst_pc='flite.pc flite_cmu_grapheme_lang.pc
 flite_cmu_grapheme_lex.pc flite_cmu_indic_lang.pc
 flite_cmu_indic_lex.pc flite_cmulex.pc flite_cmu_time_awb.pc
 flite_cmu_us_awb.pc flite_cmu_us_kal16.pc flite_cmu_us_kal.pc
 lflite_cmu_us_rms.pc -lflite_cmu_us_slt.pc flite_usenglish.pc'

_on_make(){
    make && make get_voices
}

on_config(){
	dir_build=${dir_src}
}

on_config_ndk(){
	am_config="--with-langvox=android --with-audio=linux --target=${arch}"
}

on_create_pc(){
	for pc in ${lst_pc}; do
		build_pkgconfig --filename=${pc} --libs=-l${pc//\.pc/}
	done
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc
