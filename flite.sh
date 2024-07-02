#!/bin/bash

lib='flite'
dsc='A small fast portable speech synthesis system'
lic='GPL-2+'
src='https://github.com/festvox/flite.git'

cfg='ac'
am_nosysroot=true

WFLAGS='-Wno-void-pointer-to-int-cast
 -Wno-int-to-void-pointer-cast
 -Wno-absolute-value'

on_config(){
	build_dir=${dir_config}
}

_on_config_ndk(){
	am_config="--with-langvox=android --with-audio=linux --target=${arch}"
}
_on_make(){
    make && make get_voices
}

on_create_pc(){
	for l in ${lst_lib}; do
		build_pkgconfig --name=${l} --libs=-l${l}
	done
}

dev_bra='main'
dev_vrs='v2.2'
pkg_deb='flite'
eta='248'

lst_inc='flite/cst_alloc.h flite/cst_args.h
 flite/cst_audio.h flite/cst_cart.h
 flite/cst_cg.h flite/cst_clunits.h
 flite/cst_diphone.h flite/cst_endian.h
 flite/cst_error.h flite/cst_features.h
 flite/cst_ffeatures.h flite/cst_file.h
 flite/cst_hrg.h flite/cst_item.h
 flite/cst_lexicon.h flite/cst_lts.h
 flite/cst_lts_rewrites.h flite/cst_math.h
 flite/cst_phoneset.h flite/cst_regex.h
 flite/cst_relation.h flite/cst_sigpr.h
 flite/cst_socket.h flite/cst_ss.h
 flite/cst_string.h flite/cst_sts.h
 flite/cst_synth.h flite/cst_tokenstream.h
 flite/cst_track.h flite/cst_units.h
 flite/cst_utterance.h flite/cst_utt_utils.h
 flite/cst_val_const.h flite/cst_val_defs.h
 flite/cst_val.h flite/cst_viterbi.h
 flite/cst_voice.h flite/cst_wave.h
 flite/cst_wchar.h flite/flite.h
 flite/flite_version.h'
lst_lib='flite flite_cmu_grapheme_lang
 flite_cmu_grapheme_lex flite_cmu_indic_lang
 flite_cmu_indic_lex flite_cmulex flite_cmu_time_awb
 flite_cmu_us_awb flite_cmu_us_kal16 flite_cmu_us_kal
 lflite_cmu_us_rms flite_cmu_us_slt flite_usenglish'
lst_bin=''
lst_lic='copying'
lst_pc='flite.pc flite_cmu_grapheme_lang.pc
 flite_cmu_grapheme_lex.pc flite_cmu_indic_lang.pc
 flite_cmu_indic_lex.pc flite_cmulex.pc flite_cmu_time_awb.pc
 flite_cmu_us_awb.pc flite_cmu_us_kal16.pc flite_cmu_us_kal.pc
 lflite_cmu_us_rms.pc flite_cmu_us_slt.pc flite_usenglish.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  +   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

