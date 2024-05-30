#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++ +++  .   .  gcc
# WIN +++  .   .   .  clang/gcc

lib='guetzli'
dsc='Perceptual JPEG encoder'
lic='Apache-2.0'
src='https://github.com/google/guetzli.git'
cfg='cmake'
patch='guetzli-01'
dep='libpng libjpeg'
eta='30'

dev_vrs='1.0.1'

lst_inc=''
lst_lib='libguetzli'
lst_bin='butteraugli'
lst_lic='LICENSE'
lst_pc=''

cmake_static='BUILD_STATIC_LIBS'

on_create_pc(){
    build_pkgconfig --libs=-lguetzli
}

. xbuild && start

# Filelist
# --------
# include/gamma_correct.h
# include/jpeg_data_writer.h
# include/color_transform.h
# include/entropy_encode.h
# include/processor.h
# include/jpeg_data_decoder.h
# include/debug_print.h
# include/score.h
# include/jpeg_huffman_decode.h
# include/butteraugli.h
# include/fdct.h
# include/dct_double.h
# include/jpeg_data.h
# include/quantize.h
# include/jpeg_data_encoder.h
# include/preprocess_downsample.h
# include/jpeg_data_reader.h
# include/fast_log.h
# include/quality.h
# include/jpeg_bit_writer.h
# include/butteraugli_comparator.h
# include/output_image.h
# include/stats.h
# include/jpeg_error.h
# include/idct.h
# include/comparator.h
# lib/pkgconfig/guetzli.pc
# lib/libguetzli.so
# lib/libguetzli.a
# bin/butteraugli
# share/doc/guetzli/LICENSE
