#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .  +++ clang/gcc

lib='sphinxbase'
dsc='CMU Sphinx common libraries'
lic='BSD-2c'
src='https://github.com/cmusphinx/sphinxbase.git'
cfg='ag'
eta='48'

lst_inc='sphinxbase/*.h'
lst_lib='libsphinxad libsphinxbase'
lst_bin='sphinx_jsgf2fsg sphinx_fe sphinx_pitch sphinx_lm_convert sphinx_lm_eval sphinx_cepview sphinx_cont_seg'

ac_config='--without-python'

. xbuilder.sh

$host_mingw && mki='install'

start

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .  +++ clang/gcc


# Filelist
# --------
# include/sphinxbase/f2c.h
# include/sphinxbase/bitarr.h
# include/sphinxbase/err.h
# include/sphinxbase/bio.h
# include/sphinxbase/case.h
# include/sphinxbase/filename.h
# include/sphinxbase/priority_queue.h
# include/sphinxbase/mmio.h
# include/sphinxbase/sphinxbase_export.h
# include/sphinxbase/fsg_model.h
# include/sphinxbase/feat.h
# include/sphinxbase/prim_type.h
# include/sphinxbase/matrix.h
# include/sphinxbase/cmn.h
# include/sphinxbase/fe.h
# include/sphinxbase/strfuncs.h
# include/sphinxbase/glist.h
# include/sphinxbase/jsgf.h
# include/sphinxbase/sbthread.h
# include/sphinxbase/ad.h
# include/sphinxbase/profile.h
# include/sphinxbase/pio.h
# include/sphinxbase/heap.h
# include/sphinxbase/byteorder.h
# include/sphinxbase/listelem_alloc.h
# include/sphinxbase/clapack_lite.h
# include/sphinxbase/bitvec.h
# include/sphinxbase/fixpoint.h
# include/sphinxbase/logmath.h
# include/sphinxbase/yin.h
# include/sphinxbase/agc.h
# include/sphinxbase/cmd_ln.h
# include/sphinxbase/ckd_alloc.h
# include/sphinxbase/ngram_model.h
# include/sphinxbase/genrand.h
# include/sphinxbase/sphinx_config.h
# include/sphinxbase/hash_table.h
# lib/pkgconfig/sphinxbase.pc
# lib/libsphinxad.a
# lib/libsphinxbase.a
# lib/libsphinxbase.la
# lib/libsphinxad.so
# lib/libsphinxbase.so
# lib/libsphinxad.la
# share/man/man1/sphinx_cepview.1
# share/man/man1/sphinx_fe.1
# share/man/man1/sphinx_lm_convert.1
# share/man/man1/sphinx_lm_sort.1
# share/man/man1/sphinx_lm_eval.1
# share/man/man1/sphinx_cont_seg.1
# share/man/man1/sphinx_pitch.1
# share/sphinxbase/swig/fsg_model.i
# share/sphinxbase/swig/jsgf.i
# share/sphinxbase/swig/logmath.i
# share/sphinxbase/swig/typemaps.i
# share/sphinxbase/swig/iterators.i
# share/sphinxbase/swig/feat.i
# share/sphinxbase/swig/cmd_ln.i
# share/sphinxbase/swig/ngram_model.i
# share/sphinxbase/swig/fe.i
# share/sphinxbase/swig/sphinxbase.i
# bin/sphinx_jsgf2fsg
# bin/sphinx_fe
# bin/sphinx_pitch
# bin/sphinx_lm_convert
# bin/sphinx_lm_eval
# bin/sphinx_cepview
# bin/sphinx_cont_seg
